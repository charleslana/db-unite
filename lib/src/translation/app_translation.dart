class AppTranslation {
  Map<String, Map<String, String>> translationsKeys = {
    'en_US': enUS,
    'pt_BR': ptBR,
  };
}

final Map<String, String> enUS = {
  'languageCode': 'en',
  'languageEnglish': 'English',
  'languagePortuguese': 'Portuguese',
  'splashscreenVersion': 'Version @version',
  'splashscreenCreatedBy': 'Created by @name',
  'loadingDataUpdateApp':
      'Alert, your app is out of date, so you can continue it is necessary to update the app.\nThere is a new update available on the Play Store.',
  'loadingDataInfo': 'Loading information from Database',
  'loadingDataBottomSheetTextFirst':
      'This is the first time you have entered the app.',
  'loadingDataBottomSheetTextSecond': 'Please enter your name.',
  'loadingDataBottomSheetInput': 'Name',
  'loadingDataBottomSheetFirstValidate': 'Please enter your name.',
  'loadingDataBottomSheetSecondValidate':
      'Your name must contain a maximum of 20 characters.',
  'loadingDataBottomSheetButtonValidate': 'Continue',
  'loadingDataBottomSheetButtonStart': 'Start',
  'loadingDataError':
      'An error occurred with the server connection, please try again.',
  'loadingDataInternetConnection': 'Make sure you have an internet connection.',
  'homeAppBarFirstText': 'Hello, ',
  'homeAppBarSecondText': '\nWelcome!',
  'homeAppBarThirdText': '\nChoose one of the options below',
  'homeDialogFirstTab': 'Language',
  'homeDialogSecondTab': 'Name',
  'homeDialogInput': 'Name',
  'homeDialogFirstValidate': 'Please enter your name.',
  'homeDialogSecondValidate':
      'Your name must contain a maximum of 20 characters.',
  'homeDialogThirdValidate':
      'The name must not be the same as the current one.',
  'homeDialogButtonValidate': 'Change',
  'homeSnackbarChangeSuccessfullyName': 'Name changed successfully.',
  'homeGridHeldItems': 'Held Items',
  'homeGridBattleItems': 'Battle Items',
  'utilsCloseSnackbar': 'Close',
  'pokemonListSearchInput': 'Search pokémon',
  'filterPokemonAll': 'All',
  'filterPokemonMelee': 'Melee',
  'filterPokemonRanged': 'Ranged',
  'filterPokemonPhysicalAttacker': 'Physical Attacker',
  'filterPokemonSpecialAttacker': 'Special Attacker',
  'filterPokemonAllRounder': 'All-Rounder',
  'filterPokemonAttacker': 'Attacker',
  'filterPokemonDefender': 'Defender',
  'filterPokemonSpeedster': 'Speedster',
  'filterPokemonSupporter': 'Supporter',
  'pokemonDetailsLevel': 'Level @level',
  'pokemonDetailsInfo': 'Info',
  'pokemonDetailsAbilities': 'Abilities',
  'pokemonDetailsStats': 'Stats',
  'pokemonDetailsBuilds': 'Builds',
  'pokemonDetailsInfoHP': 'HP',
  'pokemonDetailsInfoAttack': 'Attack',
  'pokemonDetailsInfoDefense': 'Defense',
  'pokemonDetailsInfoSpAttack': 'Sp. Attack',
  'pokemonDetailsInfoSpDefense': 'Sp. Defense',
  'pokemonDetailsInfoCritRate': 'Crit Rate',
  'pokemonDetailsInfoCDReduction': 'CD Reduction',
  'pokemonDetailsInfoLifesteal': 'Lifesteal',
  'pokemonDetailsInfoNote': 'Note: ',
  'pokemonDetailsInfoOffense': 'Offense',
  'pokemonDetailsInfoEndurance': 'Endurance',
  'pokemonDetailsInfoMobility': 'Mobility',
  'pokemonDetailsInfoScoring': 'Scoring',
  'pokemonDetailsInfoSupport': 'Support',
  'pokemonDetailsInfoEvolvesAt': 'Evolves At @level',
  'pokemonDetailsAbilityUpgradeChoices': '@ability Upgrade Choices',
  'pokemonDetailsAbilityLevel': 'Level @level',
  'pokemonDetailsAbilityFormula': 'Formula: @formula',
  'pokemonDetailsAbilityValue': 'Value: @value',
  'pokemonDetailsStatsLevel': 'Level',
  'pokemonDetailsStatsHP': 'HP',
  'pokemonDetailsStatsAttack': 'Atk',
  'pokemonDetailsStatsDef': 'Def',
  'pokemonDetailsStatsSpAttack': 'Sp. Atk',
  'pokemonDetailsStatsSpDef': 'Sp. Def',
  'pokemonDetailsStatsCritRate': 'Crit Rate',
  'pokemonDetailsStatsCDR': 'CDR',
  'pokemonDetailsStatsLifesteal': 'Lifesteal',
};

