import 'package:flutter/material.dart';
import '../data/hero_tag.dart';
import '../models/location.dart';
import 'hero_widget.dart';
import 'stars_widget.dart';

class DetailInfoWidget extends StatelessWidget {
  const DetailInfoWidget({
    super.key,
    required this.location,
  });

  final Location location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeroWidget(
            tag: HeroTag.addressLine1(location),
            child: Text(
              location.addressLine1,
              style: const TextStyle(
                color: Colors.black45,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          const SizedBox(height: 8),
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
          const SizedBox(height: 8),
          HeroWidget(
            tag: HeroTag.stars(location),
            child: StarsWidget(stars: location.starRating),
          ),
        ],
      ),
    );
  }
}
