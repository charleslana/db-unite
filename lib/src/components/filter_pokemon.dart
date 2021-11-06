import 'package:flutter/material.dart';

class FilterPokemon extends StatelessWidget {
  const FilterPokemon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        selected: _options[index] == 'All',
        label: Text(
          _options[index],
          style: const TextStyle(color: Colors.white),
        ),
        elevation: 0,
        pressElevation: 5,
        backgroundColor: Colors.black54,
        selectedColor: Colors.blue,
        onSelected: (bool selected) {},
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
