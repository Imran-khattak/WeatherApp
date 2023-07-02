import 'package:flutter/material.dart';

class DailyForecast {
  String? name;
  final dt;

  String? description;
  double? temp;
  int? humidity;
  double? wind;
  double? feel;
  String? icon;

  DailyForecast(
      {this.name,
      this.dt,
      this.description,
      this.temp,
      this.humidity,
      this.wind,
      this.icon,
      this.feel});

  factory DailyForecast.fromJSON(Map<String, dynamic> json) {
    try {
      return DailyForecast(
        name: json["name"],
        dt: json["dt"],
        description: json["weather"][0]["description"],
        temp: json["main"]["temp"] - 273.15,
        humidity: json["main"]["humidity"],
        wind: json["wind"]["speed"].toDouble(),
        feel: json["main"]["feels_like"].toDouble() - 273.15,
        icon: json["weather"][0]["icon"],
      );
    } catch (e) {
      throw (" city not found");
    }
  }
}

class HourlyForecast {
  final time;
  final double temperature;
  final String icon;

  HourlyForecast({
    required this.time,
    required this.temperature,
    required this.icon,
  });

  factory HourlyForecast.fromJson(Map<String, dynamic> json) {
    try {
      return HourlyForecast(
        time: json['dt'],
        temperature: json['main']['temp'] - 273.15,
        icon: json['weather'][0]['icon'],
      );
    } catch (e) {
      throw ('some went wrong');
    }
  }
}
