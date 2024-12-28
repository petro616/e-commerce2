import 'package:ecomerce_app2/controller/productdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomColor extends GetView<ProductdetailsControllerimp> {
  const CustomColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, top: 10),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          const Text(
            "COLOR ->",
            style: TextStyle(
                color: Color.fromARGB(255, 51, 94, 116),
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
          ...List.generate(controller.subitems.length, (index) {
            return Container(
              margin: const EdgeInsets.only(top: 3, left: 10, right: 11),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: controller.subitems[index]["active"] == 1
                        ? Colors.white
                        : controller.subitems[index]["color"],
                    width: 2,
                  ),
                  color: controller.subitems[index]["color"],
                  borderRadius: BorderRadius.circular(100)),
            );
          }),
        ],
      ),
    );
  }
}
