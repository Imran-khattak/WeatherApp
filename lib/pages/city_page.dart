import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherapp/models/city_model.dart';
import 'package:weatherapp/service/city_services.dart';
import 'package:weatherapp/utils/details_glasscontainer.dart';
import 'package:weatherapp/utils/hourly_box.dart';

import 'package:weatherapp/utils/icon_extension.dart';

import '../models/date_and_time.dart';

class CityPage extends StatefulWidget {
  final String name;
  CityPage({super.key, required this.name});

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  CityUpdate cityUpdate = CityUpdate();
  CityForecast cityForecast = CityForecast();
  // late Future<DailyForecast> _dailyForecastFuture;
  //late Future<List<HourlyForecast>> _hourlyForecastFuture;
  // @override
  // void initState() {
  //   super.initState();
  //   _dailyForecastFuture = CityUpdate().getCityDaily(widget.name);
  //   _hourlyForecastFuture = CityForecast().getCityForecast(widget.name);
  // }

  @override
  Widget build(BuildContext context) {
    String cityweather = widget.name.toString();
    String cityforecast = widget.name.toString();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bg2.png'), fit: BoxFit.cover)),
        child: FutureBuilder(
            future: cityUpdate.getCityDaily(cityweather),
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
                        future: cityForecast.getCityForecast(cityforecast),
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
