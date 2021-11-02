import 'package:flutter/material.dart';

class AppConstants {
  static const String imageLogo = 'assets/images/layout/logo.png';
  static const String imageLoadingData =
      'assets/images/layout/loading-data.jpg';
  static const String imagePokeballLoading =
      'assets/images/layout/pokeball-loading.png';
  static const Color colorMenuHome = Color(0xff271d45);
  static const Color colorTextHome = Colors.white;
  static const Color colorGridHome = Color(0xff1d1533);
  static const Color colorScaffoldHome = Color(0xff312457);
  static const String imagePokeball = 'assets/images/layout/pokeball.png';

  ThemeData themeLight = ThemeData(
    fontFamily: 'HelveticaNeueLTProMedium',
    scaffoldBackgroundColor: Colors.white,
    colorScheme:
        const ColorScheme.light().copyWith(primary: const Color(0xff745bbb)),
    primaryColor: Colors.white,
    primaryColorLight: Colors.grey[600],
  );
  ThemeData themeDark = ThemeData(
    fontFamily: 'HelveticaNeueLTProMedium',
    scaffoldBackgroundColor: Colors.black,
    colorScheme:
        const ColorScheme.dark().copyWith(primary: const Color(0xff745bbb)),
  );
}
