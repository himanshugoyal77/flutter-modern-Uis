import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

Future<LatLng> getCurrentPosition() async {
  LocationPermission permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    LocationPermission asked = await Geolocator.requestPermission();
  } else {
    Position currenPostion = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    print(currenPostion);
    return LatLng(currenPostion.latitude, currenPostion.longitude);
  }

  return LatLng(51.509364, -0.128928);
}

class LocationController extends GetxController {
  LatLng currentPosition = LatLng(51.509364, -0.128928);
  RxDouble lat = 0.0.obs;
  RxDouble lon = 0.0.obs;

  void updateCurrentPosition() async {
    currentPosition = await getCurrentPosition();
    lat = currentPosition.latitude.obs;
    lon = currentPosition.longitude.obs;
    print(lat);
    update();
  }

  LatLng getPosition() {
    refresh();
    return LatLng(lat.value, lon.value);
  }
}
