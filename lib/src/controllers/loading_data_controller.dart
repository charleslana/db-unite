import 'dart:async';

import 'package:db_unite/src/services/loading_data_service.dart';
import 'package:get/get.dart';

class LoadingDataController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isConnected = true.obs;
  RxBool isNewVersionApp = false.obs;
  final RxString _name = ''.obs;
  LoadingDataService loadingDataService = LoadingDataService();
  RxList<String> pokemonList = <String>[].obs;
  RxList<String> pokemonFilterList = <String>[].obs;
  RxInt pokemonIndex = 0.obs;
  RxDouble pokemonLevel = 1.0.obs;
  RxInt filterIndex = 0.obs;

  @override
  void onInit() {
    final String? boxName = loadingDataService.loadNameFromBox();
    if (boxName != null) {
      name = boxName;
    }

    Timer(
      const Duration(seconds: 1),
      () => isLoading.value = false,
    );
    super.onInit();
  }

  String get name => _name.value;

  set name(String newName) {
    _name.value = newName;
    loadingDataService.saveNameToBox(newName);
  }
}
