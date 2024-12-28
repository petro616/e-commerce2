import 'package:flutter/material.dart';

class Bill extends StatelessWidget {
  final String title;
  final String price;
  final Color pricecolor;
  const Bill(
      {super.key,
      required this.title,
      required this.price,
      required this.pricecolor});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 6, right: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 1.5),
              child: Text(
                price,
                style: TextStyle(
                  color: pricecolor,
                  fontSize: 20,
                  fontFamily: "BebasNeue",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));
  }
}
