import 'package:flutter/material.dart';
import 'package:splashscreenapp/App/view/home.dart';
import 'package:splashscreenapp/Authentification/regiter/view/register.dart';
import 'package:splashscreenapp/global.dart';
import 'package:splashscreenapp/utlis/router/routes.dart';

import '../../Authentification/login/view/login.dart';
import '../../splashSreen/View/Welcome.dart';

class AppRouter {
  static MaterialPageRoute onGenerate(RouteSettings settings) {
    bool isloggedIn = Global.storageService.isLoggedIn();
    bool isTheFirstTime = Global.storageService.getDeviceFirstOpen();
    print("initial route ${settings.name}");

    if (settings.name == Routes.welcome && isTheFirstTime) {
      return MaterialPageRoute(builder: (_) => Welcome());
    } else if (settings.name == Routes.welcome &&
        isTheFirstTime == false &&
        isloggedIn == false) {
      return MaterialPageRoute(builder: (_) => const LogIn());
    } else if (settings.name == Routes.welcome && isloggedIn) {
      return MaterialPageRoute(builder: (_) => const HomePage3());
    }
    switch (settings.name) {
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const Register());

      default:
        return MaterialPageRoute(builder: (_) => const HomePage3());
    }
  }
}
