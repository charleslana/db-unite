class TranslationDamage {
  TranslationDamage({
    required this.enUS,
    required this.ptBR,
  });

  final String enUS;
  final String ptBR;
}

class DamageAbilityModel {
  DamageAbilityModel({
    required this.name,
    this.description,
    this.level,
    required this.value,
    required this.formula,
  });

  final TranslationDamage name;
  final TranslationDamage? description;
  final int? level;
  final int value;
  final String formula;
}
