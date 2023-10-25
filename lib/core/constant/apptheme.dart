import 'package:flutter/material.dart';

import 'color.dart';

ThemeData themEnglish =ThemeData(
  textTheme: TextTheme(
    displayLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: AppColors.black),
    bodySmall: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 16,
        color: AppColors.black),
    bodyLarge: TextStyle(
        height: 2,
        color: AppColors.grey,
        fontSize: 14),
  ),
  primarySwatch: Colors.blue,
);
ThemeData themArabic =ThemeData(
  fontFamily: "Cairo",
  textTheme: TextTheme(
    displayLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: AppColors.black),
    bodySmall: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: AppColors.black),
    bodyLarge: TextStyle(
        height: 2,
        color: AppColors.grey,
        fontSize: 14),
  ),
  primarySwatch: Colors.blue,
);