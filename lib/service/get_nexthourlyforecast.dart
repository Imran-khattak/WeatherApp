import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/models/forecast.dart';

class ForecastIslamabad {
  Future<List<HourlyForecast>> getHourlyForecast() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=islamabad&appid=776745ec8bd02ca7e84c1fec3b94c889'));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<dynamic> data = jsonData['list'];

      List<HourlyForecast> forecasts =
          data.map((dynamic item) => HourlyForecast.fromJson(item)).toList();

      return forecasts;
    } else {
      throw ('something went wrong');
    }
  }
}

class ForecastLondon {
  Future<List<HourlyForecast>> getHourlyForecast() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=london&appid=776745ec8bd02ca7e84c1fec3b94c889'));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<dynamic> data = jsonData['list'];

      List<HourlyForecast> forecasts =
          data.map((dynamic item) => HourlyForecast.fromJson(item)).toList();

      return forecasts;
    } else {
      throw ('something went wrong');
    }
  }
}

class ForecastToronto {
  Future<List<HourlyForecast>> getHourlyForecast() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=toronto&appid=776745ec8bd02ca7e84c1fec3b94c889'));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<dynamic> data = jsonData['list'];

      List<HourlyForecast> forecasts =
          data.map((dynamic item) => HourlyForecast.fromJson(item)).toList();

      return forecasts;
    } else {
      throw ('something went wrong');
    }
  }
}

class ForecastNuuk {
  Future<List<HourlyForecast>> getHourlyForecast() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=nuuk&appid=776745ec8bd02ca7e84c1fec3b94c889'));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<dynamic> data = jsonData['list'];

      List<HourlyForecast> forecasts =
          data.map((dynamic item) => HourlyForecast.fromJson(item)).toList();

      return forecasts;
    } else {
      throw ('something went wrong');
    }
  }
}
