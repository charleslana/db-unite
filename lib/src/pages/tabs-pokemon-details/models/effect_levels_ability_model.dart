import 'package:db_unite/src/models/translation_model.dart';

class EffectLevelsAbilityModel {
  EffectLevelsAbilityModel({
    this.descriptionLevel,
    this.name,
    this.description,
    this.level,
    this.value,
    this.formula,
  });

  final TranslationModel? descriptionLevel;
  final TranslationModel? name;
  final TranslationModel? description;
  final int? level;
  final int? value;
  final String? formula;
}
