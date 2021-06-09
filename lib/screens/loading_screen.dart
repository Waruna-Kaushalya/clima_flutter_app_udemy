import 'package:flutter/material.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import '../services/location.dart';
import 'package:clima/utilities/access_env.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  static const routeName = '/loadingScreen';
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  var apiKey;
  var urlHeader;
  @override
  void initState() {
    super.initState();
    getEnvVaribles();
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

    checkDataStatus(weatherData);

    // Navigator.pushNamed(context, '/second');

    Navigator.pushNamed(
      context,
      LocationScreen.routeName,
      arguments: ScreenArguments(weatherData),
    );

    // Navigator.pushNamed(
    //   context,
    //   LoadingScreen.,
    //   arguments: ScreenArguments(
    //     'Extract Arguments Screen',
    //     'This message is extracted in the build method.',
    //   ),
    // );
  }

  void getEnvVaribles() {
    AccessEnv acc = AccessEnv();
    acc.accessEnvData();
    apiKey = acc.apiKey;
    urlHeader = acc.apiUrlHeader;
  }

  void checkDataStatus(var weatherData) {
    try {
      String cityName = weatherData['name'];
      print('---------------');
      print(cityName);
      print('---------------');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCube(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven ? Colors.red : Colors.green,
              ),
            );
          },
        ),
      ),
    );
  }
}
