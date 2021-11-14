import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PokemonDetailsController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;
  final ScrollController scrollControllerInfo = ScrollController();
  final ScrollController scrollControllerAbility = ScrollController();
  final ScrollController scrollControllerStatsY = ScrollController();
  final ScrollController scrollControllerStatsX = ScrollController();

  @override
  void onInit() {
    tabController = TabController(
      length: 4,
      vsync: this,
    );
    tabController.addListener(_handleTabSelection);
    super.onInit();
  }

  void _handleTabSelection() {
    if (tabController.indexIsChanging) {
      switch (tabController.index) {
        case 0:
          scrollToUp(scrollControllerInfo);
          break;
        case 1:
          scrollToUp(scrollControllerAbility);
          break;
        case 2:
          scrollToUp(scrollControllerStatsY);
          scrollToUp(scrollControllerStatsX);
          break;
      }
    }
  }

  void scrollToUp(ScrollController scrollController) {
    if (scrollController.hasClients) {
      scrollController.jumpTo(0);
    }
  }
}
