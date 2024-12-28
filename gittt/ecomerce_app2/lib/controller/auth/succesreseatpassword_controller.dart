import 'package:ecomerce_app2/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccesreseatpasswordController extends GetxController {
  goToLogin();
}

class SuccesreseatpasswordControllerimp extends SuccesreseatpasswordController {
  @override
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
