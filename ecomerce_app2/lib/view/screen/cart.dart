import 'package:ecomerce_app2/controller/cart_controller.dart';
import 'package:ecomerce_app2/core/class/handlingdataview.dart';
import 'package:ecomerce_app2/view/widget/cart/Firstbackgroundcolor.dart';
import 'package:ecomerce_app2/view/widget/cart/bill.dart';
import 'package:ecomerce_app2/view/widget/cart/cartitems.dart';
import 'package:ecomerce_app2/view/widget/cart/custombuttomcoupon.dart';
import 'package:ecomerce_app2/view/widget/cart/customcartbutton.dart';
import 'package:ecomerce_app2/view/widget/cart/customcoupontextfield.dart';
import 'package:ecomerce_app2/view/widget/cart/elementsinfirstbackground.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CartController());
    return GetBuilder<CartController>(builder: (controller) {
      return Handlingdataview(
          statusRequest: controller.statusRequest,
          widget: ListView(children: [
            Stack(
              children: [
                const Firstbackgroundcolor(
                  color: Color.fromARGB(255, 223, 177, 104),
                ),
                const Elementsinfirstbackgroundcolor(
                  title: "basket",
                  icon: EvaIcons.shoppingCart,
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(50, 50),
                      bottomRight: Radius.elliptical(100, 100),
                    ),
                    color: Colors.white,
                  ),
                  margin: const EdgeInsets.only(
                      top: 65, left: 12, right: 12, bottom: 15),
                  width: Get.width,
                  child: Column(
                    children: [
                      ...List.generate(controller.data.length, (index) {
                        return Cartitems(
                          imagename: "${controller.data[index].itemsImage}",
                          title: "${controller.data[index].itemsName}",
                          price: "${controller.data[index].itemsprice}",
                          count: "${controller.data[index].countitems}",
                          onadd: () async {
                            await controller
                                .add(controller.data[index].itemsId!);
                            controller.refreshvariablecartview();
                          },
                          ondelete: () async {
                            await controller
                                .delete(controller.data[index].itemsId!);
                            controller.refreshvariablecartview();
                          },
                        );
                      }),
                      const SizedBox(height: 20),
                      controller.couponname == null
                          ? Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Customcoupontextfield(
                                    couponcontroller: controller.couponcode,
                                  )),
                                  const SizedBox(width: 5),
                                  Expanded(child: Custombuttomcoupon(
                                    onPressed: () {
                                      controller.getcoupon();
                                    },
                                  ))
                                ],
                              ),
                            )
                          : SizedBox(
                              child: Text(
                                "coupon name : ${controller.couponname}",
                                style: const TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                      const SizedBox(height: 20),
                      Bill(
                        title: "Total Count",
                        price: "${controller.totalcount}",
                        pricecolor: Colors.grey,
                      ),
                      Bill(
                          title: "Price",
                          price: "${controller.totalprice} S.Y.P",
                          pricecolor: Colors.grey),
                      Bill(
                        title: "Coupon Discount",
                        price: "${controller.discountcoupon} %",
                        pricecolor: Colors.grey,
                      ),
                      const Bill(
                        title: "Shipping",
                        price: "0.0",
                        pricecolor: Colors.grey,
                      ),
                      const Divider(),
                      Bill(
                          title: "Total Price",
                          price: "${controller.gettotalprice()} S.Y.P",
                          pricecolor: Colors.blueGrey),
                      Customcartbutton(
                        onPressed: () {
                          controller.gotocheckout();
                        },
                      )
                    ],
                  ),
                )
              ],
            )
          ]));
    });
  }
}
