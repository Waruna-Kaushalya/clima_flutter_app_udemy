import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  static const routeName = '/locationScreen';

  LocationScreen({this.locationWeather});
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  double temperature;
  String cityName;
  int condition;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(widget.locationWeather);
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    temperature = weatherData['main']['temp'];
    cityName = weatherData['name'];
    condition = weatherData['weather'][0]['id'];
  }

  @override
  Widget build(BuildContext context) {
    //TODO: state1
    // final args = ModalRoute.of(context).settings.arguments as ScreenArguments;
    // var tweatherDataMap = args.weatherData;
    // double temperature = tweatherDataMap['main']['temp'];
    // String cityName = tweatherDataMap['name'];
    // int condition = tweatherDataMap['weather'][0]['id'];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${temperature.toStringAsFixed(0)}°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '☀️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "It's 🍦 time in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//TODO: state1
// class ScreenArguments {
//   final weatherData;
//   ScreenArguments(this.weatherData);
// }

// double temperature = decodedData['main']['temp'];
// String cityName = decodedData['name'];
// int condition = decodedData['weather'][0]['id'];
