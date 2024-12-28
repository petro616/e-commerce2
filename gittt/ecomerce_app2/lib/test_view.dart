import "package:ecomerce_app2/controller/test_controller.dart";
import "package:ecomerce_app2/core/class/handlingdataview.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class TestView extends StatelessWidget {
  const TestView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put((TestController()));
    return Scaffold(
        appBar: AppBar(title: const Text("DATA VIEW BABY")),
        body: GetBuilder<TestController>(
          builder: (controller) {
            return Handlingdataview(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, i) {
                      return Text("${controller.data}");
                    }));
          },
        ));
  }
}
