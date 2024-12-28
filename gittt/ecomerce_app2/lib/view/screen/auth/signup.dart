import "package:ecomerce_app2/controller/auth/signup_controller.dart";
import "package:ecomerce_app2/core/class/handlingdataview.dart";
import "package:ecomerce_app2/core/constant/colors.dart";
import "package:ecomerce_app2/core/function/exitalert.dart";
import "package:ecomerce_app2/core/function/validinput.dart";
import "package:ecomerce_app2/view/widget/auth/custombodyauth.dart";
import "package:ecomerce_app2/view/widget/auth/custombuttonauth.dart";
import "package:ecomerce_app2/view/widget/auth/customchangestart.dart";
import "package:ecomerce_app2/view/widget/auth/customtextform.dart";
import "package:ecomerce_app2/view/widget/auth/customtitleauth.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class Signup extends StatelessWidget {
  const Signup({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SignupControllerimp());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 232, 194, 133),
          title: const Text(
            "Sign Up",
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
            child: GetBuilder<SignupControllerimp>(builder: (controller) {
              return Handlingdatarequest(
                  statusRequest: controller.statusRequest,
                  widget: SingleChildScrollView(
                    child: Form(
                      key: controller.formState,
                      child: Column(
                        children: [
                          const Customtitleauth(
                            text: "Complete Profile",
                          ),
                          const Custombodyauth(
                              text:
                                  "Complete your details or continue\n               with social media"),
                          const SizedBox(height: 90),
                          Customtextform(
                            keyboardTypeform: TextInputType.text,
                            validatores: (val) {
                              return validinput(val!, 5, 100, "username");
                            },
                            mycontroller: controller.username,
                            hint: "Enter Your username",
                            label: "Username",
                            icon: Icons.person_4_outlined,
                          ),
                          const SizedBox(height: 32),
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
                          GetBuilder<SignupControllerimp>(
                              builder: (controller) {
                            return Customtextform(
                              obscuretype: controller.isshowpassword,
                              onTap: () {
                                controller.showpassord();
                              },
                              keyboardTypeform: TextInputType.text,
                              validatores: (val) {
                                return validinput(val!, 5, 100, "password");
                              },
                              mycontroller: controller.password,
                              hint: "Enter Your password",
                              label: "Password",
                              icon: controller.isshowpassword == true
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            );
                          }),
                          const SizedBox(height: 32),
                          Customtextform(
                            keyboardTypeform: TextInputType.phone,
                            validatores: (val) {
                              return validinput(val!, 5, 100, "phone");
                            },
                            mycontroller: controller.phone,
                            hint: "Enter Your phone",
                            label: "Phone",
                            icon: Icons.phone,
                          ),
                          const SizedBox(height: 40),
                          Custombuttonauth(
                            text: "Sign Up",
                            onPressed: () {
                              controller.signup();
                            },
                          ),
                          const SizedBox(height: 50),
                          Customchangestart(
                            text1: "Have An Account?",
                            text2: " Sign IN",
                            onTap: () {
                              controller.goToPageLogin();
                            },
                          ),
                        ],
                      ),
                    ),
                  ));
            })));
  }
}
