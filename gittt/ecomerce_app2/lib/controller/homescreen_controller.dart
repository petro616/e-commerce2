import 'package:ecomerce_app2/view/screen/cart.dart';
import 'package:ecomerce_app2/view/screen/home.dart';
import 'package:ecomerce_app2/view/screen/myfavourite.dart';
import 'package:ecomerce_app2/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomescreenController extends GetxController {
  changepage(int currentpageindex);
}

class HomescreenControllerimp extends HomescreenController {
  int currentpage = 0;
  List<Widget> listpage = [
    const home(),
    const Myfavourite(),
    const Cart(),
    const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(child: Text("profile")),
    ]),
    const SettingsScreen()
  ];

  @override
  changepage(int currentpageindex) {
    currentpage = currentpageindex;
    update();
  }
}
