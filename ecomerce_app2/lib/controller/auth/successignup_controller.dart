import 'package:ecomerce_app2/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessignupController extends GetxController {
  goToLogin();
}

class SuccessignupControllerimp extends SuccessignupController {
  @override
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
