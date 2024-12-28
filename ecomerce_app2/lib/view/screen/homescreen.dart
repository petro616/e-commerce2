import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecomerce_app2/controller/homescreen_controller.dart';
import 'package:ecomerce_app2/core/constant/colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomescreenControllerimp());
    HomescreenControllerimp homescreenControllerimp = Get.find();
    return GetBuilder<HomescreenControllerimp>(builder: (controller) {
      return Scaffold(
          backgroundColor: AppColor.colorscaffoldLogin,
          bottomNavigationBar: CurvedNavigationBar(
              height: 65,
              items: const <Widget>[
                Icon(EvaIcons.home, size: 30),
                Icon(EvaIcons.heart, size: 30),
                Icon(EvaIcons.shoppingCart, size: 30),
                Icon(EvaIcons.person, size: 30),
                Icon(EvaIcons.settings2Outline, size: 30),
              ],
              onTap: (index) {
                controller.changepage(index);
              },
              backgroundColor: Colors.grey),
          body: controller.listpage.elementAt(controller.currentpage));
    });
  }
}
