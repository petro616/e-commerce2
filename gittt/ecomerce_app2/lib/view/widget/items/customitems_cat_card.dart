import 'package:ecomerce_app2/controller/favourite_controller.dart';
import 'package:ecomerce_app2/controller/itemscategories_list.dart';
import 'package:ecomerce_app2/core/constant/colors.dart';
import 'package:ecomerce_app2/data/model/itemsmodel.dart';
import 'package:ecomerce_app2/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class CustomitemsCatCard extends GetView<ItemscategoriesListcontrollerImp> {
  final ItemsModel itemsModel;
  const CustomitemsCatCard({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.gotoproductdetails(itemsModel);
        },
        child: Stack(
          children: [
            Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topRight: Radius.elliptical(30, 30),
                  bottomLeft: Radius.elliptical(30, 30),
                )),
                child: Column(
                  children: [
                    SizedBox(
                      height: 122,
                      width: 220,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.elliptical(30, 30),
                          bottomLeft: Radius.elliptical(30, 30),
                        ),
                        child: CachedNetworkImage(
                            imageUrl:
                                "${Applink.imageitems}/${itemsModel.itemsImage}",
                            fit: BoxFit.cover),
                      ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 17),
                          child: Text(
                            "${itemsModel.itemspriceDiscount} S.Y.P",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold,
                                fontFamily: "BebasNeue"),
                          ),
                        ),
                        GetBuilder<FavouriteController>(builder: (controller) {
                          return Container(
                              margin: const EdgeInsets.only(right: 5),
                              child: InkWell(
                                onTap: () {
                                  if (controller
                                          .isfavourite[itemsModel.itemsId] ==
                                      "1") {
                                    controller.setfavourite(
                                        itemsModel.itemsId, "0");
                                    controller
                                        .removefavourite(itemsModel.itemsId!);
                                  } else {
                                    controller.setfavourite(
                                        itemsModel.itemsId, "1");
                                    controller
                                        .addfavourite(itemsModel.itemsId!);
                                  }
                                },
                                child: Icon(
                                  controller.isfavourite[itemsModel.itemsId] ==
                                          "1"
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: Colors.red,
                                ),
                              ));
                        })
                      ],
                    )
                  ],
                )),
            if (itemsModel.itemsDiscount != "0")
              Positioned(
                  bottom: 190,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColor.colorContaineronboarding),
                    child: const Text(
                      textAlign: TextAlign.center,
                      "sale",
                      style: TextStyle(
                          height: 2.5,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ))
          ],
        ));
  }
}
