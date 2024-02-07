import 'package:flutter/material.dart';
import 'package:splashscreenapp/App/view/home.dart';
import 'package:splashscreenapp/global.dart';
import 'package:splashscreenapp/utlis/router/routes.dart';

import '../../splashSreen/View/Welcome.dart';

class AppRouter {
  static MaterialPageRoute onGenerate(RouteSettings settings) {
    bool isTheFirstTime = Global.storageService.getDeviceFirstOpen();
    print("initial route ${settings.name}");

    if (settings.name == Routes.welcome && true) {
      return MaterialPageRoute(builder: (_) => Welcome());
    } else if (settings.name == Routes.welcome && isTheFirstTime == false) {
      return MaterialPageRoute(builder: (_) => const HomePage2());
    }
    switch (settings.name) {
      case Routes.home2:
        return MaterialPageRoute(builder: (_) => const HomePage2());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.home3:
        return MaterialPageRoute(builder: (_) => const HomePage3());
      default:
        return MaterialPageRoute(builder: (_) => const HomePage3());
    }
  }
}
