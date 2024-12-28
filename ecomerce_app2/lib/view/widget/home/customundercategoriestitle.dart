import "package:flutter/material.dart";

class Customundercategoriestitle extends StatelessWidget {
  final String title;
  const Customundercategoriestitle({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 5,
        bottom: 5,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey[200],
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
