import 'package:db_unite/src/controllers/pokemon_details_controller.dart';
import 'package:db_unite/src/models/translation_model.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/components/card_ability.dart';
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
              imagePokemon: '359',
              name: 'Super Luck',
              imageAbility: 'Super_Luck',
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
              imagePokemon: '359',
              name: 'Feint',
              imageAbility: 'Feint',
              imageScreenshot: 'Feint',
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
                imagePokemon: '359',
                name: 'Night Slash',
                imageAbility: 'Night_Slash',
                cooldownLevels: [
                  1,
                  5,
                  9,
                ],
                cooldown: [
                  5.0,
                  4.5,
                  4.0,
                ],
                type: TranslationModel(
                  enUS: 'Dash',
                  ptBR: 'Dash',
                ),
                levels: [
                  5,
                  11,
                ],
                effectLevels: [
                  EffectLevelsAbilityModel(
                    descriptionLevel: TranslationModel(
                      enUS:
                          'Absol dashes in an arc, damaging and slowing the first Pokémon hit. If Absol hits, this ability can be activated within 6 seconds – allowing Absol to dash again, dealing damage to all enemies hit. The second hit also has increased critical-rate based on enemy remaining HP (the lower their HP, the higher the critical-rate).\n\nCooldown on Hit or without recasting is 6 seconds.',
                      ptBR:
                          'Absol avança em um arco, causando dano e reduzindo a velocidade do primeiro Pokémon atingido. Se Absol acertar, esta habilidade pode ser ativada dentro de 6 segundos - permitindo que Absol corra novamente, causando dano a todos os inimigos atingidos. O segundo golpe também aumenta a taxa crítica com base no HP restante do inimigo (quanto menor o HP, maior a taxa crítica).\n\nA recarga do Hit ou sem reformulação é de 6 segundos.',
                    ),
                    name: TranslationModel(
                      enUS: 'Damage - First Hit',
                      ptBR: 'Dano - Primeiro Golpe',
                    ),
                    level: 5,
                    value: 312,
                    formula: '78% Atk + 4 x (Level - 1) + 180',
                  ),
                  EffectLevelsAbilityModel(
                    name: TranslationModel(
                      enUS: 'Damage - Second Hit',
                      ptBR: 'Dano - Segundo Golpe',
                    ),
                    level: 5,
                    value: 468,
                    formula: '117% Atk + 5 x (Level - 1) + 270',
                  ),
                  EffectLevelsAbilityModel(
                    descriptionLevel: TranslationModel(
                      enUS:
                          'Absol heals on hit, and if the damage is a critical hit, the Heal doubles.',
                      ptBR:
                          'Absol cura ao acertar, e se o dano for um acerto crítico, a cura dobra.',
                    ),
                    name: TranslationModel(
                      enUS: 'Damage - First Hit',
                      ptBR: 'Dano - Primeiro Golpe',
                    ),
                    level: 11,
                    value: 312,
                    formula: '78% Atk + 4 x (Level - 1) + 180',
                  ),
                  EffectLevelsAbilityModel(
                    name: TranslationModel(
                      enUS: 'Damage - Second Hit',
                      ptBR: 'Dano - Segundo Golpe',
                    ),
                    level: 11,
                    value: 468,
                    formula: '117% Atk + 6 x (Level - 1) + 270',
                  ),
                  EffectLevelsAbilityModel(
                    name: TranslationModel(
                      enUS: 'Healing',
                      ptBR: 'Cura',
                    ),
                    level: 11,
                    value: 165,
                    formula: '41.6% Atk + 2 x (Level - 1) + 95',
                  ),
                ],
              ),
              AbilityModel(
                imagePokemon: '359',
                name: 'Pursuit',
                imageAbility: 'Pursuit',
                cooldownLevels: [
                  1,
                  5,
                  9,
                ],
                cooldown: [
                  5.0,
                  4.5,
                  4.0,
                ],
                type: TranslationModel(
                  enUS: 'Dash',
                  ptBR: 'Dash',
                ),
                levels: [
                  5,
                  11,
                ],
                effectLevels: [
                  EffectLevelsAbilityModel(
                    descriptionLevel: TranslationModel(
                      enUS:
                          'Absol dashes to a location, and dashes to an enemy with its next basic attack. If Absol hits the back of the target, this abilitys cooldown is reduced. If it fails to hit the back, damage is halved.',
                      ptBR:
                          'Absol avança para um local e avança para um inimigo com seu próximo ataque básico. Se Absol atingir as costas do alvo, o tempo de espera dessa habilidade é reduzido. Se ele não atingir as costas, o dano será reduzido pela metade.',
                    ),
                    name: TranslationModel(
                      enUS: 'Damage - From The Back',
                      ptBR: 'Danos - pela parte de trás',
                    ),
                    level: 5,
                    value: 732,
                    formula: '198% Atk + 19 x (Level - 1) + 396',
                  ),
                  EffectLevelsAbilityModel(
                    descriptionLevel: TranslationModel(
                      enUS:
                          'Absol gains movement speed upgrade after the initial dash.',
                      ptBR:
                          'Absol ganha aumento de velocidade de movimento após a corrida inicial.',
                    ),
                    level: 11,
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
