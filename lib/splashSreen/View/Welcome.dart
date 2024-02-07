import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:splashscreenapp/splashSreen/View/widgets.dart';

import '../../utlis/Mystrings.dart';
import '../notifier/welcome_notifier.dart';

//M1 : statefull setstate
//M2 : state manager (reverpod) 4 "mohammed"  user1

class Welcome extends ConsumerWidget {
  Welcome({super.key});

  PageController controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(indexDotProvider);
    return Scaffold(
        body: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        PageView(
          controller: controller,
          onPageChanged: (value) {
            ref.read(indexDotProvider.notifier).changeIndex(value);
          },
          children: [
            appOnBoardingPage(
                context: context,
                index: 1,
                controller: controller,
                imagePath: "assets/images/bureau.jpg",
                title: AppString.fisrtWelcometitle,
                subTitle: AppString.fisrtWelcomeSubtitle),
            appOnBoardingPage(
                context: context,
                index: 2,
                controller: controller,
                imagePath: "assets/images/chaise_femme.jpg",
                title: AppString.secondeWelcometitle,
                subTitle: AppString.secondeWelcomeSubtitle),
            appOnBoardingPage(
                context: context,
                index: 3,
                controller: controller,
                imagePath: "assets/images/pen_wemen.jpg",
                title: AppString.therdWelcometitle,
                subTitle: AppString.therdWelcomeSubtitle),
          ],
        ),
        Positioned(
            bottom: 50,
            child: DotsIndicator(
              position: index,
              dotsCount: 3,
              mainAxisAlignment: MainAxisAlignment.center,
              decorator: DotsDecorator(
                  size: const Size.square(9),
                  activeSize: const Size(24, 8),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
            )),
      ],
    ));
  }
}
