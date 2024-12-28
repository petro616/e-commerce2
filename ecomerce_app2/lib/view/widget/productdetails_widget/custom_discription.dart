import 'package:flutter/material.dart';

class CustomDiscription extends StatelessWidget {
  final String text;
  const CustomDiscription({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
            fontFamily: "srs",
            color: Colors.grey[500],
            fontSize: 19,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
