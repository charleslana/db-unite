import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_unite/src/components/pokeball_loading.dart';
import 'package:db_unite/src/constants/color_constants.dart';
import 'package:db_unite/src/constants/image_constants.dart';
import 'package:db_unite/src/controllers/loading_data_controller.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/enum/type_ability_enum.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/models/damage_ability_model.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/models/description_ability_model.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/models/title_ability_model.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/models/type_ability_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardAbility extends StatelessWidget {
  const CardAbility({
    required this.name,
    required this.imageAbility,
    this.imageScreenshot,
    this.title,
    required this.levels,
    required this.description,
    required this.cooldownLevels,
    required this.cooldown,
    this.type,
    this.typeEnum,
    this.typeColor,
    required this.damage,
    Key? key,
  }) : super(key: key);

  final String name;
  final String imageAbility;
  final String? imageScreenshot;
  final TitleAbilityModel? title;
  final List<int> levels;
  final DescriptionAbilityModel description;
  final List<int> cooldownLevels;
  final List<double> cooldown;
  final TypeAbilityModel? type;
  final TypeAbilityEnum? typeEnum;
  final Color? typeColor;
  final List<DamageAbilityModel> damage;

  @override
  Widget build(BuildContext context) {
    final LoadingDataController loadingDataController =
        Get.put(LoadingDataController());

    return Card(
      elevation: 0,
      color: ColorConstants.background.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CachedNetworkImage(
                  placeholder: (_, __) => const PokeballLoading(),
                  imageUrl: imageAbility,
                  fit: BoxFit.fill,
                  height: 50,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 20,
                        color: ColorConstants.text,
                      ),
                    ),
                    if (title != null)
                      Text(
                        title!.enUS,
                        style: const TextStyle(
                          fontSize: 16,
                          color: ColorConstants.gray,
                        ),
                      ),
                    if (cooldown.isNotEmpty)
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Obx(() {
                                return RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: ColorConstants.yellow,
                                    ),
                                    children: [
                                      const WidgetSpan(
                                        child: Icon(
                                          Icons.timelapse,
                                          size: 15,
                                          color: ColorConstants.yellow,
                                        ),
                                      ),
                                      if (loadingDataController
                                              .pokemonLevel.value >=
                                          cooldownLevels[2]) ...[
                                        TextSpan(
                                            text:
                                                '${cooldown[2].toString()} s'),
                                      ] else if (loadingDataController
                                              .pokemonLevel.value >=
                                          cooldownLevels[1]) ...[
                                        TextSpan(
                                            text:
                                                '${cooldown[1].toString()} s'),
                                      ] else ...[
                                        TextSpan(
                                            text:
                                                '${cooldown[0].toString()} s'),
                                      ],
                                    ],
                                  ),
                                );
                              }),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: typeColor,
                                  ),
                                  children: [
                                    if (typeEnum == TypeAbilityEnum.area) ...[
                                      WidgetSpan(
                                        child: Image.asset(
                                          ImageConstants.skillArea,
                                          width: 15,
                                        ),
                                      ),
                                    ] else if (typeEnum ==
                                        TypeAbilityEnum.dash) ...[
                                      WidgetSpan(
                                        child: Image.asset(
                                          ImageConstants.skillDash,
                                          width: 15,
                                        ),
                                      ),
                                    ] else if (typeEnum ==
                                        TypeAbilityEnum.melee) ...[
                                      WidgetSpan(
                                        child: Image.asset(
                                          ImageConstants.skillMelee,
                                          width: 15,
                                        ),
                                      ),
                                    ] else if (typeEnum ==
                                        TypeAbilityEnum.ranged) ...[
                                      WidgetSpan(
                                        child: Image.asset(
                                          ImageConstants.skillRanged,
                                          width: 15,
                                        ),
                                      ),
                                    ] else ...[
                                      WidgetSpan(
                                        child: Image.asset(
                                          ImageConstants.skillSureHit,
                                          width: 15,
                                        ),
                                      ),
                                    ],
                                    TextSpan(
                                      text: ' ${type!.enUS}',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (damage.isEmpty) ...[
              Text(
                description.enUS[0],
                style: const TextStyle(
                  fontSize: 16,
                  color: ColorConstants.gray,
                  fontFamily: 'HelveticaNeueLTProLight',
                ),
              ),
            ] else ...[
              for (int index = 0; index < damage.length; index++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (damage[index].level != null)
                      Text(
                        'Level ${damage[index].level}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: ColorConstants.deepYellow,
                        ),
                      ),
                    Text(
                      description.enUS[index],
                      style: const TextStyle(
                        fontSize: 16,
                        color: ColorConstants.gray,
                        fontFamily: 'HelveticaNeueLTProLight',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      damage[index].name.enUS,
                      style: const TextStyle(
                        fontSize: 18,
                        color: ColorConstants.gray,
                      ),
                    ),
                    if (damage[index].description != null)
                      Text(
                        damage[index].description!.enUS,
                        style: const TextStyle(
                          fontSize: 16,
                          color: ColorConstants.gray,
                          fontFamily: 'HelveticaNeueLTProLight',
                        ),
                      ),
                    Text(
                      'Formula: ${damage[index].formula}',
                      style: const TextStyle(
                        fontSize: 17,
                        color: ColorConstants.yellow,
                      ),
                    ),
                    Text(
                      'Value: ${damage[index].value}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: ColorConstants.red,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
            ],
            if (imageScreenshot != null) ...[
              const SizedBox(height: 10),
              CachedNetworkImage(
                placeholder: (_, __) => const PokeballLoading(),
                imageUrl: imageScreenshot!,
                fit: BoxFit.cover,
                height: 150,
                width: double.infinity,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
