import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class CustomproductCount extends StatelessWidget {
  final String startText;
  final void Function()? onAdd;
  final void Function()? onMinus;
  final String count;
  const CustomproductCount(
      {super.key,
      required this.startText,
      required this.onAdd,
      required this.onMinus,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, top: 10),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Text(
            startText,
            style: const TextStyle(
                color: Color.fromARGB(255, 51, 94, 116),
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.only(),
            child: MaterialButton(
              minWidth: 1,
              padding: const EdgeInsets.all(3),
              height: 12,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              onPressed: onAdd,
              child: const Icon(
                EvaIcons.plus,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 2, left: 6),
            height: 30,
            width: 45,
            decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(255, 51, 94, 116), width: 2),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              textAlign: TextAlign.center,
              count,
              style: const TextStyle(
                  height: 1.2,
                  color: Colors.blueGrey,
                  fontFamily: "BebasNeue",
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 4),
            child: MaterialButton(
              minWidth: 1,
              padding: const EdgeInsets.all(3),
              height: 12,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              onPressed: onMinus,
              child: const Icon(
                EvaIcons.minus,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
