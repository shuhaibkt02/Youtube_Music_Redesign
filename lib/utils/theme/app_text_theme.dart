import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: appColorBlack),
  scaffoldBackgroundColor: appColorBlack,
  useMaterial3: true,
  textTheme: TextTheme(
    titleLarge: titleLarge,
    bodyMedium: bodyMedium,
    bodySmall: bodySmall,
  ),
  fontFamily: 'Gilroy',
);

TextStyle titleLarge = const TextStyle(
  color: appColorWhite,
  fontSize: 90,
  letterSpacing: 2.9,
  fontWeight: FontWeight.bold,
  fontFamily: 'Gilroy',
);

TextStyle bodyMedium = const TextStyle(
  color: appColorWhite,
  fontSize: 16.5,
  letterSpacing: 0.5,
  fontWeight: FontWeight.w600,
  fontFamily: 'Gilroy',
);
TextStyle bodySmall = const TextStyle(
  fontSize: 12,
  fontFamily: 'Gilroy',
  color: appColorWhite,
  fontWeight: FontWeight.w500,
);

const appColorWhite = Color(0xffffffff);
const appColorGrey = Color(0xff9f9f9f);
const appColorDarkGey = Color(0xff272727);
const appColorBlack = Color(0xff101010);
const appColorRed = Color(0xffCA2828);
