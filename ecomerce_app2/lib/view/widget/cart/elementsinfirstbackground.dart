import 'package:flutter/material.dart';

class Elementsinfirstbackgroundcolor extends StatelessWidget {
  final String title;
  final IconData icon;
  const Elementsinfirstbackgroundcolor(
      {super.key, required this.title, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10),
      child: Row(
        children: [
          Text(
            "$title ",
            style: const TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