final Map<String, String> ptBR = {
  'languageCode': 'pt',
  'languageEnglish': 'Inglês',
  'languagePortuguese': 'Português',
  'splashscreenVersion': 'Versão @version',
  'splashscreenCreatedBy': 'Criado por @name',
  'loadingDataUpdateApp':
      'Alerta, seu aplicativo está desatualizado, para que possa continuar é necessário atualizar o aplicativo.\nA uma nova atualização disponível na Play Store.',
  'loadingDataInfo': 'Carregando informações da Database',
  'loadingDataBottomSheetTextFirst':
      'Esta é a primeira vez que você entra no aplicativo.',
  'loadingDataBottomSheetTextSecond': 'Por favor digite seu nome.',
  'loadingDataBottomSheetInput': 'Nome',
  'loadingDataBottomSheetFirstValidate': 'Por favor insira seu nome.',
  'loadingDataBottomSheetSecondValidate':
      'Seu nome deve conter no máximo 20 caracteres.',
  'loadingDataBottomSheetButtonValidate': 'Continuar',
  'loadingDataBottomSheetButtonStart': 'Iniciar',
  'loadingDataError':
      'Ocorreu um erro com a conexão do servidor, tente novamente.',
  'loadingDataInternetConnection':
      'Certifique-se que haja conexão com a internet.',
  'homeAppBarFirstText': 'Olá, ',
  'homeAppBarSecondText': '\nSeja Bem vindo!',
  'homeAppBarThirdText': '\nEscolha uma das opções abaixo',
  'homeDialogFirstTab': 'Idioma',
  'homeDialogSecondTab': 'Nome',
  'homeDialogInput': 'Nome',
  'homeDialogFirstValidate': 'Por favor insira seu nome.',
  'homeDialogSecondValidate': 'Seu nome deve conter no máximo 20 caracteres.',
  'homeDialogThirdValidate': 'O nome não deve ser igual ao atual.',
  'homeDialogButtonValidate': 'Alterar',
  'homeSnackbarChangeSuccessfullyName': 'Nome alterado com sucesso.',
  'homeGridHeldItems': 'Items Mantidos',
  'homeGridBattleItems': 'Itens de Batalha',
  'utilsCloseSnackbar': 'Fechar',
  'pokemonListSearchInput': 'Pesquisar pokémon',
  'filterPokemonAll': 'Todos',
  'filterPokemonMelee': 'Corpo a corpo',
  'filterPokemonRanged': 'À distância',
  'filterPokemonPhysicalAttacker': 'Atacante Físico',
  'filterPokemonSpecialAttacker': 'Atacante Especial',
  'filterPokemonAllRounder': 'Balanceado',
  'filterPokemonAttacker': 'Atacante',
  'filterPokemonDefender': 'Defensor',
  'filterPokemonSpeedster': 'Velocista',
  'filterPokemonSupporter': 'Suporte',
  'pokemonDetailsLevel': 'Nível @level',
  'pokemonDetailsInfo': 'Informações',
  'pokemonDetailsAbilities': 'Habilidades',
  'pokemonDetailsStats': 'Estatísticas',
  'pokemonDetailsBuilds': 'Builds',
  'pokemonDetailsInfoHP': 'HP',
  'pokemonDetailsInfoAttack': 'Ataque',
  'pokemonDetailsInfoDefense': 'Defesa',
  'pokemonDetailsInfoSpAttack': 'Ataque Esp.',
  'pokemonDetailsInfoSpDefense': 'Defesa Esp.',
  'pokemonDetailsInfoCritRate': 'Taxa Crit',
  'pokemonDetailsInfoCDReduction': 'Redução de CD',
  'pokemonDetailsInfoLifesteal': 'Vida',
  'pokemonDetailsInfoNote': 'Nota: ',
  'pokemonDetailsInfoOffense': 'Ofensa',
  'pokemonDetailsInfoEndurance': 'Resistência',
  'pokemonDetailsInfoMobility': 'Mobilidade',
  'pokemonDetailsInfoScoring': 'Pontuação',
  'pokemonDetailsInfoSupport': 'Suporte',
  'pokemonDetailsInfoEvolvesAt': 'Evolui no @level',
  'pokemonDetailsAbilityUpgradeChoices': '@ability Escolha de Atualização',
  'pokemonDetailsAbilityLevel': 'Nível @level',
  'pokemonDetailsAbilityFormula': 'Fórmula: @formula',
  'pokemonDetailsAbilityValue': 'Valor: @value',
  'pokemonDetailsStatsLevel': 'Nível',
  'pokemonDetailsStatsHP': 'HP',
  'pokemonDetailsStatsAttack': 'Atq',
  'pokemonDetailsStatsDef': 'Def',
  'pokemonDetailsStatsSpAttack': 'Atq Esp.',
  'pokemonDetailsStatsSpDef': 'Def Esp.',
  'pokemonDetailsStatsCritRate': 'Tx. Crit',
  'pokemonDetailsStatsCDR': 'CDR',
  'pokemonDetailsStatsLifesteal': 'Vida',
};
