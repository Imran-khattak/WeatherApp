import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HourlyBox extends StatelessWidget {
  String time;
  String temperature;
  Widget image;
  double height;
  double width;

  HourlyBox(
      {super.key,
      required this.width,
      required this.time,
      required this.temperature,
      required this.image,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: height,
          width: width,
          child: Stack(
            children: [
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
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
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
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      time,
                      style: GoogleFonts.lato(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: image,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      temperature,
                      style: GoogleFonts.lato(color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
