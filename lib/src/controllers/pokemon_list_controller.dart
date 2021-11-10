import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PokemonListController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }
}
