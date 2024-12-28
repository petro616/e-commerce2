import 'package:ecomerce_app2/core/class/status_request.dart';
import 'package:ecomerce_app2/core/constant/routes.dart';
import 'package:ecomerce_app2/core/function/handlingdatacontroller.dart';
import 'package:ecomerce_app2/core/services/servisess.dart';
import 'package:ecomerce_app2/data/datasource/remote/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToPageSignUp();
  gotoforgetpassword();
}

class LoginControllerimp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isShowPassword = true;
  showpassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  login() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      statusRequest = handlingdata(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          if (response["data"]["user_approve"] == "1") {
            myServices.sharedPreferences
                .setString("id", response["data"]["user_id"]);
            myServices.sharedPreferences
                .setString("username", response["data"]["user_name"]);
            myServices.sharedPreferences
                .setString("email", response["data"]["user_email"]);
            myServices.sharedPreferences
                .setString("phone", response["data"]["user_phone"]);
            myServices.sharedPreferences.setString("step", "2");
            Get.offNamed(AppRoute.homescreen);
          } else {
            Get.toNamed(AppRoute.verifycodesignup,
                arguments: {"email": email.text});
          }
        } else {
          Get.defaultDialog(
              title: "WARNING",
              middleText: "YOUR EMAIL OR YOUR PASSWORD OS NOT CORRECT");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  goToPageSignUp() {
    Get.offAllNamed(AppRoute.signup);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  gotoforgetpassword() {
    Get.toNamed(AppRoute.forgetpassowrd);
  }
}
