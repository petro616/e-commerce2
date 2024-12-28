import "package:ecomerce_app2/controller/auth/verifycodesignup_controller.dart";
import "package:ecomerce_app2/core/class/handlingdataview.dart";
import "package:ecomerce_app2/core/constant/colors.dart";
import "package:ecomerce_app2/view/widget/auth/custombodyauth.dart";
import "package:ecomerce_app2/view/widget/auth/customtitleauth.dart";
import "package:flutter/material.dart";
import "package:flutter_otp_text_field/flutter_otp_text_field.dart";
import "package:get/get.dart";

class Verifycodesignup extends StatelessWidget {
  const Verifycodesignup({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(VerifycodesignupControllerimp());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 232, 194, 133),
          title: const Text(
            "Verification Code",
            style: TextStyle(
                color: AppColor.colorLoginTitleMain,
                fontWeight: FontWeight.bold,
                fontSize: 26),
          ),
        ),
        body: GetBuilder<VerifycodesignupControllerimp>(builder: (controller) {
          return Handlingdatarequest(
              statusRequest: controller.statusRequest,
              widget: Column(
                children: [
                  const Customtitleauth(
                    text: "Check Email",
                  ),
                  const Custombodyauth(
                      text:
                          "Please Go To Your Email And Enter Verify Code This\n      Helps Us To Verify Every User In Our Market "),
                  const SizedBox(height: 80),
                  OtpTextField(
                    cursorColor: AppColor.colorLoginTitleMain,
                    enabledBorderColor: AppColor.colorLoginTitleSub,
                    focusedBorderColor: AppColor.colorLoginTitleSub,
                    fieldWidth: 50.0,
                    numberOfFields: 5,
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      controller.gotoSuccesSignUp(verificationCode);
                    }, // end onSubmit
                  ),
                  const SizedBox(height: 30),
                  MaterialButton(
                    color: AppColor.colorLoginTitleMain,
                    textColor: Colors.white,
                    onPressed: () {
                      controller.reSend();
                    },
                    child: const Text(
                      "Resend Verification Code",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ));
        }));
  }
}
