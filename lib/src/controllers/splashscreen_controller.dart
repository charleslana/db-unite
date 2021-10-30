import 'dart:async';

import 'package:db_unite/src/routes/app_route_generator.dart';
import 'package:get/get.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    Timer(
      const Duration(seconds: 2),
      () => Get.offNamed<dynamic>(AppRoutes.loadingData),
    );
    super.onInit();
  }
}
