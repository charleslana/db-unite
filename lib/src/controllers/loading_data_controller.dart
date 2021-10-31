import 'dart:async';

import 'package:get/get.dart';

class LoadingDataController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isConnected = true.obs;
  RxBool isNewVersionApp = false.obs;
  final RxString _name = ''.obs;

  @override
  void onInit() {
    Timer(
      const Duration(seconds: 1),
      () => isLoading.value = false,
    );
    super.onInit();
  }

  String get name => _name.value;

  set name(String newName) {
    _name.value = newName;
  }
}
