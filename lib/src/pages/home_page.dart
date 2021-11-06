import 'package:db_unite/src/constants/color_constants.dart';
import 'package:db_unite/src/constants/image_constants.dart';
import 'package:db_unite/src/controllers/loading_data_controller.dart';
import 'package:db_unite/src/data/home_grid_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoadingDataController loadingDataController =
        Get.put(LoadingDataController());

    return WillPopScope(
      onWillPop: () async {
        await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorConstants.scaffold,
          body: Column(
            children: [
              Container(
                width: Get.width,
                height: 150,
                decoration: const BoxDecoration(
                  color: ColorConstants.appBarBackground,
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
                                color: ColorConstants.text,
                                fontFamily: 'HelveticaNeueLTProLight',
                                fontSize: 15,
                              ),
                              children: [
                                TextSpan(
                                  text: loadingDataController.name,
                                  style: const TextStyle(
                                    color: ColorConstants.text,
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
                            color: ColorConstants.text,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    SizedBox(
                      width: Get.width,
                      height: Get.height,
                      child: Opacity(
                        opacity: 0.1,
                        child: Image.asset(
                          ImageConstants.pokeball,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(12),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: Get.width / (Get.height / 2),
                      ),
                      itemCount: HomeGridData().list.length,
                      itemBuilder: (_, index) {
                        final homeGrid = HomeGridData().list[index];

                        return GestureDetector(
                          onTap: () => Get.toNamed<dynamic>(homeGrid.route),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Container(
                                  height: 100,
                                  color: ColorConstants.avatar,
                                  child: Image.asset(homeGrid.image),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Flexible(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    homeGrid.text,
                                    style: const TextStyle(
                                      color: ColorConstants.text,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
