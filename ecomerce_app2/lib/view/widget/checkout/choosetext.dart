import 'package:flutter/material.dart';

class Choosetext extends StatelessWidget {
  final String title;
  const Choosetext({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 15),
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ));
  }
}
