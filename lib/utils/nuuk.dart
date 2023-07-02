import 'package:flutter/material.dart';
import 'package:weatherapp/service/get_weather_update.dart';
import 'package:weatherapp/utils/glassmorphism.dart';
import 'package:weatherapp/utils/icon_extension.dart';

class NuuKPage extends StatelessWidget {
  const NuuKPage({super.key});

  @override
  Widget build(BuildContext context) {
    NuukWeather nuuk = NuukWeather();

    return FutureBuilder(
        future: nuuk.getWeather(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
