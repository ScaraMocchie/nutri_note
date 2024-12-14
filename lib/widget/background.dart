import 'package:flutter/material.dart';

Container Background1(double height, double width) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffFF9156), Color(0xffFFCFB6)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
            
        child: SizedBox(
          height: height,
          width: width,
        ),
      );
  }