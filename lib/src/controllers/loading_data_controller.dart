import 'dart:async';

import 'package:get/get.dart';

class LoadingDataController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isConnected = true.obs;
  RxBool isNewVersionApp = false.obs;

  @override
  void onInit() {
    Timer(
      const Duration(seconds: 3),
      () => isLoading.value = false,
    );
    super.onInit();
  }
}
