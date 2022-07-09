import 'package:flutter/material.dart';

import 'networking.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'home.dart';
import 'package:geolocator/geolocator.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}


class _LoadingScreenState extends State<LoadingScreen> {
  double? lat=10;
  double lon=20;








  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(forceAndroidLocationManager: true,desiredAccuracy: LocationAccuracy.best);
  }









  @override
  void initState(){
    super.initState();

    ggetlocationdata();
  }

  void ggetlocationdata() async {
    Position pos=await _determinePosition();


    lat=pos.latitude;
    lon=pos.longitude;
    nethelper net= nethelper('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=7aae069ed0e98f4bb2f7e6622ff7d1ba&units=metric');
    var weatherdata=await net.getData();

    print(weatherdata['main']['temp']);

    //print(weatherdata['main']['temp']);


    var cityname=await Navigator.push(
    context,MaterialPageRoute(builder:
    (context){
    return Home();
    })
    );
    if(cityname!=null){

    }
    // print(loc.lat);
    print(cityname);
    // print(loc.long);
  }









  @override
  Widget build(BuildContext context) {
ggetlocationdata();

    return Scaffold(
      body: Center(
        child: SpinKitWanderingCubes(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
