import 'package:flutter/material.dart';
import '../models/location.dart';
import '../data/hero_tag.dart';
import '../widgets/detail_info_widget.dart';
import '../widgets/hero_widget.dart';
import '../widgets/latlong_widget.dart';
import '../widgets/reviews_widget.dart';

class DetailView extends StatelessWidget {
  const DetailView({
    super.key,
    required this.location,
    required this.animation,
  });

  final Location location;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'INTERESTS',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.search_outlined),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox.expand(
                  child: HeroWidget(
                    tag: HeroTag.image(location.urlImage),
                    child: Image.asset(
                      location.urlImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: LatLongWiget(location: location),
                ),
              ],
            ),
          ),
          DetailInfoWidget(location: location),
          Expanded(
            flex: 5,
            child: ReviewsWidget(
              location: location,
              animation: animation,
            ),
          ),
        ],
      ),
    );
  }
}
