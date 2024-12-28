import "package:eva_icons_flutter/eva_icons_flutter.dart";
import "package:flutter/material.dart";

class Customfirsttitle extends StatelessWidget {
  final String title;
  const Customfirsttitle({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          EvaIcons.activity,
          color: Colors.white,
        ),
        Text(
          title,
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: 15,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
