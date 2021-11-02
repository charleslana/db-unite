import 'package:db_unite/src/constants/app_constants.dart';
import 'package:db_unite/src/models/home_grid_model.dart';
import 'package:db_unite/src/routes/app_route_generator.dart';

class HomeGridData {
  List<HomeGridModel> list = [
    HomeGridModel(
      image: AppConstants.imagePokemonGrid,
      text: 'Pokémon',
      route: AppRoutes.pokemonList,
    ),
    HomeGridModel(
      image: AppConstants.imageHeldItemsGrid,
      text: 'Items Mantidos',
      route: AppRoutes.home,
    ),
    HomeGridModel(
      image: AppConstants.imageBattleItemsGrid,
      text: 'Itens de Batalha',
      route: AppRoutes.home,
    ),
  ];
}
