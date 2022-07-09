import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class pos{
  late Position p;
  late double long,lat;

  void getlocation() async {


    LocationPermission permission = await Geolocator.requestPermission();





    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    long=position.longitude;
    lat=position.latitude;
  }



}

