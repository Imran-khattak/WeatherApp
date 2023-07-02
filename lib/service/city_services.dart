import 'dart:convert';

import 'package:weatherapp/models/city_model.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/service/base_url.dart';

class CityUpdate {
  Future<DailyForecast> getCityDaily(String? location) async {
    String finalLocation = location!.toLowerCase();

    final response =
        await http.get(Uri.parse(ApiURLupdate().getLocation(finalLocation)));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      return DailyForecast.fromJSON(json);
    } else {
      throw ("Something went wrong");
    }
  }
}

class CityForecast {
  Future<List<HourlyForecast>> getCityForecast(String? location) async {
    String finalLocation = location!.toLowerCase();

    final response =
        await http.get(Uri.parse(ApiURLforecast().getLocation(finalLocation)));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      List<dynamic> body = json['list'];
      List<HourlyForecast> forecast =
          body.map((dynamic item) => HourlyForecast.fromJson(item)).toList();
      return forecast;
    } else {
      throw ('something went wrong');
    }
  }
}
