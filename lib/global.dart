import 'package:flutter/cupertino.dart';
import 'package:splashscreenapp/utlis/storage.dart';

class Global {
  static late StorageService storageService;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    storageService = await StorageService().init();
  }
}
