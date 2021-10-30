import 'dart:math' as math;

import 'package:db_unite/src/constants/app_constants.dart';
import 'package:db_unite/src/controllers/pokeball_loading_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PokeballLoading extends StatelessWidget {
  const PokeballLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PokeballLoadingController pokeballLoadingController =
        Get.put(PokeballLoadingController());

    return AnimatedBuilder(
      animation: pokeballLoadingController.animationController,
      builder: (_, child) {
        return Transform.rotate(
          angle:
              pokeballLoadingController.animationController.value * 2 * math.pi,
          child: child,
        );
      },
      child: Image.asset(
        AppConstants.imagePokeballLoading,
        height: 42,
      ),
    );
  }
}
