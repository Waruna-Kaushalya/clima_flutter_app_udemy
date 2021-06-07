import 'package:flutter/material.dart';

import 'location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    GetLocationDetails locatn = GetLocationDetails();
    await locatn.getCurrentLocation();

    print(locatn.latitude);
    print(locatn.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
