import "package:ecomerce_app2/core/constant/imageasset.dart";
import "package:flutter/material.dart";

class Customcard extends StatelessWidget {
  final String texttitle;
  const Customcard({super.key, required this.texttitle});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 180,
          width: 400,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              AppImageAsset.homepagebegintwo,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 2,
          left: 7,
          child: Text(
            texttitle,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
