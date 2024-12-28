import 'package:ecomerce_app2/controller/onboarding_controller.dart';
import 'package:ecomerce_app2/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSmoothPageOnBoarding extends StatelessWidget {
  const CustomSmoothPageOnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImp>(builder: (controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(onboardinglist.length, (index) {
            return AnimatedContainer(
              margin: const EdgeInsets.only(right: 5, left: 5),
              duration: const Duration(seconds: 1),
              height: controller.currentpage == index ? 12 : 15,
              width: controller.currentpage == index ? 25 : 15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color.fromARGB(255, 179, 69, 29)),
            );
          })
        ],
      );
    });
  }
}
