import 'package:flutter/material.dart';
import 'package:weatherapp/service/get_weather_update.dart';
import 'package:weatherapp/utils/glassmorphism.dart';
import 'package:weatherapp/utils/icon_extension.dart';

class LondonPage extends StatelessWidget {
  const LondonPage({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherUpdate weatherapi = WeatherUpdate();

    return FutureBuilder(
        future: weatherapi.getWeather(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Set gradient color based on weather conditions

            return Column(
              children: [
                GlassContainer(
                  height: 150.0,
                  location: snapshot.data!.name.toString(),
                  update: snapshot.data!.update.toString(),
                  temperature: '${snapshot.data!.temp!.toInt()}°',
                  image: getWeatherIcon(snapshot.data!.icon.toString()),
                ),
              ],
            );
          } else {
            return Container();
          }
        });
  }
}
