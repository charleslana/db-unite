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
};

final Map<String, String> ptBR = {
  'languageCode': 'pt',
  'languageEnglish': 'Inglês',
  'languagePortuguese': 'Português',
  'splashscreenVersion': 'Versão @version',
};
