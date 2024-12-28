import "package:ecomerce_app2/controller/address/addaddressparttwo.dart";
import "package:ecomerce_app2/core/class/handlingdataview.dart";
import "package:ecomerce_app2/core/constant/colors.dart";
import "package:ecomerce_app2/core/function/validinput.dart";
import "package:ecomerce_app2/view/widget/auth/custombuttonauth.dart";
import "package:ecomerce_app2/view/widget/auth/customtextform.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

//ignore:camel_case_types
class Addaddressparttwo extends StatelessWidget {
  const Addaddressparttwo({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(Addaddressparttwocontroller());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        appBar: AppBar(
          title: const Text("Continue Your Address"),
        ),
        body: GetBuilder<Addaddressparttwocontroller>(builder: (controller) {
          return Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: SizedBox(
                  child: ListView(
                children: [
                  const SizedBox(height: 25),
                  Customtextform(
                      hint: "Name Location",
                      label: "Name Location",
                      icon: Icons.location_city,
                      mycontroller: controller.name,
                      validatores: (val) {
                        return validinput(val!, 2, 50, "username");
                      },
                      keyboardTypeform: TextInputType.emailAddress),
                  const SizedBox(height: 25),
                  Customtextform(
                      hint: "City",
                      label: "City",
                      icon: Icons.business_outlined,
                      mycontroller: controller.city,
                      validatores: (val) {
                        return validinput(val!, 2, 50, "username");
                      },
                      keyboardTypeform: TextInputType.emailAddress),
                  const SizedBox(height: 25),
                  Customtextform(
                      hint: "Street",
                      label: "Street",
                      icon: Icons.two_wheeler_outlined,
                      mycontroller: controller.street,
                      validatores: (val) {
                        return validinput(val!, 2, 50, "username");
                      },
                      keyboardTypeform: TextInputType.emailAddress),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 25, right: 15, left: 20),
                    child: Custombuttonauth(
                      text: "Add",
                      onPressed: () {
                        controller.addaddress();
                      },
                    ),
                  )
                ],
              )));
        }));
  }
}
