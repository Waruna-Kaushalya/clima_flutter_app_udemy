import 'package:flutter/material.dart';
import 'package:clima/services/networking.dart';
import '../services/location.dart';
import 'package:clima/utilities/access_env.dart';

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
    AccessEnv acc = AccessEnv();
    acc.accessEnvData();
    var apiKey = acc.apiKey;
    var urlHeader = acc.apiUrlHeader;

    GetLocationDetails location = GetLocationDetails();
    await location.getCurrentLocation();

    longitude = location.longitude;
    latitude = location.latitude;

    var url = '$urlHeader$latitude&lon=$longitude&appid=$apiKey';

    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();

    String cityName = weatherData['name'];

    print('---------------');
    print(cityName);
    print('---------------');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
