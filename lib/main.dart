import 'package:db_unite/src/routes/app_route_generator.dart';
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
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      title: 'DB Unite',
      initialRoute: AppRoutes.splashscreen,
      defaultTransition: Transition.fade,
      onGenerateRoute: AppRouteGenerator().generateRoute,
    );
  }
}
