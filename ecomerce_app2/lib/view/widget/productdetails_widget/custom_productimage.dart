import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce_app2/controller/productdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';

class CustomProductimage extends GetView<ProductdetailsControllerimp> {
  final String imagename;
  const CustomProductimage({
    super.key,
    required this.imagename,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 310,
          width: 500,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                offset: Offset(0, 50),
                color: Colors.white,
                blurRadius: 200.0,
                spreadRadius: 10.0,
                blurStyle: BlurStyle.normal)
          ]),
          child: ClipRRect(
            clipBehavior: Clip.none,
            child: CardSwiper(
              padding: const EdgeInsets.only(),
              backCardOffset: const Offset(25, 45),
              cardsCount: 3,
              cardBuilder:
                  (context, index, percentThresholdX, percentThresholdY) {
                return CachedNetworkImage(
                    imageUrl: imagename, fit: BoxFit.cover);
              },
            ),
          ),
        ),
      ],
    );
  }
}
