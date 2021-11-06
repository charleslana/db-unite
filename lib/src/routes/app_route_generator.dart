import 'package:db_unite/src/pages/home_page.dart';
import 'package:db_unite/src/pages/loading_data_page.dart';
import 'package:db_unite/src/pages/pokemon_details_page.dart';
import 'package:db_unite/src/pages/pokemon_list_page.dart';
import 'package:db_unite/src/pages/splashscreen_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppRouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashscreen:
        return GetPageRoute(
          page: () => const SplashscreenPage(),
          settings: settings,
        );
      case AppRoutes.loadingData:
        return GetPageRoute(
          page: () => const LoadingDataPage(),
          settings: settings,
        );
      case AppRoutes.home:
        return GetPageRoute(
          page: () => const HomePage(),
          settings: settings,
          transition: Transition.rightToLeft,
        );
      case AppRoutes.pokemonList:
        return GetPageRoute(
          page: () => const PokemonListPage(),
          settings: settings,
          transition: Transition.leftToRight,
        );
      case AppRoutes.pokemonDetails:
        return GetPageRoute(
          page: () => const PokemonDetailsPage(),
          settings: settings,
          transition: Transition.rightToLeft,
        );
      default:
        return GetPageRoute(
          page: () => SafeArea(
            child: Scaffold(
              body: Center(
                child: Text('No path for ${settings.name}'),
              ),
            ),
          ),
        );
    }
  }
}
