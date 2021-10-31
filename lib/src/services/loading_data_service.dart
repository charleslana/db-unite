import 'package:get_storage/get_storage.dart';

class LoadingDataService {
  final GetStorage _box = GetStorage();
  final String _key = 'name';

  String? loadNameFromBox() => _box.read(_key);

  void saveNameToBox(String name) => _box.write(_key, name);
}
