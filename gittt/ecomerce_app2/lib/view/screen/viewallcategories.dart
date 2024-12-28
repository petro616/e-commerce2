import 'package:ecomerce_app2/controller/categories_controller.dart';
import 'package:ecomerce_app2/core/class/handlingdataview.dart';
import 'package:ecomerce_app2/core/constant/colors.dart';
import 'package:ecomerce_app2/view/widget/home/custom_viewallcategories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Viewallcategories extends StatelessWidget {
  const Viewallcategories({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CategoriesControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("CATEGORIES"),
      ),
      backgroundColor: AppColor.colorscaffoldLogin,
      body: GetBuilder<CategoriesControllerImp>(builder: (controller) {
        return Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Handlingdataview(
                  statusRequest: controller.statusRequest,
                  widget: const CustomViewallcategories())
            ],
          ),
        );
      }),
    );
  }
}
