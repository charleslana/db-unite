import 'package:db_unite/src/components/pokeball_loading.dart';
import 'package:db_unite/src/constants/app_constants.dart';
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

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppConstants.imageLoadingData),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: Container(
                  width: Get.width * 0.75,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Obx(() {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: loadingDataController.isConnected.value
                          ? loadingDataController.isNewVersionApp.value
                              ? const Text(
                                  'Alerta, seu aplicativo está desatualizado, para que possa continuar é necessário atualizar o aplicativo.\nA uma nova atualização disponível na Play Store.',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                )
                              : loadingDataController.isLoading.value
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Flexible(
                                          flex: 3,
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              'Carregando informações da Database',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        Flexible(child: PokeballLoading()),
                                      ],
                                    )
                                  : FractionallySizedBox(
                                      widthFactor: 0.4,
                                      heightFactor: 0.05,
                                      child: ElevatedButton(
                                        onPressed: () => Get.offNamed<dynamic>(
                                            AppRoutes.home),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.deepOrangeAccent,
                                          onPrimary: Colors.white,
                                          shape: const StadiumBorder(),
                                          textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        child: const Text('Entrar'),
                                      ),
                                    )
                          : const Text(
                              'Ocorreu um erro com a conexão do servidor, tente novamente.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                    );
                  }),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'Certifique-se que haja conexão com a internet.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
