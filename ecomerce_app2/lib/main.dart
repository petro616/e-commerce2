import "package:ecomerce_app2/binding/initialbinding.dart";
import "package:ecomerce_app2/core/localization/changelocal.dart";
import "package:ecomerce_app2/core/localization/translation.dart";
import "package:ecomerce_app2/core/services/servisess.dart";
import "package:ecomerce_app2/routes.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      translations: Mytranslation(),
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      theme: controller.apptheme,
      initialRoute: "/",
      getPages: routes,
      initialBinding: Initialbindings(),
    );
  }
}
