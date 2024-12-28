import 'package:ecomerce_app2/core/constant/routes.dart';
import 'package:ecomerce_app2/core/services/servisess.dart';
import 'package:ecomerce_app2/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onpagechanged(int index);
}

class OnboardingControllerImp extends OnBoardingController {
  int currentpage = 0;
  late PageController pageController;
  MyServices myservices = Get.find();
  @override
  next() {
    currentpage++;
    if (currentpage > onboardinglist.length - 1) {
      myservices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoute.login);
    } else {
      pageController.animateToPage(currentpage,
          duration: const Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }

  @override
  onpagechanged(int index) {
    currentpage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
