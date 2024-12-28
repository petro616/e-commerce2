import 'package:ecomerce_app2/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends GetView<OnboardingControllerImp> {
  const CustomButtonOnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: MaterialButton(
        minWidth: 200,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        color: const Color.fromARGB(255, 233, 153, 33),
        textColor: const Color.fromARGB(255, 149, 42, 3),
        onPressed: () {
          controller.next();
        },
        child: const Text(
          "Continue",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
