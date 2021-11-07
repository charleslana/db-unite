import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_unite/src/components/pokeball_loading.dart';
import 'package:db_unite/src/constants/color_constants.dart';
import 'package:db_unite/src/constants/image_constants.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/components/card_ability.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/enum/type_ability_enum.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/models/damage_ability_model.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/models/description_ability_model.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/models/type_ability_model.dart';
import 'package:flutter/material.dart';

class AbilityDetails extends StatelessWidget {
  const AbilityDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String type = 'Ranged';

    return SingleChildScrollView(
      controller: ScrollController(),
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
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
            typeEnum: type == 'Ranged'
                ? TypeAbilityEnum.ranged
                : type == 'Dash'
                    ? TypeAbilityEnum.dash
                    : type == 'Melee'
                        ? TypeAbilityEnum.melee
                        : type == 'Ranged'
                            ? TypeAbilityEnum.ranged
                            : TypeAbilityEnum.sureHit,
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
          // Card(
          //   elevation: 0,
          //   color: ColorConstants.background.withOpacity(0.5),
          //   child: Padding(
          //     padding: const EdgeInsets.all(10),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Row(
          //           children: [
          //             CachedNetworkImage(
          //               placeholder: (_, __) => const PokeballLoading(),
          //               imageUrl:
          //                   'https://raw.githubusercontent.com/charleslana/api-pokemon-unite/master/pokemon/009/ability/Water_Gun.png',
          //               fit: BoxFit.fill,
          //               height: 50,
          //             ),
          //             const SizedBox(width: 10),
          //             Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 const Text(
          //                   'Water Gun',
          //                   style: TextStyle(
          //                     fontSize: 20,
          //                     color: ColorConstants.text,
          //                   ),
          //                 ),
          //                 const Text(
          //                   'Move 1',
          //                   style: TextStyle(
          //                     fontSize: 16,
          //                     color: ColorConstants.gray,
          //                   ),
          //                 ),
          //                 Wrap(
          //                   spacing: 10,
          //                   runSpacing: 10,
          //                   children: [
          //                     Container(
          //                       decoration: BoxDecoration(
          //                         color: Colors.black54,
          //                         borderRadius: BorderRadius.circular(5),
          //                       ),
          //                       child: Padding(
          //                         padding: const EdgeInsets.all(10),
          //                         child: RichText(
          //                           text: const TextSpan(
          //                             style: TextStyle(
          //                               fontSize: 14,
          //                               color: ColorConstants.yellow,
          //                             ),
          //                             children: [
          //                               WidgetSpan(
          //                                 child: Icon(
          //                                   Icons.timelapse,
          //                                   size: 15,
          //                                   color: ColorConstants.yellow,
          //                                 ),
          //                               ),
          //                               TextSpan(
          //                                 text: ' 9s',
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                       ),
          //                     ),
          //                     Container(
          //                       decoration: BoxDecoration(
          //                         color: Colors.black54,
          //                         borderRadius: BorderRadius.circular(5),
          //                       ),
          //                       child: Padding(
          //                         padding: const EdgeInsets.all(10),
          //                         child: RichText(
          //                           text: TextSpan(
          //                             style: const TextStyle(
          //                               fontSize: 14,
          //                               color: ColorConstants.deepRed,
          //                             ),
          //                             children: [
          //                               WidgetSpan(
          //                                 child: Image.asset(
          //                                   ImageConstants.skillRanged,
          //                                   width: 15,
          //                                 ),
          //                               ),
          //                               const TextSpan(
          //                                 text: ' Ranged',
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //         const SizedBox(height: 10),
          //         const Text(
          //           'Level 5',
          //           style: TextStyle(
          //             fontSize: 16,
          //             color: ColorConstants.deepYellow,
          //           ),
          //         ),
          //         const Text(
          //           'Blastoise shoots a large amount of water: damaging, stunning, and knocking back enemies hit.',
          //           style: TextStyle(
          //             fontSize: 16,
          //             color: ColorConstants.gray,
          //             fontFamily: 'HelveticaNeueLTProLight',
          //           ),
          //         ),
          //         const SizedBox(height: 10),
          //         const Text(
          //           'Damage - During Rapid Spin',
          //           style: TextStyle(
          //             fontSize: 18,
          //             color: ColorConstants.gray,
          //           ),
          //         ),
          //         const Text(
          //           'Blastoise unleashes a large burst of water in a radius around themselves, damaging, stunning, and knocking back enemies hit. Blastoise also gains a small movement speed bonus for the duration of this move.',
          //           style: TextStyle(
          //             fontSize: 16,
          //             color: ColorConstants.gray,
          //             fontFamily: 'HelveticaNeueLTProLight',
          //           ),
          //         ),
          //         const Text(
          //           '95% SpA + 16 x (Level - 1) + 620',
          //           style: TextStyle(
          //             fontSize: 18,
          //             color: ColorConstants.yellow,
          //           ),
          //         ),
          //         const SizedBox(height: 10),
          //         CachedNetworkImage(
          //           placeholder: (_, __) => const PokeballLoading(),
          //           imageUrl:
          //               'https://raw.githubusercontent.com/charleslana/api-pokemon-unite/master/pokemon/009/screenshot/Water_Gun.jpg',
          //           fit: BoxFit.cover,
          //           height: 150,
          //           width: double.infinity,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
