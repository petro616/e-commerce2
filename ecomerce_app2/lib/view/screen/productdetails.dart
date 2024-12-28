import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecomerce_app2/controller/productdetails_controller.dart';
import 'package:ecomerce_app2/core/class/handlingdataview.dart';
import 'package:ecomerce_app2/core/constant/colors.dart';
import 'package:ecomerce_app2/linkapi.dart';
import 'package:ecomerce_app2/view/widget/productdetails_widget/custom_color.dart';
import 'package:ecomerce_app2/view/widget/productdetails_widget/custom_discription.dart';
import 'package:ecomerce_app2/view/widget/productdetails_widget/custom_nameproduct.dart';
import 'package:ecomerce_app2/view/widget/productdetails_widget/custom_price.dart';
import 'package:ecomerce_app2/view/widget/productdetails_widget/custom_productimage.dart';
import 'package:ecomerce_app2/view/widget/productdetails_widget/customproduct_count.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Productdetails extends StatelessWidget {
  const Productdetails({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ProductdetailsControllerimp());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        bottomNavigationBar:
            GetBuilder<ProductdetailsControllerimp>(builder: (controller) {
          return Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: Container(
                decoration: const BoxDecoration(
                    border: Border.symmetric(
                        vertical: BorderSide(color: Colors.white, width: 5))),
                child: MaterialButton(
                  height: 50,
                  color: Colors.blueGrey,
                  onPressed: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.success,
                      animType: AnimType.rightSlide,
                      desc: 'DONE',
                      btnOkOnPress: () {},
                    ).show();
                  },
                  child: const Text(
                    "ADD TO CART",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ));
        }),
        body: GetBuilder<ProductdetailsControllerimp>(builder: (controller) {
          return ListView(children: [
            CustomProductimage(
                imagename:
                    "${Applink.imageitems}/${controller.itemsModel.itemsImage}"),
            const SizedBox(height: 38),
            Stack(
              children: [
                Container(
                  height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 5),
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.elliptical(100, 100)),
                    color: const Color.fromARGB(255, 251, 221, 174),
                  ),
                  child: Column(
                    children: [
                      CustomNameproduct(
                          text: "${controller.itemsModel.itemsName}"),
                      CustomDiscription(
                          text: "${controller.itemsModel.itemsDescription}"),
                      const CustomColor(),
                      CustomproductCount(
                          startText: "COUNT ->",
                          onAdd: () {
                            controller.addfrontend();
                          },
                          onMinus: () {
                            controller.removefrontend();
                          },
                          count: "${controller.count}"),
                      CustomPrice(
                          price: "${controller.itemsModel.itemspriceDiscount}")
                    ],
                  ),
                ),
              ],
            ),
          ]);
        }));
  }
}
