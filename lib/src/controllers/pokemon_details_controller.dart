import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PokemonDetailsController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(
      length: 4,
      vsync: this,
    );
    super.onInit();
  }
}
