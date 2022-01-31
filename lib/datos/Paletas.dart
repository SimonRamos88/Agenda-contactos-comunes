import 'package:flutter/material.dart';

class Paletas{
  static const int _blackPrimaryValue = 0xFF000000;
  static const MaterialColor primaryBlack = MaterialColor(
    _blackPrimaryValue,
    <int, Color>{
      50: Color(0xFF000000),
      100: Color(0xFF000000),
      200: Color(0xFF000000),
      300: Color(0xFF000000),
      400: Color(0xFF000000),
      500: Color(_blackPrimaryValue),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );


  static const int _whitePrimaryValue = 0xFFFFFFFF;
  static const MaterialColor primaryWhite = MaterialColor(
    _whitePrimaryValue,
    <int, Color>{
      50: Color( 0xFFFFFFFF),
      100: Color( 0xFFFFFFFF),
      200: Color( 0xFFFFFFFF),
      300: Color( 0xFFFFFFFF),
      400: Color( 0xFFFFFFFF),
      500: Color(_whitePrimaryValue),
      600: Color( 0xFFFFFFFF),
      700: Color( 0xFFFFFFFF),
      800: Color( 0xFFFFFFFF),
      900: Color( 0xFFFFFFFF),
    },
  );


  static const int _fondoPrimaryValue = 0xffB4C2DD;
  static const MaterialColor primaryFondo = MaterialColor(
    _fondoPrimaryValue,
    <int, Color>{
      50: Color( 0xffB4C2DD),
      100: Color( 0xffB4C2DD),
      200: Color( 0xffB4C2DD),
      300: Color( 0xffB4C2DD),
      400: Color( 0xffB4C2DD),
      500: Color(_fondoPrimaryValue),
      600: Color( 0xffB4C2DD),
      700: Color( 0xffB4C2DD),
      800: Color( 0xffB4C2DD),
      900: Color( 0xffB4C2DD),
    },
  );

}