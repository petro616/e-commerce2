import "package:ecomerce_app2/controller/auth/login_controller.dart";
import "package:ecomerce_app2/core/class/handlingdataview.dart";
import "package:ecomerce_app2/core/constant/colors.dart";
import "package:ecomerce_app2/core/function/exitalert.dart";
import "package:ecomerce_app2/core/function/validinput.dart";
import "package:ecomerce_app2/view/widget/auth/custombodyauth.dart";
import "package:ecomerce_app2/view/widget/auth/custombuttonauth.dart";
import "package:ecomerce_app2/view/widget/auth/customchangestart.dart";
import "package:ecomerce_app2/view/widget/auth/customimageauth.dart";
import "package:ecomerce_app2/view/widget/auth/customtextform.dart";
import "package:ecomerce_app2/view/widget/auth/customtitleauth.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerimp());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 232, 194, 133),
          title: const Text(
            "Sign In",
            style: TextStyle(
                color: AppColor.colorLoginTitleMain,
                fontWeight: FontWeight.bold,
                fontSize: 26),
          ),
        ),
        body: PopScope(
            canPop: false,
            onPopInvoked: ((didpop) {
              if (didpop) {
                return;
              }
              exitaleratdialog();
            }),
            child: GetBuilder<LoginControllerimp>(builder: (controller) {
              return Handlingdatarequest(
                  statusRequest: controller.statusRequest,
                  widget: SingleChildScrollView(
                    child: Form(
                      key: controller.formState,
                      child: Column(
                        children: [
                          const Customimageauth(),
                          const Customtitleauth(
                            text: "Welcome Back",
                          ),
                          const Custombodyauth(
                              text:
                                  "Sign in with your email and password\n       or continue with social media"),
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
                          const SizedBox(height: 32),
                          Customtextform(
                            onTap: () {
                              controller.showpassword();
                            },
                            obscuretype: controller.isShowPassword,
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
                          Container(
                            margin: const EdgeInsets.only(right: 25, top: 15),
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                controller.gotoforgetpassword();
                              },
                              child: const Text(
                                "Forget Password",
                                style: TextStyle(
                                    color: AppColor.colorLoginTitleSub,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Custombuttonauth(
                            text: "Sign In",
                            onPressed: () {
                              controller.login();
                            },
                          ),
                          const SizedBox(height: 50),
                          Customchangestart(
                            text1: "Don't Have An Account?",
                            text2: " Sign Up",
                            onTap: () {
                              controller.goToPageSignUp();
                            },
                          ),
                        ],
                      ),
                    ),
                  ));
            })));
  }
}
