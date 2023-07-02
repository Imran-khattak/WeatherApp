import 'package:flutter/material.dart';
import 'package:weatherapp/pages/city_page.dart';
import 'package:weatherapp/pages/details_screen.dart';

import 'package:weatherapp/utils/details_glasscontainer.dart';
import 'package:weatherapp/utils/glassmorphism.dart';
import 'package:weatherapp/utils/islamabad.dart';
import 'package:weatherapp/utils/london.dart';
import 'package:weatherapp/utils/london_forecast.dart';
import 'package:weatherapp/utils/nuuk.dart';
import 'package:weatherapp/utils/nuuk_forecast.dart';
import 'package:weatherapp/utils/toronto.dart';
import 'package:weatherapp/utils/toronto_forecast.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  String? searchQuery;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void searchCity() {
    if (searchQuery != null && searchQuery!.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CityPage(name: searchQuery!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/bg2.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: TextFormField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                      print(searchQuery);
                    });
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: 'Search for a city',
                      hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.3),
                      suffixIcon: GestureDetector(
                        onDoubleTap: searchCity,
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LondonForecast()));
                        },
                        child: const LondonPage()),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TorontoForecast()));
                        },
                        child: const TorontPage()),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DetailsPage()));
                        },
                        child: const IslamabadPage()),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NuukForecast()));
                        },
                        child: const NuuKPage()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
