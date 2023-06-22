import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todos/core/utils/keys.dart';

class StoargeService extends GetxService {
  late GetStorage _box;

  Future<StoargeService> init() async {
    _box = GetStorage();
    await _box.writeIfNull(taskKey, []);
    return this;
  }

// T means any type (generic)
  T read<T>(String key) {
    return _box.read(key);
  }

  void wrtie(String key, dynamic value) async {
    await _box.write(key, value);
  }
}
