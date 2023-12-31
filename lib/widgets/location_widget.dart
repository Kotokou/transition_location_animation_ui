import 'package:flutter/material.dart';
import '../models/location.dart';
import '../views/detail_view.dart';
import 'expanded_widget.dart';
import 'image_widget.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({
    super.key,
    required this.location,
  });

  final Location location;

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            bottom: isExpanded ? 40 : 100,
            width: isExpanded ? width * .78 : width * .7,
            height: isExpanded ? height * .6 : height * .5,
            duration: const Duration(milliseconds: 500),
            child: ExpandedWidget(location: widget.location),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            bottom: isExpanded ? 150 : 100,
            child: GestureDetector(
              onTap: () {
                if (!isExpanded) {
                  setState(() => isExpanded = true);
                  return;
                }

                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: const Duration(seconds: 1),
                    reverseTransitionDuration: const Duration(seconds: 1),
                    pageBuilder: (context, animation, secondaryAnimation) {
                      final curveAnimation = CurvedAnimation(
                        parent: animation,
                        curve: const Interval(0, .5),
                      );
                      return FadeTransition(
                        opacity: curveAnimation,
                        child: DetailView(
                          location: widget.location,
                          animation: animation,
                        ),
                      );
                    },
                  ),
                );
              },
              onPanUpdate: (details) {
                if (details.delta.dy < 0) {
                  setState(() {
                    isExpanded = true;
                  });
                } else if (details.delta.dy > 0) {
                  setState(() {
                    isExpanded = false;
                  });
                }
              },
              child: ImageWidget(location: widget.location),
            ),
          ),
        ],
      ),
    );
  }
}
