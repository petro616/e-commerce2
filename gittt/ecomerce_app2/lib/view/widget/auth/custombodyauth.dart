import "package:ecomerce_app2/core/constant/colors.dart";
import "package:flutter/material.dart";

class Custombodyauth extends StatelessWidget {
  final String text;
  const Custombodyauth({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Text(
        text,
        style: const TextStyle(
            color: AppColor.colorLoginTitleMain,
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
