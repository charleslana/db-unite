import 'package:db_unite/src/components/custom_app_bar.dart';
import 'package:db_unite/src/constants/color_constants.dart';
import 'package:db_unite/src/controllers/loading_data_controller.dart';
import 'package:db_unite/src/controllers/pokemon_details_controller.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/ability_details.dart';
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
      child: Obx(() {
        return Scaffold(
          backgroundColor: ColorConstants.scaffold,
          appBar: CustomAppBar(
            title: 'Absol (#${loadingDataController.pokemonIndex.value})',
            widgets: [
              Visibility(
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                visible: loadingDataController.pokemonIndex.value > 0,
                child: IconButton(
                  onPressed: () => loadingDataController.pokemonIndex.value--,
                  icon: const Icon(Icons.chevron_left),
                ),
              ),
              Visibility(
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                visible: loadingDataController.pokemonIndex.value < 25,
                child: IconButton(
                  onPressed: () => loadingDataController.pokemonIndex.value++,
                  icon: const Icon(Icons.chevron_right),
                ),
              ),
            ],
          ),
          body: Padding(
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
                SliderTheme(
                  data: const SliderThemeData(
                    trackHeight: 8,
                  ),
                  child: Slider(
                    value: loadingDataController.pokemonLevel.value.toDouble(),
                    onChanged: (double value) => loadingDataController
                        .pokemonLevel.value = value.toInt(),
                    min: 1,
                    max: 15,
                  ),
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
                    physics: const NeverScrollableScrollPhysics(),
                    controller: pokemonDetailsController.tabController,
                    children: const [
                      InfoDetails(),
                      AbilityDetails(),
                      Center(child: Text('Estatísticas')),
                      Center(child: Text('Builds')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
