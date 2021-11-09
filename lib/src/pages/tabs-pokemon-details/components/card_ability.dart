import 'package:cached_network_image/cached_network_image.dart';
import 'package:db_unite/src/components/pokeball_loading.dart';
import 'package:db_unite/src/constants/color_constants.dart';
import 'package:db_unite/src/constants/image_constants.dart';
import 'package:db_unite/src/controllers/loading_data_controller.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/enum/type_ability_enum.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/models/ability_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardAbility extends StatelessWidget {
  const CardAbility({
    required this.ability,
    this.upgradeChoices,
    Key? key,
  }) : super(key: key);

  final AbilityModel ability;
  final List<AbilityModel>? upgradeChoices;

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
                  imageUrl: ability.imageAbility,
                  fit: BoxFit.fill,
                  height: 50,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ability.name,
                      style: const TextStyle(
                        fontSize: 20,
                        color: ColorConstants.text,
                      ),
                    ),
                    if (ability.title != null)
                      Text(
                        ability.title!.enUS,
                        style: const TextStyle(
                          fontSize: 16,
                          color: ColorConstants.gray,
                        ),
                      ),
                    if (ability.cooldown.isNotEmpty)
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
                                          ability.cooldownLevels[2]) ...[
                                        TextSpan(
                                            text:
                                                ' ${ability.cooldown[2].toString()}s'),
                                      ] else if (loadingDataController
                                              .pokemonLevel.value >=
                                          ability.cooldownLevels[1]) ...[
                                        TextSpan(
                                            text:
                                                ' ${ability.cooldown[1].toString()}s'),
                                      ] else ...[
                                        TextSpan(
                                            text:
                                                ' ${ability.cooldown[0].toString()}s'),
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
                              child: ability.typeEnum != null
                                  ? RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: _colorType(ability.typeEnum!),
                                        ),
                                        children: [
                                          _imageType(ability.typeEnum!),
                                          TextSpan(
                                            text: ' ${ability.type!.enUS}',
                                          ),
                                        ],
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (ability.description != null)
              Text(
                ability.description!.enUS,
                style: const TextStyle(
                  fontSize: 16,
                  color: ColorConstants.gray,
                  fontFamily: 'HelveticaNeueLTProLight',
                ),
              ),
            for (var effectLevel in ability.effectLevels)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (effectLevel.level != null)
                    Text(
                      'Level ${effectLevel.level}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: ColorConstants.deepYellow,
                      ),
                    ),
                  if (effectLevel.descriptionLevel != null)
                    Text(
                      effectLevel.descriptionLevel!.enUS,
                      style: const TextStyle(
                        fontSize: 16,
                        color: ColorConstants.gray,
                        fontFamily: 'HelveticaNeueLTProLight',
                      ),
                    ),
                  const SizedBox(height: 10),
                  if (effectLevel.name != null)
                    Text(
                      effectLevel.name!.enUS,
                      style: const TextStyle(
                        fontSize: 18,
                        color: ColorConstants.gray,
                      ),
                    ),
                  if (effectLevel.description != null)
                    Text(
                      effectLevel.description!.enUS,
                      style: const TextStyle(
                        fontSize: 16,
                        color: ColorConstants.gray,
                        fontFamily: 'HelveticaNeueLTProLight',
                      ),
                    ),
                  if (effectLevel.formula != null)
                    Text(
                      'Formula: ${effectLevel.formula}',
                      style: const TextStyle(
                        fontSize: 17,
                        color: ColorConstants.yellow,
                      ),
                    ),
                  if (effectLevel.value != null)
                    Text(
                      'Value: ${effectLevel.value}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: ColorConstants.red,
                      ),
                    ),
                  const SizedBox(height: 10),
                ],
              ),
            if (ability.imageScreenshot != null) ...[
              const SizedBox(height: 10),
              CachedNetworkImage(
                placeholder: (_, __) => const PokeballLoading(),
                imageUrl: ability.imageScreenshot!,
                fit: BoxFit.cover,
                height: 150,
                width: double.infinity,
              ),
            ],
            if (upgradeChoices != null)
              if (upgradeChoices!.isEmpty)
                Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Expanded(
                            child: Divider(color: ColorConstants.yellow)),
                        const SizedBox(width: 10),
                        Text(
                          '${ability.name} Upgrade Choices',
                          style: const TextStyle(
                            fontSize: 20,
                            color: ColorConstants.gray,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                            child: Divider(color: ColorConstants.yellow)),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
          ],
        ),
      ),
    );
  }

  WidgetSpan _imageType(TypeAbilityEnum typeAbilityEnum) {
    WidgetSpan widgetSpan;

    switch (typeAbilityEnum) {
      case TypeAbilityEnum.area:
        widgetSpan = WidgetSpan(
          child: Image.asset(
            ImageConstants.skillArea,
            width: 15,
          ),
        );
        break;
      case TypeAbilityEnum.buff:
        widgetSpan = WidgetSpan(
          child: Image.asset(
            ImageConstants.skillBuff,
            width: 15,
          ),
        );
        break;
      case TypeAbilityEnum.dash:
        widgetSpan = WidgetSpan(
          child: Image.asset(
            ImageConstants.skillDash,
            width: 15,
          ),
        );
        break;
      case TypeAbilityEnum.debuff:
        widgetSpan = WidgetSpan(
          child: Image.asset(
            ImageConstants.skillDebuff,
            width: 15,
          ),
        );
        break;
      case TypeAbilityEnum.hindrance:
        widgetSpan = WidgetSpan(
          child: Image.asset(
            ImageConstants.skillHindrance,
            width: 15,
          ),
        );
        break;
      case TypeAbilityEnum.melee:
        widgetSpan = WidgetSpan(
          child: Image.asset(
            ImageConstants.skillMelee,
            width: 15,
          ),
        );
        break;
      case TypeAbilityEnum.ranged:
        widgetSpan = WidgetSpan(
          child: Image.asset(
            ImageConstants.skillRanged,
            width: 15,
          ),
        );
        break;
      case TypeAbilityEnum.recovery:
        widgetSpan = WidgetSpan(
          child: Image.asset(
            ImageConstants.skillRecovery,
            width: 15,
          ),
        );
        break;
      default:
        widgetSpan = WidgetSpan(
          child: Image.asset(
            ImageConstants.skillSureHit,
            width: 15,
          ),
        );
    }
    return widgetSpan;
  }

  Color _colorType(TypeAbilityEnum typeAbilityEnum) {
    Color color;

    switch (typeAbilityEnum) {
      case TypeAbilityEnum.area:
        color = ColorConstants.deepRed;
        break;
      case TypeAbilityEnum.buff:
        color = ColorConstants.deepYellow;
        break;
      case TypeAbilityEnum.dash:
        color = ColorConstants.blue;
        break;
      case TypeAbilityEnum.debuff:
        color = ColorConstants.purple;
        break;
      case TypeAbilityEnum.hindrance:
        color = ColorConstants.purple;
        break;
      case TypeAbilityEnum.melee:
        color = ColorConstants.deepRed;
        break;
      case TypeAbilityEnum.ranged:
        color = ColorConstants.deepRed;
        break;
      case TypeAbilityEnum.recovery:
        color = ColorConstants.green;
        break;
      default:
        color = ColorConstants.deepRed;
    }
    return color;
  }
}
