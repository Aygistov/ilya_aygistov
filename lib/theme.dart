import 'package:flutter/material.dart';
import 'package:flutter_elijah/colors.dart';

ThemeData themeData() {
  return ThemeData(
    primaryColor: const Color(0xFF808080),
    secondaryHeaderColor: const Color(0xFFF5F5F5),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 50.0,
        fontWeight: FontWeight.w700,
        color: appColors['text1'],
      ),
      displayMedium: TextStyle(
        fontSize: 40.0,
        fontWeight: FontWeight.w600,
        color: appColors['text3'],
      ),
      displaySmall: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: appColors['text3'],
      ),
      headlineMedium: TextStyle(
        fontSize: 16.0,
        color: appColors['text1'],
      ),
      headlineSmall: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: appColors['text2'],
      ),
      titleLarge: TextStyle(
        fontSize: 14.0,
        color: appColors['text1'],
      ),
    ),
  );
}
