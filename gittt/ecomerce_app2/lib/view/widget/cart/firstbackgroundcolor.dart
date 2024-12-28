import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Firstbackgroundcolor extends StatelessWidget {
  final Color color;
  const Firstbackgroundcolor({super.key, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(70),
              bottomLeft: Radius.circular(70)),
          color: color),
      height: 310,
      width: Get.width,
    );
  }
}
