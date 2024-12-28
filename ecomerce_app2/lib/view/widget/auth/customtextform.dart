import "package:ecomerce_app2/core/constant/colors.dart";
import "package:flutter/material.dart";

class Customtextform extends StatelessWidget {
  final String hint;
  final String label;
  final IconData icon;
  final TextEditingController mycontroller;
  final String? Function(String?) validatores;
  final TextInputType keyboardTypeform;
  final bool? obscuretype;
  final void Function()? onTap;
  const Customtextform(
      {super.key,
      required this.hint,
      required this.label,
      required this.icon,
      required this.mycontroller,
      required this.validatores,
      required this.keyboardTypeform,
      this.obscuretype,
      this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        obscureText: obscuretype == null || obscuretype == false ? false : true,
        keyboardType: keyboardTypeform,
        validator: validatores,
        controller: mycontroller,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            hintText: hint,
            hintStyle: const TextStyle(
                color: AppColor.colorLoginTitleSub,
                fontWeight: FontWeight.bold,
                fontSize: 13),
            suffixIcon: InkWell(
              onTap: onTap,
              child: Icon(
                icon,
                color: AppColor.colorLoginTitleSub,
              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(label)),
            labelStyle: const TextStyle(
                fontSize: 18,
                color: AppColor.colorLoginTitleSub,
                fontWeight: FontWeight.bold),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(
                    color: AppColor.colorLoginTitleMain, width: 1.5)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 155, 89, 66), width: 1.5))),
      ),
    );
  }
}
