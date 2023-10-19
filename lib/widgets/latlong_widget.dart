import 'package:flutter/material.dart';
import '../models/location.dart';

class LatLongWiget extends StatelessWidget {
  const LatLongWiget({
    super.key,
    required this.location,
  });

  final Location location;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          location.latitude,
          style: const TextStyle(
            color: Colors.white70,
            fontFamily: 'Poppins',
          ),
        ),
        const Icon(Icons.location_on, color: Colors.white70),
        Text(
          location.longitude,
          style: const TextStyle(
            color: Colors.white70,
            fontFamily: 'Poppins',
          ),
        )
      ],
    );
  }
}
