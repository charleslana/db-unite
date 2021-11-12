import 'package:db_unite/src/components/custom_circle_avatar.dart';
import 'package:db_unite/src/constants/color_constants.dart';
import 'package:db_unite/src/constants/image_constants.dart';
import 'package:db_unite/src/controllers/home_controller.dart';
import 'package:db_unite/src/controllers/language_controller.dart';
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
    final HomeController homeController = Get.put(HomeController());

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
                          onPressed: () {
                            homeController.tabController.animateTo(0);
                            Get.dialog<dynamic>(
                              Dialog(
                                backgroundColor:
                                    ColorConstants.appBarBackground,
                                child: SizedBox(
                                  width: Get.width * 0.75,
                                  height: Get.height * 0.50,
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          SizedBox(
                                            width: double.infinity,
                                            height: 50,
                                            child: TabBar(
                                              controller:
                                                  homeController.tabController,
                                              labelColor: ColorConstants.text,
                                              indicatorColor:
                                                  ColorConstants.background,
                                              isScrollable: true,
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              enableFeedback: true,
                                              tabs: const [
                                                Tab(child: Text('Idioma')),
                                                Tab(child: Text('Nome')),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            right: 0,
                                            child: IconButton(
                                              onPressed: Get.back,
                                              icon: const Icon(
                                                Icons.close,
                                                color: ColorConstants.text,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Obx(() {
                                        return Expanded(
                                          child: TabBarView(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            controller:
                                                homeController.tabController,
                                            children: [
                                              _languageTab(),
                                              const Center(child: Text('Nome')),
                                            ],
                                          ),
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
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
                        childAspectRatio: Get.width / (Get.height / 1.5),
                      ),
                      itemCount: HomeGridData().list.length,
                      itemBuilder: (_, index) {
                        final homeGrid = HomeGridData().list[index];

                        return GestureDetector(
                          onTap: () => Get.toNamed<dynamic>(homeGrid.route),
                          child: Column(
                            children: [
                              CustomCircleAvatar(
                                image: homeGrid.image,
                                height: 100,
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

  Widget _languageTab() {
    final LanguageController languageController = Get.put(LanguageController());
    final List<Widget> chips = [];
    Widget widget;

    for (int index = 0; index < languageController.languages.length; index++) {
      widget = ChoiceChip(
        selected: languageController.selectedIndex.value == index,
        label: Text(
          index == 0 ? 'languageEnglish'.tr : 'languagePortuguese'.tr,
          style: const TextStyle(color: Colors.white),
        ),
        elevation: 0,
        visualDensity: const VisualDensity(vertical: 2),
        pressElevation: 5,
        backgroundColor: Colors.black54,
        selectedColor: ColorConstants.background,
        onSelected: (_) => languageController.changeLanguage(
            languageController.languages[index].symbol, index),
      );

      chips.add(widget);
    }

    return Center(
      child: Wrap(
        runSpacing: 10,
        spacing: 10,
        children: chips,
      ),
    );
  }
}
