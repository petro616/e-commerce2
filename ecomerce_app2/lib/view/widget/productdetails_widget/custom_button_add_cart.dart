import 'package:ecomerce_app2/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonAddToCart extends StatelessWidget {
  final Widget widget;
  final void Function()? onPressed;
  const CustomButtonAddToCart(
      {super.key, required this.widget, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              border: Border.symmetric(
                  vertical: BorderSide(color: Colors.white, width: 5))),
          child: MaterialButton(
            height: 50,
            color: Colors.blueGrey,
            onPressed: onPressed,
            child: const Text(
              "ADD TO CART",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        backgroundColor: AppColor.colorscaffoldLogin,
        body: widget);
  }
}
