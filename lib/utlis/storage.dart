import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreenapp/utlis/constants.dart';

class StorageService {
  late final SharedPreferences _preferences;

  Future<StorageService> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _preferences.setBool(key, value);
  }

  bool getDeviceFirstOpen() {
    return _preferences.getBool(AppConst.GET_DEVICE_FIRST_OPEN) ?? true;
  }
}
