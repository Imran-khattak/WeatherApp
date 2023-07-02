import 'dart:convert';

import 'package:weatherapp/models/hourly_forecast.dart';
import 'package:http/http.dart' as http;

class IslamabadUpdate {
  Future<Hourly> getHourly() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=islamabad&appid=776745ec8bd02ca7e84c1fec3b94c889'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());

      return Hourly.fromJSON(data);
    } else {
      throw ("something went wrong");
    }
  }
}

class Londondaily {
  Future<Hourly> getHourly() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=london&appid=776745ec8bd02ca7e84c1fec3b94c889'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());

      return Hourly.fromJSON(data);
    } else {
      throw ("something went wrong");
    }
  }
}

class Torontodaily {
  Future<Hourly> getHourly() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=toronto&appid=776745ec8bd02ca7e84c1fec3b94c889'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());

      return Hourly.fromJSON(data);
    } else {
      throw ("something went wrong");
    }
  }
}

class Nuukdaily {
  Future<Hourly> getHourly() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=nuuk&appid=776745ec8bd02ca7e84c1fec3b94c889'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());

      return Hourly.fromJSON(data);
    } else {
      throw ("something went wrong");
    }
  }
}
