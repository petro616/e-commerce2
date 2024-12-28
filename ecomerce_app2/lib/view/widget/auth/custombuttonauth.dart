import "package:ecomerce_app2/core/constant/colors.dart";
import "package:flutter/material.dart";

class Custombuttonauth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const Custombuttonauth({super.key, required this.text, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
              color: const Color.fromARGB(255, 208, 165, 100), width: 3)),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        minWidth: 350,
        height: 50,
        color: Colors.black,
        textColor: AppColor.colorLoginTitleMain,
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
