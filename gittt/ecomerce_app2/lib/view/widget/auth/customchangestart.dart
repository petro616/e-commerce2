import "package:ecomerce_app2/core/constant/colors.dart";
import "package:flutter/material.dart";

class Customchangestart extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function()? onTap;
  const Customchangestart(
      {super.key, required this.text1, required this.text2, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.colorLoginTitleSub,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.colorLoginTitleMain,
            ),
          ),
        )
      ],
    );
  }
}
