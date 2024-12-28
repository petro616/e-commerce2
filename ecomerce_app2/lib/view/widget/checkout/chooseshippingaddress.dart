import 'package:ecomerce_app2/core/constant/colors.dart';
import 'package:flutter/material.dart';

class Chooseshippingaddress extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isactive;
  const Chooseshippingaddress(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.isactive});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: isactive == true ? AppColor.primarysecondcolor : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isactive == true
                  ? Colors.white
                  : AppColor.primarysecondcolor),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isactive == true
                  ? Colors.white
                  : AppColor.primarysecondcolor),
        ),
      ),
    );
  }
}
