import 'package:ecomerce_app2/controller/onboarding_controller.dart';
import 'package:ecomerce_app2/core/constant/colors.dart';
import 'package:ecomerce_app2/data/datasource/static/static.dart';
import 'package:ecomerce_app2/view/widget/onboarding/custombutton.dart';
import 'package:ecomerce_app2/view/widget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSliderOnBoarding extends GetView<OnboardingControllerImp> {
  const CustomSliderOnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onpagechanged(val);
      },
      itemCount: onboardinglist.length,
      itemBuilder: (context, i) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.elliptical(100, 100)),
                child: Image.asset(
                  onboardinglist[i].image!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 370,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                  decoration: const BoxDecoration(
                      color: AppColor.colorContaineronboarding,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.elliptical(100, 100))),
                  height: 435,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 10, top: 10),
                          alignment: Alignment.topLeft,
                          child: Text(
                            onboardinglist[i].title!,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: AppColor.colorTitleonboarding,
                              fontWeight: FontWeight.w900,
                              fontSize: 25,
                            ),
                          )),
                      Container(
                        margin: const EdgeInsets.only(left: 10, top: 10),
                        alignment: Alignment.topLeft,
                        child: Text(
                          onboardinglist[i].body!,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: AppColor.colorBodyonboarding,
                            fontWeight: FontWeight.w900,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const CustomButtonOnBoarding(),
                      const SizedBox(height: 15),
                      const CustomSmoothPageOnBoarding()
                    ],
                  )),
            ],
          ),
        );
      },
    );
  }
}
