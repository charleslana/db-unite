import 'package:db_unite/src/constants/color_constants.dart';
import 'package:db_unite/src/constants/image_constants.dart';
import 'package:db_unite/src/controllers/loading_data_controller.dart';
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
    return Card(
      elevation: 0,
      color: ColorConstants.background.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            _defaultAbility(ability),
            if (upgradeChoices != null)
              if (upgradeChoices!.isNotEmpty)
                Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Expanded(
                            child: Divider(color: ColorConstants.yellow)),
                        const SizedBox(width: 10),
                        Text(
                          'pokemonDetailsAbilityUpgradeChoices'
                              .trParams({'ability': ability.name}),
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
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var i = 0; i < upgradeChoices!.length; i++) ...[
                            if (i > 0)
                              const VerticalDivider(
                                  color: ColorConstants.yellow),
                            Expanded(
                                child: _defaultAbility(upgradeChoices![i])),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
          ],
        ),
      ),
    );
  }

  Widget _defaultAbility(AbilityModel ability) {
    final LoadingDataController loadingDataController =
        Get.put(LoadingDataController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Image.asset(
                ImageConstants().getPokemonAbility(
                  ability.imagePokemon,
                  ability.imageAbility,
                ),
                fit: BoxFit.scaleDown,
                height: 50,
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      ability.name,
                      style: const TextStyle(
                        fontSize: 20,
                        color: ColorConstants.text,
                      ),
                    ),
                  ),
                  if (ability.title != null)
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'languageCode'.tr == 'en'
                            ? ability.title!.enUS
                            : ability.title!.ptBR,
                        style: const TextStyle(
                          fontSize: 16,
                          color: ColorConstants.gray,
                        ),
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
                        if (ability.type != null)
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
                                    color: _colorType(ability.type!.enUS),
                                  ),
                                  children: [
                                    _imageType(ability.type!.enUS),
                                    TextSpan(
                                      text: 'languageCode'.tr == 'en'
                                          ? ' ${ability.type!.enUS}'
                                          : ' ${ability.type!.ptBR}',
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
            ),
          ],
        ),
        const SizedBox(height: 10),
        if (ability.description != null)
          Text(
            'languageCode'.tr == 'en'
                ? ability.description!.enUS
                : ability.description!.ptBR,
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
                  'pokemonDetailsAbilityLevel'
                      .trParams({'level': effectLevel.level.toString()}),
                  style: const TextStyle(
                    fontSize: 16,
                    color: ColorConstants.deepYellow,
                  ),
                ),
              if (effectLevel.descriptionLevel != null)
                Text(
                  'languageCode'.tr == 'en'
                      ? effectLevel.descriptionLevel!.enUS
                      : effectLevel.descriptionLevel!.ptBR,
                  style: const TextStyle(
                    fontSize: 16,
                    color: ColorConstants.gray,
                    fontFamily: 'HelveticaNeueLTProLight',
                  ),
                ),
              const SizedBox(height: 10),
              if (effectLevel.name != null)
                Text(
                  'languageCode'.tr == 'en'
                      ? effectLevel.name!.enUS
                      : effectLevel.name!.ptBR,
                  style: const TextStyle(
                    fontSize: 18,
                    color: ColorConstants.gray,
                  ),
                ),
              if (effectLevel.description != null)
                Text(
                  'languageCode'.tr == 'en'
                      ? effectLevel.description!.enUS
                      : effectLevel.description!.ptBR,
                  style: const TextStyle(
                    fontSize: 16,
                    color: ColorConstants.gray,
                    fontFamily: 'HelveticaNeueLTProLight',
                  ),
                ),
              if (effectLevel.formula != null)
                Text(
                  'pokemonDetailsAbilityFormula'
                      .trParams({'formula': effectLevel.formula!}),
                  style: const TextStyle(
                    fontSize: 17,
                    color: ColorConstants.yellow,
                  ),
                ),
              if (effectLevel.value != null)
                Text(
                  'pokemonDetailsAbilityValue'
                      .trParams({'value': effectLevel.value.toString()}),
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
          Image.asset(
            ImageConstants().getPokemonScreenshot(
              ability.imagePokemon,
              ability.imageScreenshot!,
            ),
            fit: BoxFit.cover,
            width: double.infinity,
            height: 150,
          ),
        ],
      ],
    );
  }

  WidgetSpan _imageType(String type) {
    WidgetSpan widgetSpan;

    switch (type) {
      case 'Area':
        widgetSpan = WidgetSpan(
          child: Image.asset(
            ImageConstants.skillArea,
            width: 15,
          ),
        );
        break;
      case 'Buff':
        widgetSpan = WidgetSpan(
          child: Image.asset(
            ImageConstants.skillBuff,
            width: 15,
          ),
        );
        break;
      case 'Dash':
        widgetSpan = WidgetSpan(
          child: Image.asset(
            ImageConstants.skillDash,
            width: 15,
          ),
        );
        break;
      case 'Debuff':
        widgetSpan = WidgetSpan(
          child: Image.asset(
            ImageConstants.skillDebuff,
            width: 15,
          ),
        );
        break;
      case 'Hindrance':
        widgetSpan = WidgetSpan(
          child: Image.asset(
            ImageConstants.skillHindrance,
            width: 15,
          ),
        );
        break;
      case 'Melee':
        widgetSpan = WidgetSpan(
          child: Image.asset(
            ImageConstants.skillMelee,
            width: 15,
          ),
        );
        break;
      case 'Ranged':
        widgetSpan = WidgetSpan(
          child: Image.asset(
            ImageConstants.skillRanged,
            width: 15,
          ),
        );
        break;
      case 'Recovery':
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

  Color _colorType(String type) {
    Color color;

    switch (type) {
      case 'Area':
        color = ColorConstants.deepRed;
        break;
      case 'Buff':
        color = ColorConstants.deepYellow;
        break;
      case 'Dash':
        color = ColorConstants.blue;
        break;
      case 'Debuff':
        color = ColorConstants.purple;
        break;
      case 'Hindrance':
        color = ColorConstants.purple;
        break;
      case 'Melee':
        color = ColorConstants.deepRed;
        break;
      case 'Ranged':
        color = ColorConstants.deepRed;
        break;
      case 'Recovery':
        color = ColorConstants.green;
        break;
      default:
        color = ColorConstants.deepRed;
    }
    return color;
  }
}
