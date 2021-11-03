import 'package:flutter/material.dart';

class AppConstants {
  static const String imageLogo = 'assets/images/layout/logo.png';
  static const String imageLoadingData =
      'assets/images/layout/loading-data.jpg';
  static const String imagePokeballLoading =
      'assets/images/layout/pokeball-loading.png';
  static const Color colorAppBar = Color(0xff271d45);
  static const Color colorAppBarText = Colors.white;
  static const Color colorAvatar = Color(0xff1d1533);
  static const Color colorScaffold = Color(0xff312457);
  static const String imagePokeball = 'assets/images/layout/pokeball.png';
  static const String imagePokemonGrid = 'assets/images/grid/pokemon.png';
  static const String imageHeldItemsGrid = 'assets/images/grid/held-items.png';
  static const String imageBattleItemsGrid =
      'assets/images/grid/battle-items.png';

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
