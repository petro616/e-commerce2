import "package:ecomerce_app2/controller/forgetpassword/reseatpassword_controller.dart";
import "package:ecomerce_app2/core/class/handlingdataview.dart";
import "package:ecomerce_app2/core/constant/colors.dart";
import "package:ecomerce_app2/core/function/validinput.dart";
import "package:ecomerce_app2/view/widget/auth/custombodyauth.dart";
import "package:ecomerce_app2/view/widget/auth/custombuttonauth.dart";
import "package:ecomerce_app2/view/widget/auth/customtextform.dart";
import "package:ecomerce_app2/view/widget/auth/customtitleauth.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class Reseatpassword extends StatelessWidget {
  const Reseatpassword({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ReseatpasswordControllerimp());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 232, 194, 133),
          title: const Text(
            "Reseat Password",
            style: TextStyle(
                color: AppColor.colorLoginTitleMain,
                fontWeight: FontWeight.bold,
                fontSize: 26),
          ),
        ),
        body: GetBuilder<ReseatpasswordControllerimp>(builder: (controller) {
          return Handlingdatarequest(
              statusRequest: controller.statusRequest,
              widget: SingleChildScrollView(
                child: Form(
                  key: controller.formState,
                  child: Column(
                    children: [
                      const Customtitleauth(
                        text: "New Password",
                      ),
                      const Custombodyauth(
                          text: "Enter your New Password Please "),
                      const SizedBox(height: 90),
                      Customtextform(
                        obscuretype: controller.isShowPassword,
                        onTap: () {
                          controller.showpassword();
                        },
                        keyboardTypeform: TextInputType.text,
                        validatores: (val) {
                          return validinput(val!, 5, 100, "password");
                        },
                        mycontroller: controller.password,
                        hint: "Enter Your password",
                        label: "Password",
                        icon: controller.isShowPassword == true
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      const SizedBox(height: 32),
                      Customtextform(
                        obscuretype: controller.isShowPassword,
                        onTap: () {
                          controller.showpassword();
                        },
                        keyboardTypeform: TextInputType.text,
                        validatores: (val) {
                          return validinput(val!, 5, 100, "password");
                        },
                        mycontroller: controller.repassword,
                        hint: "Confirm Your password",
                        label: "Confirm Password",
                        icon: controller.isShowPassword == true
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      const SizedBox(height: 40),
                      Custombuttonauth(
                        text: "Save",
                        onPressed: () {
                          controller.gotoSuccesReseatPassword();
                        },
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ));
        }));
  }
}
