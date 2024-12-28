import "package:ecomerce_app2/controller/forgetpassword/forgetpassword_controller.dart";
import "package:ecomerce_app2/core/class/handlingdataview.dart";
import "package:ecomerce_app2/core/constant/colors.dart";
import "package:ecomerce_app2/core/function/validinput.dart";
import "package:ecomerce_app2/view/widget/auth/custombodyauth.dart";
import "package:ecomerce_app2/view/widget/auth/custombuttonauth.dart";
import "package:ecomerce_app2/view/widget/auth/customtextform.dart";
import "package:ecomerce_app2/view/widget/auth/customtitleauth.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class Forgetpassowrd extends StatelessWidget {
  const Forgetpassowrd({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ForgetpasswordControllerimp());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 232, 194, 133),
          title: const Text(
            "Forget Password",
            style: TextStyle(
                color: AppColor.colorLoginTitleMain,
                fontWeight: FontWeight.bold,
                fontSize: 26),
          ),
        ),
        body: GetBuilder<ForgetpasswordControllerimp>(builder: (controller) {
          return Handlingdatarequest(
              statusRequest: controller.statusRequest,
              widget: SingleChildScrollView(
                child: Form(
                  key: controller.formState,
                  child: Column(
                    children: [
                      const Customtitleauth(
                        text: "Check Email",
                      ),
                      const Custombodyauth(
                          text:
                              "Please Enter Your Email Address To\n       Recive A Verification Code"),
                      const SizedBox(height: 90),
                      Customtextform(
                        keyboardTypeform: TextInputType.emailAddress,
                        validatores: (val) {
                          return validinput(val!, 5, 100, "email");
                        },
                        mycontroller: controller.email,
                        hint: "Enter Your email",
                        label: "Email",
                        icon: Icons.email_outlined,
                      ),
                      const SizedBox(height: 40),
                      Custombuttonauth(
                        text: "Check",
                        onPressed: () {
                          controller.forgetPassword();
                        },
                      ),
                    ],
                  ),
                ),
              ));
        }));
  }
}
