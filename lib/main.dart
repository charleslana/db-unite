import 'package:db_unite/src/constants/app_constants.dart';
import 'package:db_unite/src/routes/app_route_generator.dart';
import 'package:db_unite/src/services/theme_service.dart';
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
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      theme: AppConstants().themeLight,
      darkTheme: AppConstants().themeDark,
      themeMode: ThemeService().theme,
      initialRoute: AppRoutes.splashscreen,
      defaultTransition: Transition.fade,
      onGenerateRoute: AppRouteGenerator().generateRoute,
    );
  }
}
