import "package:ecomerce_app2/core/constant/imageasset.dart";
import "package:flutter/material.dart";

class Customimageauth extends StatelessWidget {
  const Customimageauth({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          AppImageAsset.logInLogo,
          height: 100,
        ),
      ),
    );
  }
}
