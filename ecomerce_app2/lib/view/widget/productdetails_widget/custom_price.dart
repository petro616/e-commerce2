import 'package:flutter/material.dart';

class CustomPrice extends StatelessWidget {
  final String price;
  const CustomPrice({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, top: 8),
      alignment: Alignment.centerLeft,
      child: Text(
        "PRICE : $price S.Y.P",
        style: const TextStyle(
            fontFamily: "BebasNeue",
            color: Color.fromARGB(255, 51, 94, 116),
            fontSize: 27,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
