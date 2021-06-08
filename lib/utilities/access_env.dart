import 'package:flutter_dotenv/flutter_dotenv.dart';

class AccessEnv {
  var apiKey;
  var apiUrlHeader;

  void accessEnvData() {
    try {
      apiKey = dotenv.env['API_KEY'];
      apiUrlHeader = dotenv.env['WEATHER_API_URL_HEADER'];
    } catch (e) {
      print(e);
    }
  }
}
