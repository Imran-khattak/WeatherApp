import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsGlassContainer extends StatelessWidget {
  String date;
  String name;
  String description;
  String temp;
  String wind;
  Widget image;
  String feel;
  String humidity;
  DetailsGlassContainer(
      {super.key,
      required this.date,
      required this.name,
      required this.description,
      required this.temp,
      required this.wind,
      required this.image,
      required this.feel,
      required this.humidity});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.more_vert,
                  color: Colors.white,
                )
              ],
            ),
          ),
          Text(
            name,
            style: GoogleFonts.lato(
                fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            date,
            style: GoogleFonts.lato(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: image,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              temp,
              style: GoogleFonts.lato(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              description,
              style: GoogleFonts.lato(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                  height: 100,
                  child: Stack(children: [
                    //blur effect...
                    BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 2,
                        sigmaY: 2,
                      ),
                      child: Container(),
                    ),

                    //gradient effect...
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.white.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withOpacity(0.3),
                                Colors.white.withOpacity(0.1)
                              ])),
                    ),
                    //child
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, top: 12, right: 25),
                          child: Column(
                            children: [
                              Text(
                                "WIND",
                                style: GoogleFonts.lato(
                                    fontSize: 15, color: Colors.grey.shade100),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                wind,
                                style: GoogleFonts.lato(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                          indent: 15,
                          endIndent: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 12, right: 10),
                          child: Column(
                            children: [
                              Text(
                                "FEElS LIKE",
                                style: GoogleFonts.lato(
                                    fontSize: 15, color: Colors.grey.shade100),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                feel,
                                style: GoogleFonts.lato(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                          indent: 15,
                          endIndent: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 25, top: 12, right: 20),
                          child: Column(
                            children: [
                              Text(
                                "HUMIDITY",
                                style: GoogleFonts.lato(
                                    fontSize: 15, color: Colors.grey.shade100),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                humidity,
                                style: GoogleFonts.lato(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ])),
            ),
          ),
          // HourlyBox(
          //   height: 130,
          //   width: 70,
          //   time: '3:40',
          //   temperature: '34',
          //   image: Image.asset('images/01d.png'),
          // ),
          //HourlyData(),
        ],
      ),
    );
  }
}
