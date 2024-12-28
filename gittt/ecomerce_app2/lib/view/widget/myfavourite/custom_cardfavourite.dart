import 'package:ecomerce_app2/controller/myfavourite_controller.dart';
import 'package:ecomerce_app2/data/model/itemsmodel.dart';
import 'package:ecomerce_app2/data/model/myfavourite.dart';
import 'package:ecomerce_app2/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class CustomCardfavourite extends GetView<MyfavouriteController> {
  final Myfavouritemodel itemsModel;
  final ItemsModel itemsModel2;
  const CustomCardfavourite({
    super.key,
    required this.itemsModel,
    required this.itemsModel2,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.gotoproductdetails(itemsModel2);
        },
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            child: Column(
              children: [
                SizedBox(
                  height: 222, //122,
                  width: double.infinity, //220,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: CachedNetworkImage(
                        imageUrl:
                            "${Applink.imageitems}/${itemsModel.itemsImage}",
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 22,
                  width: 300,
                  margin: const EdgeInsets.only(top: 2),
                  child: Text(
                    "${itemsModel.itemsName}",
                    style: const TextStyle(
                        fontFamily: "BebasNeue",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  height: 30,
                  width: 245,
                  child: const Text(
                    "Click Here To Know About All Details . . . ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: "BebasNeue",
                        color: Colors.grey),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 17),
                      child: Text(
                        "${itemsModel.itemspricediscount} S.Y.P",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                            fontFamily: "BebasNeue"),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: InkWell(
                          onTap: () {
                            controller
                                .deletemyfavourite(itemsModel.favoutireId!);
                          },
                          child: const Icon(
                            Icons.delete_outline,
                          ),
                        ))
                  ],
                )
              ],
            )));
  }
}
