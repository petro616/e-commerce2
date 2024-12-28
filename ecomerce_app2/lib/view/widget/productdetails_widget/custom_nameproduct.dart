import 'package:flutter/material.dart';

class CustomNameproduct extends StatelessWidget {
  final String text;
  const CustomNameproduct({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.blueGrey,
            fontSize: 30,
            fontFamily: "BebasNeue",
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
