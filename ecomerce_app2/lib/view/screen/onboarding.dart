import "package:ecomerce_app2/controller/onboarding_controller.dart";
import "package:ecomerce_app2/core/constant/colors.dart";
import "package:ecomerce_app2/view/widget/onboarding/customslider.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class Onboarding extends StatelessWidget {
  const Onboarding({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImp());
    return const Scaffold(
        backgroundColor: AppColor.colorScaffoldonboarding,
        body: SafeArea(child: CustomSliderOnBoarding()));
  }
}
