import 'package:db_unite/src/constants/color_constants.dart';
import 'package:db_unite/src/controllers/pokemon_details_controller.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/components/card_ability.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/enum/type_ability_enum.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/models/damage_ability_model.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/models/description_ability_model.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/models/title_ability_model.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/models/type_ability_model.dart';
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
            name: 'Torrent',
            imageAbility:
                'https://raw.githubusercontent.com/charleslana/api-pokemon-unite/master/pokemon/009/ability/Torrent.png',
            title: TitleAbilityModel(
              enUS: 'Passive Ability',
              ptBR: 'Habilidade passiva',
            ),
            levels: const [],
            description: DescriptionAbilityModel(
              enUS: [
                'Increases Attack and Sp. Attack by 20% while at half HP or less.',
              ],
              ptBR: [
                'Aumenta o Ataque e a Sp. Ataque em 20% enquanto estiver com metade do HP ou menos.',
              ],
            ),
            cooldownLevels: const [],
            cooldown: const [],
            damage: const [],
          ),
          CardAbility(
            name: 'Hydro Pump',
            imageAbility:
                'https://raw.githubusercontent.com/charleslana/api-pokemon-unite/master/pokemon/009/ability/Hydro_Pump.png',
            imageScreenshot:
                'https://raw.githubusercontent.com/charleslana/api-pokemon-unite/master/pokemon/009/screenshot/Hydro_Pump.jpg',
            levels: const [
              5,
              11,
            ],
            description: DescriptionAbilityModel(
              enUS: [
                'Blastoise shoots a large amount of water; damaging, stunning, and knocking back enemies hit.',
                'Hydro Pump deals increased damage.',
              ],
              ptBR: [
                'Blastoise atira uma grande quantidade de água; danificando, atordoando e repelindo os inimigos atingidos.',
                'Hydro Pump causa mais dano.',
              ],
            ),
            cooldownLevels: const [
              1,
              5,
              9,
            ],
            cooldown: const [
              8.5,
              8.1,
              7.7,
            ],
            type: TypeAbilityModel(
              enUS: 'Ranged',
              ptBR: 'À distância',
            ),
            typeEnum: type == 'Area'
                ? TypeAbilityEnum.area
                : type == 'Dash'
                    ? TypeAbilityEnum.dash
                    : type == 'Melee'
                        ? TypeAbilityEnum.melee
                        : type == 'Ranged'
                            ? TypeAbilityEnum.ranged
                            : TypeAbilityEnum.sureHit,
            typeColor: type == 'Area'
                ? ColorConstants.deepRed
                : type == 'Dash'
                    ? ColorConstants.blue
                    : type == 'Melee'
                        ? ColorConstants.deepRed
                        : type == 'Ranged'
                            ? ColorConstants.deepRed
                            : ColorConstants.deepRed,
            damage: [
              DamageAbilityModel(
                name: TranslationDamage(
                  enUS: 'Damage (3 Hits)',
                  ptBR: 'Dano (3 Acertos)',
                ),
                level: 5,
                value: 333,
                formula: '47.5% SpA + 8 x (Level - 1) + 310',
              ),
              DamageAbilityModel(
                name: TranslationDamage(
                  enUS: 'Damage - During Rapid Spin',
                  ptBR: 'Danos - Durante a Rapid Spin',
                ),
                description: TranslationDamage(
                  enUS:
                      'Blastoise unleashes a large burst of water in a radius around themselves, damaging, stunning, and knocking back enemies hit. Blastoise also gains a small movement speed bonus for the duration of this move.',
                  ptBR:
                      'Blastoise libera uma grande explosão de água em um raio ao seu redor, causando dano, atordoamento e repelindo os inimigos atingidos. Blastoise também ganha um pequeno bônus de velocidade de movimento durante o movimento.',
                ),
                level: 5,
                value: 667,
                formula: '95% SpA + 16 x (Level - 1) + 620',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
