import 'package:flutter/material.dart';
import '../data/hero_tag.dart';
import '../data/locations.dart';
import '../models/location.dart';
import 'hero_widget.dart';

class ReviewsWidget extends StatelessWidget {
  const ReviewsWidget({
    super.key,
    required this.location,
    required this.animation,
  });

  final Location location;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: location.reviews.length,
      padding: const EdgeInsets.all(16),
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final review = location.reviews[index];

        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) => FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve: const Interval(0.2, 1, curve: Curves.easeInExpo),
            ),
            child: child,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeroWidget(
                      tag: HeroTag.avatar(
                        review,
                        locations.indexOf(location),
                      ),
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.black12,
                        backgroundImage: AssetImage(review.urlImage),
                      ),
                    ),
                    Text(
                      review.username,
                      style: const TextStyle(
                        fontSize: 17,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(),
                    Text(
                      review.date,
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const Icon(Icons.thumb_up_alt_outlined, size: 14),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  review.description,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
