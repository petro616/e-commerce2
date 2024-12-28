import 'package:ecomerce_app2/controller/checkout_controller.dart';
import 'package:ecomerce_app2/core/class/handlingdataview.dart';
import 'package:ecomerce_app2/core/constant/colors.dart';
import 'package:ecomerce_app2/core/constant/routes.dart';
import 'package:ecomerce_app2/view/widget/checkout/choosedeliverytype.dart';
import 'package:ecomerce_app2/view/widget/checkout/choosepaymentmethod.dart';
import 'package:ecomerce_app2/view/widget/checkout/chooseshippingaddress.dart';
import 'package:ecomerce_app2/view/widget/checkout/choosetext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});
  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: AppColor.primarysecondcolor,
          height: 50,
          child: MaterialButton(
            textColor: Colors.white,
            onPressed: () {
              controller.checkout();
              AwesomeDialog(
                context: context,
                dialogType: DialogType.success,
                animType: AnimType.rightSlide,
                desc: 'Your Order Have Been Done',
                descTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
                btnOkText: "GO NOW",
                btnOkColor: AppColor.primarysecondcolor,
                btnOkOnPress: () {
                  Get.offAllNamed(AppRoute.homescreen);
                },
              ).show();
            },
            child: const Text(
              "Check Out",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
        backgroundColor: AppColor.colorscaffoldLogin,
        appBar: AppBar(
          title: const Text(
            "Check Out",
          ),
        ),
        body: GetBuilder<CheckoutController>(builder: (controller) {
          return Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: const EdgeInsets.only(left: 13, right: 13),
                child: ListView(
                  children: [
                    const Choosetext(title: "Choose Payment Method"),
                    const SizedBox(height: 10),
                    InkWell(
                        onTap: () {
                          controller.choosepaymentmethod("cash");
                        },
                        child: Choosepaymentmethod(
                            title: "Cash",
                            isactive: controller.paymentmethod == "cash"
                                ? true
                                : false)),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        controller.choosepaymentmethod("Payment Cards");
                      },
                      child: Choosepaymentmethod(
                          title: "Payment Cards",
                          isactive: controller.paymentmethod == "Payment Cards"
                              ? true
                              : false),
                    ),
                    const Choosetext(title: "Choose Delivery Type"),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.choosedeliverytype("Delivery");
                          },
                          child: Choosedeliverytype(
                              title: "Delivery",
                              icon: Icons.delivery_dining_rounded,
                              isactive: controller.deliverytype == "Delivery"
                                  ? true
                                  : false),
                        ),
                        InkWell(
                          onTap: () {
                            controller.choosedeliverytype("Drive Thru");
                          },
                          child: Choosedeliverytype(
                              title: "Drive Thru",
                              icon: Icons.person_pin_circle_outlined,
                              isactive: controller.deliverytype == "Drive Thru"
                                  ? true
                                  : false),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    if (controller.deliverytype == "Delivery")
                      Column(
                        children: [
                          const Choosetext(title: "Shipping Adress"),
                          const SizedBox(height: 10),
                          ...List.generate(controller.dataaddress.length,
                              (index) {
                            return InkWell(
                              onTap: () {
                                controller.chooseshippingaddress(
                                    controller.dataaddress[index].adressId!);
                              },
                              child: Chooseshippingaddress(
                                  title:
                                      "${controller.dataaddress[index].adressName}",
                                  subtitle:
                                      "${controller.dataaddress[index].adressCity} / ${controller.dataaddress[index].adressStreet}",
                                  isactive: controller.shippingaddressid ==
                                          controller.dataaddress[index].adressId
                                      ? true
                                      : false),
                            );
                          })
                        ],
                      )
                  ],
                ),
              ));
        }));
  }
}
