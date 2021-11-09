import 'package:db_unite/src/controllers/pokemon_details_controller.dart';
import 'package:db_unite/src/models/translation_model.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/components/card_ability.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/enum/type_ability_enum.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/models/ability_model.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/models/effect_levels_ability_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AbilityDetails extends StatelessWidget {
  const AbilityDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PokemonDetailsController pokemonDetailsController =
        Get.put(PokemonDetailsController());

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
              title: TranslationModel(
                enUS: 'Passive Ability',
                ptBR: 'Habilidade passiva',
              ),
              cooldownLevels: [],
              cooldown: [],
              description: TranslationModel(
                enUS: 'Increases Critical-Hit rate by 15%.',
                ptBR: 'Aumenta a taxa de acertos críticos em 15%.',
              ),
              levels: [],
              effectLevels: [],
            ),
          ),
          CardAbility(
            ability: AbilityModel(
              name: 'Feint',
              imageAbility:
                  'https://raw.githubusercontent.com/charleslana/api-pokemon-unite/master/pokemon/359/ability/Feint.png',
              imageScreenshot:
                  'https://raw.githubusercontent.com/charleslana/api-pokemon-unite/master/pokemon/359/screenshot/Feint.jpg',
              title: TranslationModel(
                enUS: 'Move 1',
                ptBR: 'Move 1',
              ),
              cooldownLevels: [
                1,
                5,
                9,
              ],
              cooldown: [
                8.0,
                7.2,
                6.4,
              ],
              type: TranslationModel(
                enUS: 'Dash',
                ptBR: 'Dash',
              ),
              typeEnum: TypeAbilityEnum.dash,
              description: TranslationModel(
                enUS:
                    'Absol dashes in an arc, damaging all enemies hit. Absol deals damage as if enemies hit have 0 defense and bypasses shields.',
                ptBR:
                    'Absol avança em um arco, causando dano a todos os inimigos atingidos. Absol causa dano como se os inimigos atingidos tivessem 0 de defesa e contornasse os escudos.',
              ),
              levels: [],
              effectLevels: [
                EffectLevelsAbilityModel(
                  name: TranslationModel(
                    enUS: 'Damage',
                    ptBR: 'Dano',
                  ),
                  value: 242,
                  formula: '66% Atk + 7 x (Level - 1) + 130',
                ),
              ],
            ),
            upgradeChoices: [
              AbilityModel(
                name: 'Super Luck',
                imageAbility:
                    'https://raw.githubusercontent.com/charleslana/api-pokemon-unite/master/pokemon/359/ability/Super_Luck.png',
                title: TranslationModel(
                  enUS: 'Passive Ability',
                  ptBR: 'Habilidade passiva',
                ),
                cooldownLevels: [],
                cooldown: [],
                description: TranslationModel(
                  enUS: 'Increases Critical-Hit rate by 15%.',
                  ptBR: 'Aumenta a taxa de acertos críticos em 15%.',
                ),
                levels: [],
                effectLevels: [],
              ),
              AbilityModel(
                name: 'Feint',
                imageAbility:
                    'https://raw.githubusercontent.com/charleslana/api-pokemon-unite/master/pokemon/359/ability/Feint.png',
                imageScreenshot:
                    'https://raw.githubusercontent.com/charleslana/api-pokemon-unite/master/pokemon/359/screenshot/Feint.jpg',
                title: TranslationModel(
                  enUS: 'Move 1',
                  ptBR: 'Move 1',
                ),
                cooldownLevels: [
                  1,
                  5,
                  9,
                ],
                cooldown: [
                  8.0,
                  7.2,
                  6.4,
                ],
                type: TranslationModel(
                  enUS: 'Dash',
                  ptBR: 'Dash',
                ),
                typeEnum: TypeAbilityEnum.dash,
                description: TranslationModel(
                  enUS:
                      'Absol dashes in an arc, damaging all enemies hit. Absol deals damage as if enemies hit have 0 defense and bypasses shields.',
                  ptBR:
                      'Absol avança em um arco, causando dano a todos os inimigos atingidos. Absol causa dano como se os inimigos atingidos tivessem 0 de defesa e contornasse os escudos.',
                ),
                levels: [],
                effectLevels: [
                  EffectLevelsAbilityModel(
                    name: TranslationModel(
                      enUS: 'Damage',
                      ptBR: 'Dano',
                    ),
                    value: 242,
                    formula: '66% Atk + 7 x (Level - 1) + 130',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
