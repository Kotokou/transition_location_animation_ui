import 'package:flutter/material.dart';

class StarsWidget extends StatelessWidget {
  const StarsWidget({
    super.key,
    required this.stars,
  });

  final int stars;

  @override
  Widget build(BuildContext context) {
    final allStars = List.generate(stars, (index) => index);
    return Row(
      children: allStars
          .map(
            (e) => Container(
              margin: const EdgeInsets.only(right: 4),
              child: const Icon(
                Icons.star_rate,
                size: 18,
                color: Colors.blueGrey,
              ),
            ),
          )
          .toList(),
    );
  }
}
