import 'package:get_storage/get_storage.dart';

class StorageManager {
  final box = GetStorage();

  // --------- default functions ---------
  void setData(String key, dynamic value) {
    box.write(key, value);
    box.save();
  }

  dynamic getData(String key) {
    return box.read(key);
  }

  dynamic clearData() {
    box.erase();
  }

  void eraseStorage() async {
    await box.erase();
  }
}
