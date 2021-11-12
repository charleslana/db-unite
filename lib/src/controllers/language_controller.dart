import 'package:db_unite/src/models/language_model.dart';
import 'package:db_unite/src/services/language_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  final List<LanguageModel> languages = [
    LanguageModel('English', 'en_US'),
    LanguageModel('Portuguese', 'pt_BR'),
  ];
  String selectedLanguage = Get.locale!.languageCode;
  RxInt selectedIndex = 0.obs;
  LanguageService languageService = LanguageService();

  @override
  void onInit() {
    selectedLanguage = languageService.locale == null
        ? selectedLanguage
        : languageService.locale!.languageCode;

    if (selectedLanguage == 'pt' || selectedLanguage == 'pt_BR') {
      selectedIndex.value = 1;
    } else {
      selectedIndex.value = 0;
    }
    super.onInit();
  }

  void changeLanguage(String language, int index) {
    if (index != selectedIndex.value) {
      selectedIndex.value = index;
      languageService.changeLanguage(Locale(language));
    }
  }
}
