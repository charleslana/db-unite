import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxString _name = ''.obs;

  String get name => _name.value;

  set name(String newName) {
    _name.value = newName;
  }
}
