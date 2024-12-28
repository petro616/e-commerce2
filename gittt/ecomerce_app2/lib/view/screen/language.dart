import "package:ecomerce_app2/core/constant/routes.dart";
import "package:ecomerce_app2/core/localization/changelocal.dart";
import "package:ecomerce_app2/view/widget/language/custombutonlang.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class Language extends GetView<LocalController> {
  const Language({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[50],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              "1".tr,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )),
            const SizedBox(height: 15),
            Custombutonlang(
              text: "ARABIC",
              onPressed: () {
                controller.changeLang("ar");
                Get.offNamed(AppRoute.onboarding);
              },
            ),
            const SizedBox(height: 10),
            Custombutonlang(
              text: "English",
              onPressed: () {
                controller.changeLang("en");
                Get.offNamed(AppRoute.onboarding);
              },
            )
          ],
        ));
  }
}
