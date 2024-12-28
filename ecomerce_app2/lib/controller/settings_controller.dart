import 'package:ecomerce_app2/core/constant/routes.dart';
import 'package:ecomerce_app2/core/services/servisess.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myservices = Get.find();
  logout() {
    myservices.sharedPreferences.clear();
    Get.offNamed(AppRoute.login);
  }
}
