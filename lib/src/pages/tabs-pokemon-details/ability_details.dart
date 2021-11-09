import 'package:db_unite/src/controllers/pokemon_details_controller.dart';
import 'package:db_unite/src/models/translation_model.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/components/card_ability.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/models/ability_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AbilityDetails extends StatelessWidget {
  const AbilityDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PokemonDetailsController pokemonDetailsController =
        Get.put(PokemonDetailsController());
    const String type = 'Ranged';

    return SingleChildScrollView(
      controller: pokemonDetailsController.scrollControllerAbility,
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          CardAbility(
            ability: AbilityModel(
              name: 'Super Luck',
              imageAbility:
                  'https://raw.githubusercontent.com/charleslana/api-pokemon-unite/master/pokemon/359/ability/Super_Luck.png',
              cooldownLevels: [],
              cooldown: [],
              description: TranslationModel(
                enUS: 'Increases Critical-Hit rate by 15%.',
                ptBR: 'Aumenta a taxa de acertos críticos em 15%.',
              ),
              levels: [],
              effectLevels: [],
            ),
            upgradeChoices: const [],
          ),
        ],
      ),
    );
  }
}
