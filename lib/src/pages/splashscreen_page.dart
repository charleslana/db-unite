import 'package:db_unite/src/constants/app_constants.dart';
import 'package:db_unite/src/controllers/splashscreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashscreenPage extends StatelessWidget {
  const SplashscreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashscreenController());

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset(AppConstants.imageLogo),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'DB Unite',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'HelveticaNeueLTProExtraBlack',
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Version: 1.0.0'),
                    Text('Created by Charles Lana'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
