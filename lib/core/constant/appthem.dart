import 'package:flutter/material.dart';
import 'package:monitoringdata_excel/core/constant/appColors.dart';

ThemeData themArabic = ThemeData(
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 25,
          fontFamily: "Cairo",
          color: AppColors.blackColor,
          fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(
        color: AppColors.gry,
        fontSize: 20,
        height: 1.3,
        fontFamily: "Cairo",
      ),
    ));

ThemeData themEnglish = ThemeData(
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 25,
          fontFamily: "playFireDisplay",
          color: AppColors.blackColor,
          fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(
        color: AppColors.gry,
        fontSize: 20,
        height: 1.3,
        fontFamily: "Cairo",
      ),
    ));
