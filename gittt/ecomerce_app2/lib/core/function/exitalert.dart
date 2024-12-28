import 'dart:io';

import 'package:ecomerce_app2/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> exitaleratdialog() {
  Get.defaultDialog(
      backgroundColor: const Color.fromARGB(255, 188, 85, 78),
      title: "Alert",
      titleStyle: const TextStyle(
          color: AppColor.colorLoginTitleSub, fontWeight: FontWeight.bold),
      middleText: "Are You Sure You Want To Exit",
      middleTextStyle: const TextStyle(
          color: AppColor.colorLoginTitleSub, fontWeight: FontWeight.bold),
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: const Text(
              "Confirm",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              "Cancel",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )),
      ]);
  return Future.value(true);
}
