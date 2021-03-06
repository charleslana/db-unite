import 'package:flutter/material.dart';

class ThemeConstants {
  ThemeData light = ThemeData(
    fontFamily: 'HelveticaNeueLTProMedium',
    scaffoldBackgroundColor: Colors.white,
    colorScheme:
        const ColorScheme.light().copyWith(primary: const Color(0xff745bbb)),
    primaryColor: Colors.white,
    primaryColorLight: Colors.grey[600],
  );

  ThemeData dark = ThemeData(
    fontFamily: 'HelveticaNeueLTProMedium',
    scaffoldBackgroundColor: Colors.black,
    colorScheme:
        const ColorScheme.dark().copyWith(primary: const Color(0xff745bbb)),
  );
}
