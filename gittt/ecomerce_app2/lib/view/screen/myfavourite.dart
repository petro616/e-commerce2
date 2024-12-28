import "package:ecomerce_app2/controller/myfavourite_controller.dart";
import "package:ecomerce_app2/core/class/handlingdataview.dart";
import "package:ecomerce_app2/core/constant/colors.dart";
import "package:ecomerce_app2/view/widget/myfavourite/custom_cardfavourite.dart";
import "package:eva_icons_flutter/eva_icons_flutter.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class Myfavourite extends StatelessWidget {
  const Myfavourite({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MyfavouriteController());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        body: GetBuilder<MyfavouriteController>(builder: (controller) {
          return Handlingdataview(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(70),
                              bottomLeft: Radius.circular(70)),
                          color: Color.fromARGB(255, 223, 177, 104),
                        ),
                        height: 300,
                        width: Get.width,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, left: 10),
                        child: Row(
                          children: [
                            const Text(
                              "Favourite ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              child: const Icon(
                                EvaIcons.heart,
                                size: 40,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          color: Colors.white,
                        ),
                        margin:
                            const EdgeInsets.only(top: 65, left: 12, right: 12),
                        width: Get.width,
                        child: Column(
                          children: [
                            SizedBox(
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: 330,
                                    crossAxisCount: 1,
                                  ),
                                  itemCount: controller.data.length,
                                  itemBuilder: (BuildContext context, i) {
                                    return CustomCardfavourite(
                                        itemsModel2: controller.data2[i],
                                        itemsModel: controller.data[i]);
                                  }),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ));
        }));
  }
}
