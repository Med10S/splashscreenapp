import 'package:flutter/material.dart';
import 'package:splashscreenapp/utlis/constants.dart';
import 'package:splashscreenapp/utlis/router/routes.dart';

import '../../global.dart';

Widget appOnBoardingPage(
    {required imagePath,
    required BuildContext context,
    required int index,
    required String title,
    required String subTitle,
    required PageController controller}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(imagePath!),
      Text(
        textAlign: TextAlign.center,
        title,
        style: const TextStyle(fontSize: 28),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          textAlign: TextAlign.center,
          subTitle,
          style: const TextStyle(fontSize: 28),
        ),
      ),
      ElevatedButton(
          onPressed: () {
            if (index < 3) {
              controller.animateToPage(index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear);
            } else {
              //bool isthefisrttime=true
              //sharedprefe..
              //routing
              Navigator.pushNamed(context, Routes.home);
              Global.storageService
                  .setBool(AppConst.GET_DEVICE_FIRST_OPEN, false);
            }
          },
          child: Text(
            index < 3 ? "next" : "Get Started",
            style: const TextStyle(fontSize: 16),
          ))
    ],
  );
}

//appOnBoardingPage(imagePath:iubiub,title :iubiub)
