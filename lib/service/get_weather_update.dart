import 'dart:convert';

import 'package:weatherapp/models/current_weather_models.dart';
import 'package:http/http.dart' as http;

class WeatherUpdate {
  Future<WeatherModels> getWeather() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=london&appid=776745ec8bd02ca7e84c1fec3b94c889'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());

      return WeatherModels.fromJSON(data);
    } else {
      throw ('something went wrong');
    }
  }
}

class IslamabadWeather {
  Future<WeatherModels> getWeather() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=islamabad&appid=776745ec8bd02ca7e84c1fec3b94c889'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());

      return WeatherModels.fromJSON(data);
    } else {
      throw ('something went wrong');
    }
  }
}

class TorontoWeather {
  Future<WeatherModels> getWeather() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=toronto&appid=776745ec8bd02ca7e84c1fec3b94c889'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());

      return WeatherModels.fromJSON(data);
    } else {
      throw ('something went wrong');
    }
  }
}

class NuukWeather {
  Future<WeatherModels> getWeather() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=nuuk&appid=776745ec8bd02ca7e84c1fec3b94c889'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());

      return WeatherModels.fromJSON(data);
    } else {
      throw ('something went wrong');
    }
  }
}
