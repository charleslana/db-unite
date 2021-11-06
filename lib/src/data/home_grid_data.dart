import 'package:db_unite/src/constants/image_constants.dart';
import 'package:db_unite/src/models/home_grid_model.dart';
import 'package:db_unite/src/routes/app_route_generator.dart';

class HomeGridData {
  List<HomeGridModel> list = [
    HomeGridModel(
      image: ImageConstants.pokemonGrid,
      text: 'Pokémon',
      route: AppRoutes.pokemonList,
    ),
    HomeGridModel(
      image: ImageConstants.heldItemsGrid,
      text: 'Items Mantidos',
      route: AppRoutes.home,
    ),
    HomeGridModel(
      image: ImageConstants.battleItemsGrid,
      text: 'Itens de Batalha',
      route: AppRoutes.home,
    ),
  ];
}
