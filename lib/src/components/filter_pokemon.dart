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
      'All',
      'Melee',
      'Ranged',
      'Physical Attacker',
      'Special Attacker',
      'All-Rounder',
      'Attacker',
      'Defender',
      'Speedster',
      'Supporter',
    ];

    for (int index = 0; index < _options.length; index++) {
      final ChoiceChip choiceChip = ChoiceChip(
        selected: index == filterIndex,
        label: Text(
          _options[index],
          style: const TextStyle(color: Colors.white),
        ),
        elevation: 0,
        pressElevation: 5,
        backgroundColor: Colors.black54,
        selectedColor: ColorConstants.background,
        onSelected: (_) => loadingDataController.filterIndex.value = index,
      );

      chips.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: choiceChip,
        ),
      );
    }

    return ListView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: chips,
    );
  }
}
