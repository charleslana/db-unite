import 'package:db_unite/src/constants/color_constants.dart';
import 'package:db_unite/src/constants/image_constants.dart';
import 'package:db_unite/src/controllers/loading_data_controller.dart';
import 'package:db_unite/src/controllers/pokemon_details_controller.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/components/card_info.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/components/chip_info.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/components/evolution_info.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/components/percent_status_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class InfoDetails extends StatelessWidget {
  const InfoDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PokemonDetailsController pokemonDetailsController =
        Get.put(PokemonDetailsController());
    final LoadingDataController loadingDataController =
        Get.put(LoadingDataController());

    return SingleChildScrollView(
      controller: pokemonDetailsController.scrollControllerInfo,
      physics: const BouncingScrollPhysics(),
      child: Obx(() {
        return AnimationLimiter(
          key: ValueKey(loadingDataController.pokemonIndex.value),
          child: Column(
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 375),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 50,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Image.asset(
                                ImageConstants().getPokemonPortrait('359'),
                                fit: BoxFit.fitWidth,
                                height: 200,
                              ),
                              const SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'Special Attacker',
                                    style: TextStyle(
                                      color: ColorConstants.blue,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                alignment: WrapAlignment.center,
                                children: const [
                                  ChipInfo(text: 'Ranged'),
                                  ChipInfo(text: 'Intermediate'),
                                  ChipInfo(text: 'Defender'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              CardInfo(
                                title: 'HP',
                                value: loadingDataController.pokemonIndex.value
                                    .toString(),
                                isOpacity: true,
                              ),
                              const CardInfo(
                                title: 'Attack',
                                value: '150',
                              ),
                              const CardInfo(
                                title: 'Defense',
                                value: '100',
                                isOpacity: true,
                              ),
                              const CardInfo(
                                title: 'Sp. Attack',
                                value: '50',
                              ),
                              const CardInfo(
                                title: 'Sp. Defense',
                                value: '70',
                                isOpacity: true,
                              ),
                              const CardInfo(
                                title: 'Crit Rate',
                                value: '0%',
                              ),
                              const CardInfo(
                                title: 'CD Reduction',
                                value: '0%',
                                isOpacity: true,
                              ),
                              const CardInfo(
                                title: 'Lifesteal',
                                value: '0%',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: RichText(
                        text: const TextSpan(
                          text: 'Note: ',
                          style: TextStyle(color: ColorConstants.yellow),
                          children: [
                            TextSpan(
                              text:
                                  'Only basic attacks can critically strike, but Blastoise has 0% base Critical-Hit rate at all levels.',
                              style: TextStyle(
                                fontFamily: 'HelveticaNeueLTProLight',
                                fontSize: 15,
                                color: ColorConstants.gray,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const PercentStatusInfo(
                      title: 'Offense',
                      value: 4,
                    ),
                    const PercentStatusInfo(
                      title: 'Endurance',
                      value: 7,
                    ),
                    const PercentStatusInfo(
                      title: 'Mobility',
                      value: 4,
                    ),
                    const PercentStatusInfo(
                      title: 'Scoring',
                      value: 4,
                    ),
                    const PercentStatusInfo(
                      title: 'Support',
                      value: 6,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        EvolutionInfo(
                          name: 'Squirtle',
                          level: 5,
                          image: '007',
                        ),
                        EvolutionInfo(
                          name: 'Wartortle',
                          level: 9,
                          image: '008',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
