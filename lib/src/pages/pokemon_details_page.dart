import 'package:db_unite/src/components/custom_app_bar.dart';
import 'package:db_unite/src/constants/color_constants.dart';
import 'package:db_unite/src/controllers/loading_data_controller.dart';
import 'package:db_unite/src/controllers/pokemon_details_controller.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/info_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoadingDataController loadingDataController =
        Get.put(LoadingDataController());
    final PokemonDetailsController pokemonDetailsController =
        Get.put(PokemonDetailsController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.scaffold,
        appBar: const CustomAppBar(title: 'Absol (#359)'),
        body: Obx(() {
          return Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Text(
                  'Nível ${loadingDataController.pokemonLevel.value.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Slider(
                  value: loadingDataController.pokemonLevel.value,
                  onChanged: (double value) =>
                      loadingDataController.pokemonLevel.value = value,
                  min: 1,
                  max: 15,
                ),
                SizedBox(
                  height: 50,
                  child: TabBar(
                    controller: pokemonDetailsController.tabController,
                    labelColor: ColorConstants.text,
                    indicatorColor: ColorConstants.background,
                    isScrollable: true,
                    physics: const BouncingScrollPhysics(),
                    onTap: (int index) {},
                    enableFeedback: true,
                    tabs: const [
                      Tab(child: Text('Info')),
                      Tab(child: Text('Habilidades')),
                      Tab(child: Text('Estatísticas')),
                      Tab(child: Text('Builds')),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: TabBarView(
                    physics: const BouncingScrollPhysics(),
                    controller: pokemonDetailsController.tabController,
                    children: const [
                      InfoDetails(),
                      Center(child: Text('Habilidades')),
                      Center(child: Text('Estatísticas')),
                      Center(child: Text('Builds')),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
