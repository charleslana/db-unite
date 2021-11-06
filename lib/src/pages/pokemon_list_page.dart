import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_unite/src/components/custom_app_bar.dart';
import 'package:db_unite/src/components/filter_pokemon.dart';
import 'package:db_unite/src/components/pokeball_loading.dart';
import 'package:db_unite/src/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: AppConstants.colorScaffold,
          appBar: const CustomAppBar(title: 'Pokémon (total: 26)'),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Pesquisar pokémon',
                    labelStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
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
                          AppConstants.imagePokeball,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(12),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: Get.width / (Get.height / 1.5),
                      ),
                      itemCount: 26,
                      itemBuilder: (_, index) {
                        const String image =
                            'https://raw.githubusercontent.com/charleslana/api-pokemon-unite/master/pokemon/thumbnail/359.png';

                        return GestureDetector(
                          onTap: () => {},
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                  height: 60,
                                  color: AppConstants.colorAvatar,
                                  child: CachedNetworkImage(
                                    placeholder: (_, __) =>
                                        const PokeballLoading(),
                                    imageUrl: image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Flexible(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    'Absol',
                                    style: TextStyle(
                                      color: AppConstants.colorAppBarText,
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
