import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/networking.dart';
import 'location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    GetLocationDetails location = GetLocationDetails();
    await location.getCurrentLocation();

    longitude = location.longitude;
    latitude = location.latitude;

    var url = '$urlHeader$latitude&lon=$longitude&appid=$apiKey';

    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    print(weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
