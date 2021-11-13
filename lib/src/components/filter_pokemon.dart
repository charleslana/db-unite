import 'package:db_unite/src/constants/color_constants.dart';
import 'package:db_unite/src/controllers/loading_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterPokemon extends StatelessWidget {
  const FilterPokemon({
    required this.filterIndex,
    Key? key,
  }) : super(key: key);

  final int filterIndex;

  @override
  Widget build(BuildContext context) {
    final LoadingDataController loadingDataController =
        Get.put(LoadingDataController());
    final List<Widget> chips = [];
    final List<String> _options = [
      'filterPokemonAll'.tr,
      'filterPokemonMelee'.tr,
      'filterPokemonRanged'.tr,
      'filterPokemonPhysicalAttacker'.tr,
      'filterPokemonSpecialAttacker'.tr,
      'filterPokemonAllRounder'.tr,
      'filterPokemonAttacker'.tr,
      'filterPokemonDefender'.tr,
      'filterPokemonSpeedster'.tr,
      'filterPokemonSupporter'.tr,
    ];
    Widget widget;

    for (int index = 0; index < _options.length; index++) {
      widget = ChoiceChip(
        selected: filterIndex == index,
        label: Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            _options[index],
            style: const TextStyle(color: Colors.white),
          ),
        ),
        elevation: 0,
        visualDensity: const VisualDensity(vertical: 2),
        pressElevation: 5,
        backgroundColor: Colors.black54,
        selectedColor: ColorConstants.background,
        onSelected: (_) => loadingDataController.filterIndex.value = index,
      );

      chips.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: widget,
        ),
      );
    }

    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: chips,
        ),
      ),
    );
  }
}
