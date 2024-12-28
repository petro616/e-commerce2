import 'package:flutter/material.dart';

class Customcoupontextfield extends StatelessWidget {
  final TextEditingController couponcontroller;
  const Customcoupontextfield({super.key, required this.couponcontroller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: couponcontroller,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: const Text(
            "Coupon code",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.blueGrey,
              ),
              borderRadius: BorderRadius.circular(10))),
    );
  }
}
