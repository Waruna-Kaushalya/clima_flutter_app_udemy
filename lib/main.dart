import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/screens/loading_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:clima/screens/city_screen.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      // home: LoadingScreen(),

      initialRoute: LoadingScreen.routeName,
      routes: {
        LoadingScreen.routeName: (context) => LoadingScreen(),
        LocationScreen.routeName: (context) => LocationScreen(),
        CityScreen.routeName: (context) => CityScreen()
      },
    );
  }
}
