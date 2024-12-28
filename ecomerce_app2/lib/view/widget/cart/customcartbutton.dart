import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Customcartbutton extends StatelessWidget {
  final void Function() onPressed;
  const Customcartbutton({super.key, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: MaterialButton(
        minWidth: Get.width / 2,
        color: Colors.blueGrey,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(100, 100),
                bottomRight: Radius.elliptical(100, 100))),
        onPressed: onPressed,
        child: const Text(
          "Place Order",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
