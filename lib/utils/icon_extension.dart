import 'package:flutter/material.dart';

Image getWeatherIcon(String _icon) {
  String path = "images/";
  String imageExtension = ".png";
  return Image.asset(
    path + _icon + imageExtension,
    height: 130,
  );
}

Image getWeatherBigicon(String _icon) {
  String path = "images/";
  String imageExtension = ".png";
  return Image.asset(
    path + _icon + imageExtension,
    height: 230,
  );
}

Image getWeathersmallicon(String _icon) {
  String path = "images/";
  String imageExtension = ".png";
  return Image.asset(
    path + _icon + imageExtension,
    height: 50,
  );
}
