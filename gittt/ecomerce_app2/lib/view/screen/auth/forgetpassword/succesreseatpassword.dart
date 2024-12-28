import "package:ecomerce_app2/controller/auth/succesreseatpassword_controller.dart";
import "package:ecomerce_app2/core/constant/colors.dart";
import "package:ecomerce_app2/view/widget/auth/custombodyauth.dart";
import "package:ecomerce_app2/view/widget/auth/custombuttonauth.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class Succesreseatpassword extends StatelessWidget {
  const Succesreseatpassword({super.key});
  @override
  Widget build(BuildContext context) {
    SuccesreseatpasswordControllerimp controller =
        Get.put(SuccesreseatpasswordControllerimp());
    return Scaffold(
      backgroundColor: AppColor.colorscaffoldLogin,
      body: SafeArea(
          child: ListView(
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  height: 220,
                  width: 220,
                  decoration: const BoxDecoration(
                      color: AppColor.colorLoginTitleMain,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.elliptical(112, 112),
                          bottomLeft: Radius.elliptical(112, 112))),
                  margin: const EdgeInsets.only(top: 90),
                  child: const Icon(
                    Icons.check_circle,
                    size: 130,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Success Mester",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const Custombodyauth(
                  text:
                      "Your have been change your password successfully\n                       Let's go to the adventure"),
              Container(
                margin: const EdgeInsets.only(top: 235),
                child: Custombuttonauth(
                  text: "Go to Login",
                  onPressed: () {
                    controller.goToLogin();
                  },
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
