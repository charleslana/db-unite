import 'package:db_unite/src/components/custom_app_bar.dart';
import 'package:db_unite/src/components/custom_circle_avatar.dart';
import 'package:db_unite/src/components/filter_pokemon.dart';
import 'package:db_unite/src/constants/color_constants.dart';
import 'package:db_unite/src/constants/image_constants.dart';
import 'package:db_unite/src/controllers/loading_data_controller.dart';
import 'package:db_unite/src/routes/app_route_generator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoadingDataController loadingDataController =
        Get.put(LoadingDataController());

    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: ColorConstants.scaffold,
          appBar: const CustomAppBar(title: 'Pokémon (total: 26)'),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  style: const TextStyle(color: ColorConstants.text),
                  decoration: InputDecoration(
                    labelText: 'Pesquisar pokémon',
                    labelStyle: const TextStyle(color: ColorConstants.text),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: ColorConstants.text,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: FilterPokemon(),
                ),
              ),
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
                      itemCount: 26,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () => {
                            loadingDataController
                              ..pokemonIndex.value = index
                              ..pokemonLevel.value = 1,
                            Get.toNamed<dynamic>(AppRoutes.pokemonDetails),
                          },
                          child: Column(
                            children: const [
                              CustomCircleAvatar(
                                image:
                                    'https://raw.githubusercontent.com/charleslana/api-pokemon-unite/master/pokemon/thumbnail/359.png',
                                height: 60,
                                isNetwork: true,
                              ),
                              SizedBox(height: 10),
                              Flexible(
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
          ),
        ),
      ),
    );
  }
}
