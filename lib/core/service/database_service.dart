

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DatabaseService extends GetxService {
  late GetStorage box;

  Future<DatabaseService> init() async {
    await GetStorage.init();
    box = GetStorage();
    return this;
  }

  // static ProfileEntity getProfile() => ProfileEntity.fromJson(jsonDecode(jsonEncode(box.read(Databasekey.profile))));

  Future write(String key, dynamic value) => box.write(key, value);

  dynamic read(String key) => box.read(key);

  void remove(String key) => box.remove(key);

  bool hasData(String key) => box.hasData(key);

  Future clear() async => box.erase();
}
