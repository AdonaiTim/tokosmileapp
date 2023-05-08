import 'dart:ui';

import 'package:flutter/material.dart';

//Dark Mode
const Color darkPrimary = Color(0xff040303);
const Color darkAccentPrimary = Color(0xff8d99b9);
const Color darkAccent2Primary = Color(0xff68739b);

// Light Mode
const Color primaryColor = Color(0xff00b598);
const Color darkprimaryColor = Color(0xff2d2e44);
const Color blackColor = Color(0xff040303);
const Color primaryHighlightColor = Color(0xffe45f87);
const Color secondaryHighlightColor = Color(0xfff1a873);
const Color lightHighlightColor = Color(0xffd1c1be);
const pageBackgroundColor = Color(0xffF5F5F5);
const pageBackgroundColor2 = Color(0xfff0f0f0);
const whiteColor = Color(0xffFFFFFF);
const greybg = Color(0xffdedede);
const ratingColor = Color(0xffff9900);
const ratingColor2 = Color(0xff0a9b7f);


const Color cosmetics =  Color(0xfff6d7e1);

//sizes
const double iconSize = 20.0;
const double iconSizeMedium = 30.0;

//font sizes
const double small = 10;
const double medium = 16;
const double large = 35;


//create swatch
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }

  return MaterialColor(color.value, swatch);
}
