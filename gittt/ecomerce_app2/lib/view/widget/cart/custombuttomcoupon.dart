import 'package:flutter/material.dart';

class Custombuttomcoupon extends StatelessWidget {
  final void Function()? onPressed;
  const Custombuttomcoupon({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.blueGrey,
      onPressed: onPressed,
      child: const Text(
        "Apply",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
