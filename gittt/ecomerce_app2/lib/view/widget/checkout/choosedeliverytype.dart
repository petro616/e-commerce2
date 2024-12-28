import 'package:ecomerce_app2/core/constant/colors.dart';
import 'package:flutter/material.dart';

class Choosedeliverytype extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isactive;
  const Choosedeliverytype(
      {super.key,
      required this.title,
      required this.icon,
      required this.isactive});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isactive == true ? AppColor.primarysecondcolor : Colors.white,
      ),
      height: 165,
      width: 165,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 100,
            color:
                isactive == true ? Colors.white : AppColor.primarysecondcolor,
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
                color: isactive == true
                    ? Colors.white
                    : AppColor.primarysecondcolor,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
