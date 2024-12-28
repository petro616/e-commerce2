import "package:ecomerce_app2/controller/itemscategories_list.dart";
import "package:ecomerce_app2/data/model/categoriesmodel.dart";
import "package:ecomerce_app2/linkapi.dart";
import "package:eva_icons_flutter/eva_icons_flutter.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:cached_network_image/cached_network_image.dart';

class Customlistcategoriesitems
    extends GetView<ItemscategoriesListcontrollerImp> {
  const Customlistcategoriesitems({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: controller.categories.length,
            itemBuilder: (context, i) {
              return Categories(
                  index: i,
                  categoriesModel:
                      CategoriesModel.fromJson(controller.categories[i]));
            }));
  }
}

class Categories extends GetView<ItemscategoriesListcontrollerImp> {
  final CategoriesModel categoriesModel;
  final int? index;
  const Categories(
      {super.key, required this.categoriesModel, required this.index});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.changecat(index!);
        },
        child: Column(children: [
          GetBuilder<ItemscategoriesListcontrollerImp>(builder: (controller) {
            return Container(
                child: controller.selectCat == index
                    ? Stack(children: [
                        Container(
                            width: 380,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20),
                            )),
                        Positioned(
                          child: SizedBox(
                              height: 100,
                              width: 170,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${Applink.imagecategories}/${categoriesModel.categoriesImage}",
                                  fit: BoxFit.cover,
                                ),
                              )),
                        ),
                        Positioned(
                            left: 180,
                            top: 10,
                            child: Text(
                                "The Right place To pick And\nFind your favourite\n",
                                style: TextStyle(
                                    fontFamily: "BebasNeue",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[700]))),
                        Positioned(
                            left: 180,
                            top: 60,
                            child: Row(
                              children: [
                                Text("${categoriesModel.categoriesName} ",
                                    style: const TextStyle(
                                        fontSize: 21,
                                        fontFamily: "BebasNeue",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey)),
                                const Icon(
                                  EvaIcons.activity,
                                  color: Colors.white70,
                                  size: 25,
                                )
                              ],
                            ))
                      ])
                    : null);
          }),
        ]));
  }
}
