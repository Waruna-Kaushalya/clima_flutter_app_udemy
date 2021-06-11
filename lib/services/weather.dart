import 'package:clima/services/networking.dart';
import '../services/location.dart';
import 'package:clima/utilities/access_env.dart';

class WeatherModel {
  AccessEnv acc = AccessEnv();
  Future<dynamic> getCityWeather(String cityname) async {
    acc.accessEnvData();
    var url =
        '${acc.apiUrlHeader}q= $cityname&appid=${acc.apiKey}&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    acc.accessEnvData();
    GetLocationDetails location = GetLocationDetails();
    await location.getCurrentLocation();

    var url =
        '${acc.apiUrlHeader}lat=${location.latitude}&lon=${location.longitude}&appid=${acc.apiKey}&units=metric';

    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    checkDataStatus(weatherData);
    return weatherData;
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

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
