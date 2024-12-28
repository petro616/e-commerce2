import 'package:ecomerce_app2/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Choosepaymentmethod extends StatelessWidget {
  final String title;
  final bool isactive;
  const Choosepaymentmethod(
      {super.key, required this.title, required this.isactive});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: Get.width,
      decoration: BoxDecoration(
          color: isactive == true ? AppColor.primarysecondcolor : Colors.white,
          borderRadius: BorderRadius.circular(50)),
      child: Container(
          margin: const EdgeInsets.only(left: 10, top: 9),
          child: Text(
            title,
            style: TextStyle(
                color: isactive == true
                    ? Colors.white
                    : AppColor.primarysecondcolor,
                fontWeight: FontWeight.bold,
                fontSize: 15),
          )),
    );
  }
}
