import 'package:db_unite/src/constants/theme_constants.dart';
import 'package:db_unite/src/routes/app_route_generator.dart';
import 'package:db_unite/src/services/language_service.dart';
import 'package:db_unite/src/services/theme_service.dart';
import 'package:db_unite/src/translation/app_translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DB Unite',
      translationsKeys: AppTranslation().translationsKeys,
      locale: LanguageService().locale ?? Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeConstants().light,
      darkTheme: ThemeConstants().dark,
      themeMode: ThemeService().theme,
      initialRoute: AppRoutes.splashscreen,
      defaultTransition: Transition.fade,
      onGenerateRoute: AppRouteGenerator().generateRoute,
    );
  }
}
