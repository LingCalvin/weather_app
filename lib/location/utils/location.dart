import 'package:geolocator/geolocator.dart';

Future<Position> getCurrentPosition() async {
  final bool isLocationServiceEnabled =
      await Geolocator.isLocationServiceEnabled();

  if (!isLocationServiceEnabled) {
    Future.error('Location service not enabled');
  }

  LocationPermission locationPermission = await Geolocator.checkPermission();

  if (locationPermission == LocationPermission.denied) {
    locationPermission = await Geolocator.requestPermission();
  }

  if (locationPermission == LocationPermission.denied) {
    return Future.error('Location permission denied');
  }

  if (locationPermission == LocationPermission.deniedForever) {
    return Future.error('Location permission permanently denied');
  }

  return await Geolocator.getCurrentPosition();
}
