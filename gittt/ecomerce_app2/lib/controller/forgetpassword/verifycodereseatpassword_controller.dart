import 'package:ecomerce_app2/core/class/status_request.dart';
import 'package:ecomerce_app2/core/constant/routes.dart';
import 'package:ecomerce_app2/core/function/handlingdatacontroller.dart';
import 'package:ecomerce_app2/data/datasource/remote/forgetpassword/verifycodeforpassword.dart';
import 'package:get/get.dart';

abstract class VerifycodepasswordController extends GetxController {
  verifycodePassword();
  gotoReseatPassword(verifycode);
}

class VerifycodepasswordControllerimp extends VerifycodepasswordController {
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  VerifycodeforpasswordData verifycodeforpasswordData =
      VerifycodeforpasswordData(Get.find());
  @override
  verifycodePassword() {}

  @override
  gotoReseatPassword(verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifycodeforpasswordData.postData(email!, verifycode);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.offNamed(AppRoute.reseatPassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(
            title: "WARNING", middleText: "YOUR CODE IS NOT CORRECT ");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }
}
