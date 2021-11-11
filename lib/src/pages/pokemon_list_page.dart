import 'package:db_unite/src/components/custom_app_bar.dart';
import 'package:db_unite/src/components/custom_circle_avatar.dart';
import 'package:db_unite/src/components/filter_pokemon.dart';
import 'package:db_unite/src/constants/color_constants.dart';
import 'package:db_unite/src/constants/image_constants.dart';
import 'package:db_unite/src/controllers/loading_data_controller.dart';
import 'package:db_unite/src/controllers/pokemon_list_controller.dart';
import 'package:db_unite/src/routes/app_route_generator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoadingDataController loadingDataController =
        Get.put(LoadingDataController());
    final PokemonListController pokemonListController =
        Get.put(PokemonListController());

    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: ColorConstants.scaffold,
          appBar: const CustomAppBar(title: 'Pokémon (total: 26)'),
          body: Obx(() {
            final List<String> pokemonList =
                loadingDataController.pokemonFilterList;

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextField(
                    onChanged: (String text) {},
                    controller: pokemonListController.textEditingController,
                    style: const TextStyle(color: ColorConstants.text),
                    decoration: InputDecoration(
                      labelText: 'Pesquisar pokémon',
                      labelStyle: const TextStyle(color: ColorConstants.text),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: ColorConstants.text,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          pokemonListController.textEditingController.clear();
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        icon: const Icon(
                          Icons.clear,
                          color: ColorConstants.text,
                        ),
                      ),
                    ),
                  ),
                ),
                FilterPokemon(
                    filterIndex: loadingDataController.filterIndex.value),
                Expanded(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: Get.width,
                        height: Get.height,
                        child: Opacity(
                          opacity: 0.1,
                          child: Image.asset(
                            ImageConstants.pokeball,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(12),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: Get.width / (Get.height / 1.5),
                        ),
                        itemCount: pokemonList.length + 26,
                        itemBuilder: (_, int index) {
                          return GestureDetector(
                            onTap: () => {
                              loadingDataController
                                ..pokemonIndex.value = index
                                ..pokemonLevel.value = 1,
                              Get.toNamed<dynamic>(AppRoutes.pokemonDetails),
                            },
                            child: Column(
                              children: [
                                CustomCircleAvatar(
                                  image: ImageConstants()
                                      .getPokemonThumbnail('359'),
                                  height: 60,
                                ),
                                const SizedBox(height: 10),
                                const Flexible(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      'Absol',
                                      style: TextStyle(
                                        color: ColorConstants.text,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
