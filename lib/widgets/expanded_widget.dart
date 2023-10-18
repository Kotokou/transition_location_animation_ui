import 'package:flutter/material.dart';
import '../models/location.dart';
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
          Text(location.addressLine1),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                location.addressLine2,
                style: const TextStyle(color: Colors.black45),
              ),
              StarsWidget(stars: location.starRating),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: location.reviews
                .map((review) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.black12,
                        backgroundImage: AssetImage(review.urlImage),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
