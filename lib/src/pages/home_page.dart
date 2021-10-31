import 'package:db_unite/src/constants/app_constants.dart';
import 'package:db_unite/src/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstants.colorScaffoldHome,
        body: Column(
          children: [
            SizedBox(height: Get.statusBarHeight),
            Container(
              width: Get.width,
              height: 150,
              decoration: const BoxDecoration(
                color: AppConstants.colorMenuHome,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Obx(() {
                        return RichText(
                          text: TextSpan(
                            text: 'Olá, ',
                            style: const TextStyle(
                              color: AppConstants.colorTextHome,
                              fontFamily: 'HelveticaNeueLTProLight',
                              fontSize: 15,
                            ),
                            children: [
                              TextSpan(
                                text: homeController.name,
                                style: const TextStyle(
                                  color: AppConstants.colorTextHome,
                                  fontSize: 20,
                                  fontFamily: 'HelveticaNeueLTProMedium',
                                ),
                              ),
                              const TextSpan(text: '\nSeja Bem vindo!'),
                              const TextSpan(
                                  text: '\nEscolha uma das opções abaixo'),
                            ],
                          ),
                        );
                      }),
                    ),
                    Flexible(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.settings,
                          color: AppConstants.colorTextHome,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(12),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: Get.width / (Get.height / 2),
                ),
                itemCount: 8,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Card(
                      color: AppConstants.colorGridHome,
                      child: Center(
                        child: Text(
                          index.toString(),
                          style: const TextStyle(
                              color: AppConstants.colorTextHome),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
