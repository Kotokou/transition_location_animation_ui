import '../models/location.dart';
import 'reviews.dart';

List<Location> locations = [
  Location(
    name: 'ATCOASTAL',
    urlImage: 'assets/images/sea.jpg',
    addressLine1: 'La Cresenta-Montrose, CA91020 Glendale',
    addressLine2: 'NO. 791187',
    starRating: 4,
    latitude: 'NORTH LAT 24',
    longitude: 'EAST LNG 17',
    reviews: Reviews.allReviews,
  ),
  Location(
    name: 'SYRACUSE',
    urlImage: 'assets/images/mountain.jpg',
    addressLine1: 'La Cresenta-Montrose, CA91020 Glendale',
    addressLine2: 'NO. 11641',
    starRating: 4,
    latitude: 'SOUTH LAT 14',
    longitude: 'EAST LNG 27',
    reviews: Reviews.allReviews,
  ),
  Location(
    name: 'OCEANIC',
    urlImage: 'assets/images/sea2.jpg',
    addressLine1: 'La Cresenta-Montrose, CA91020 Glendale',
    addressLine2: 'NO. 791187',
    starRating: 4,
    latitude: 'NORTH LAT 24',
    longitude: 'WEST LNG 08',
    reviews: Reviews.allReviews,
  ),
  Location(
    name: 'MOUNTAINOUS',
    urlImage: 'assets/images/mountain2.jpg',
    addressLine1: 'La Cresenta-Montrose, CA91020 Glendale',
    addressLine2: 'NO. 791187',
    starRating: 4,
    latitude: 'SOUTH LAT 39',
    longitude: 'WEST LNG 41',
    reviews: Reviews.allReviews,
  ),
];
