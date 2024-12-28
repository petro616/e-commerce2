import 'package:ecomerce_app2/core/class/status_request.dart';
import 'package:ecomerce_app2/core/constant/routes.dart';
import 'package:ecomerce_app2/core/function/handlingdatacontroller.dart';
import 'package:ecomerce_app2/data/datasource/remote/forgetpassword/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ReseatpasswordController extends GetxController {
  reseatPassword();
  gotoSuccesReseatPassword();
}

class ReseatpasswordControllerimp extends ReseatpasswordController {
  late TextEditingController password;
  late TextEditingController repassword;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  ResetpasswordData resetpasswordData = ResetpasswordData(Get.find());
  bool isShowPassword = true;
  showpassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  reseatPassword() {}

  @override
  void onInit() {
    email = Get.arguments["email"];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }

  @override
  gotoSuccesReseatPassword() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: "WARNING", middleText: "PLEASE ENTER YOUR PASSWORD CORRECT");
    }
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetpasswordData.postData(email!, password.text);
      statusRequest = handlingdata(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          Get.offNamed(AppRoute.succesReseatPassword);
        } else {
          Get.defaultDialog(
              title: "WARNING", middleText: "THERE IS A MISTAKE TRY AGAIN");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }
}
