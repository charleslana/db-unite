import 'package:db_unite/src/models/translation_model.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/enum/type_ability_enum.dart';
import 'package:db_unite/src/pages/tabs-pokemon-details/models/effect_levels_ability_model.dart';

class AbilityModel {
  const AbilityModel({
    required this.name,
    required this.imageAbility,
    this.imageScreenshot,
    this.title,
    required this.cooldownLevels,
    required this.cooldown,
    this.type,
    this.description,
    required this.levels,
    this.typeEnum,
    required this.effectLevels,
  });

  final String name;
  final String imageAbility;
  final String? imageScreenshot;
  final TranslationModel? title;
  final List<int> cooldownLevels;
  final List<double> cooldown;
  final TranslationModel? type;
  final TranslationModel? description;
  final List<int> levels;
  final TypeAbilityEnum? typeEnum;
  final List<EffectLevelsAbilityModel> effectLevels;
}
