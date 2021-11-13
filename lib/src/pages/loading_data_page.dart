import 'package:db_unite/src/components/button_orange.dart';
import 'package:db_unite/src/components/pokeball_loading.dart';
import 'package:db_unite/src/constants/image_constants.dart';
import 'package:db_unite/src/controllers/loading_data_controller.dart';
import 'package:db_unite/src/routes/app_route_generator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingDataPage extends StatelessWidget {
  const LoadingDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoadingDataController loadingDataController =
        Get.put(LoadingDataController());
    final GlobalKey<FormState> key = GlobalKey<FormState>();

    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstants.loadingData),
                fit: BoxFit.cover,
              ),
            ),
            child: Obx(() {
              return Stack(
                children: [
                  Center(
                    child: Container(
                      width: Get.width * 0.75,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: loadingDataController.isConnected.value
                            ? loadingDataController.isNewVersionApp.value
                                ? Text(
                                    'loadingDataUpdateApp'.tr,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  )
                                : loadingDataController.isLoading.value
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 3,
                                            child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                'loadingDataInfo'.tr,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          const Flexible(
                                              child: PokeballLoading()),
                                        ],
                                      )
                                    : FractionallySizedBox(
                                        widthFactor: 0.4,
                                        heightFactor: 0.05,
                                        child: ButtonOrange(
                                          onTap:
                                              loadingDataController.name.isEmpty
                                                  ? () =>
                                                      Get.bottomSheet<dynamic>(
                                                          Container(
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      30,
                                                                  vertical: 15),
                                                          child: Center(
                                                            child: Column(
                                                              children: [
                                                                Text(
                                                                  'loadingDataBottomSheetTextFirst'
                                                                      .tr,
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          16),
                                                                ),
                                                                Text(
                                                                  'loadingDataBottomSheetTextSecond'
                                                                      .tr,
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          16),
                                                                ),
                                                                const SizedBox(
                                                                    height: 20),
                                                                Form(
                                                                  key: key,
                                                                  child:
                                                                      TextFormField(
                                                                    decoration:
                                                                        InputDecoration(
                                                                      labelText:
                                                                          'loadingDataBottomSheetInput'
                                                                              .tr,
                                                                      border:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(25),
                                                                      ),
                                                                    ),
                                                                    validator:
                                                                        (String?
                                                                            value) {
                                                                      if (value!
                                                                          .trim()
                                                                          .isEmpty) {
                                                                        return 'loadingDataBottomSheetFirstValidate'
                                                                            .tr;
                                                                      }
                                                                      if (value
                                                                              .trim()
                                                                              .length >
                                                                          20) {
                                                                        return 'loadingDataBottomSheetSecondValidate'
                                                                            .tr;
                                                                      }
                                                                      loadingDataController
                                                                              .name =
                                                                          value
                                                                              .trim();
                                                                      return null;
                                                                    },
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                    height: 20),
                                                                ButtonOrange(
                                                                    onTap:
                                                                        () => {
                                                                              if (key.currentState!.validate())
                                                                                Get.toNamed<dynamic>(AppRoutes.home),
                                                                            },
                                                                    text:
                                                                        'loadingDataBottomSheetButtonValidate'
                                                                            .tr),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ))
                                                  : () => Get.toNamed<dynamic>(
                                                      AppRoutes.home),
                                          text:
                                              'loadingDataBottomSheetButtonStart'
                                                  .tr,
                                        ),
                                      )
                            : Text(
                                'loadingDataError'.tr,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: loadingDataController.isLoading.value,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            'loadingDataInternetConnection'.tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
