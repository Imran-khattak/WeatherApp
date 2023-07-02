import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherapp/models/forecast.dart';

import 'package:weatherapp/service/get_hourly_update.dart';
import 'package:weatherapp/service/get_nexthourlyforecast.dart';
import 'package:weatherapp/utils/details_glasscontainer.dart';
import 'package:weatherapp/utils/hourly_box.dart';

import 'package:weatherapp/utils/icon_extension.dart';

import '../models/date_and_time.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    IslamabadUpdate isb = IslamabadUpdate();
    ForecastIslamabad forecast = ForecastIslamabad();
    List<Color> color = [
      Colors.green.shade400,
      Colors.green.shade100,
    ];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bg2.png'), fit: BoxFit.cover)),
        child: FutureBuilder(
            future: isb.getHourly(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    DetailsGlassContainer(
                      name: snapshot.data!.name.toString(),
                      date: '${getDateFromTimestamp(snapshot.data!.dt)}',
                      temp: "${snapshot.data!.temp!.toInt()}°",
                      feel: "${snapshot.data!.feel!.toInt()}°",
                      wind: "${snapshot.data!.wind!.toInt()} m/s",
                      humidity: "${snapshot.data!.humidity!.toInt()}%",
                      image: getWeatherBigicon(snapshot.data!.icon.toString()),
                      description: snapshot.data!.description.toString(),
                    ),
                    FutureBuilder(
                        future: forecast.getHourlyForecast(),
                        builder: (context,
                            AsyncSnapshot<List<HourlyForecast>> snapshot) {
                          if (snapshot.hasData) {
                            List<HourlyForecast> list = snapshot.data!.toList();

                            return Container(
                              height: 150.0,
                              child: ListView.builder(
                                  itemCount: list.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => HourlyBox(
                                      width: 80.0,
                                      time: getTimeFromTimestamp(
                                          list[index].time),
                                      temperature:
                                          '${list[index].temperature.toInt()}°',
                                      image: getWeathersmallicon(
                                          list[index].icon.toString()),
                                      height: 130.0)),
                            );
                          } else {
                            return Center(
                              child: Container(),
                            );
                          }
                        })
                  ],
                );
              } else {
                return Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: SpinKitWaveSpinner(
                      color: Colors.green.shade300,
                      size: 100.0,
                    ),
                  ),
                );
              }
            })),
      ),
    );
  }
}
