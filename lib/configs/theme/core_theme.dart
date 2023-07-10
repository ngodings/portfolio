import 'package:flutter/material.dart';

const fontFamily = 'Poppins';

final themeLight = ThemeData(
  primaryColorLight: const Color(0xff33B3CC),
  brightness: Brightness.light,
  primaryColor: const Color(0xff217283),
  primaryColorDark: const Color(0xff17525E),
  highlightColor: const Color(0xff33B3CC),
  canvasColor: Colors.white,
  fontFamily: fontFamily,
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal)
      .copyWith(
        secondary: const Color(0xff33B3CC),
        brightness: Brightness.light,
      )
      .copyWith(background: Colors.white),
);

final themeDark = ThemeData(
  brightness: Brightness.dark,
  primaryColorDark: const Color(0xff78CDDD),
  primaryColor: const Color(0xff2A93A7),
  highlightColor: const Color(0xff33B3CC),
  canvasColor: Colors.white,
  fontFamily: fontFamily,
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
      .copyWith(
        secondary: const Color(0xff33B3CC),
        brightness: Brightness.dark,
      )
      .copyWith(background: Colors.grey[800]),
);
