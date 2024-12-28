import "package:ecomerce_app2/controller/home_page_controller.dart";
import "package:ecomerce_app2/data/model/itemsmodel.dart";
import "package:ecomerce_app2/linkapi.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:cached_network_image/cached_network_image.dart';

class Customitemslist extends GetView<HomePageControllerimp> {
  const Customitemslist({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 226,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.items.length,
          itemBuilder: (context, i) {
            return Items(
              itemsModel: ItemsModel.fromJson(controller.items[i]),
            );
          }),
    );
  }
}

class Items extends GetView<HomePageControllerimp> {
  final ItemsModel itemsModel;

  const Items({
    super.key,
    required this.itemsModel,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.gotoproductdetails(itemsModel);
        },
        child: Card(
            margin: const EdgeInsets.only(right: 5, bottom: 8),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.elliptical(30, 30),
              bottomLeft: Radius.elliptical(30, 30),
            )),
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  width: 200,
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.elliptical(30, 30),
                        bottomLeft: Radius.elliptical(30, 30),
                      ),
                      child: CachedNetworkImage(
                          imageUrl:
                              "${Applink.imageitems}/${itemsModel.itemsImage}",
                          fit: BoxFit.cover)),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 22,
                  width: 180,
                  margin: const EdgeInsets.only(top: 2),
                  child: Text(
                    "${itemsModel.itemsName}",
                    style: const TextStyle(
                        fontFamily: "BebasNeue",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 40,
                  width: 145,
                  child: Text(
                    "Click Here To Know About All Details . . . ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: "BebasNeue",
                        color: Colors.grey),
                  ),
                ),
                /*   SizedBox(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Container(
                        margin: const EdgeInsets.only(left: 27),
                        child: Text(
                          "${itemsModel.itemsPrice} S.Y.P",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold,
                              fontFamily: "BebasNeue"),
                        ),
                      ),
                    ],
                  ),
                )*/
              ],
            )));
  }
}
