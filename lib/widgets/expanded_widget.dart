import 'package:flutter/material.dart';
import '../data/hero_tag.dart';
import '../data/locations.dart';
import '../models/location.dart';
import 'hero_widget.dart';
import 'stars_widget.dart';

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({
    super.key,
    required this.location,
  });

  final Location location;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          HeroWidget(
            tag: HeroTag.addressLine1(location),
            child: Text(
              location.addressLine1,
              style: const TextStyle(fontFamily: 'Poppins'),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeroWidget(
                tag: HeroTag.addressLine2(location),
                child: Text(
                  location.addressLine2,
                  style: const TextStyle(
                    color: Colors.black45,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              HeroWidget(
                tag: HeroTag.stars(location),
                child: StarsWidget(stars: location.starRating),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: location.reviews.map((review) {
              final pageIndex = locations.indexOf(location);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: HeroWidget(
                  tag: HeroTag.avatar(review, pageIndex),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.black12,
                    backgroundImage: AssetImage(review.urlImage),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
