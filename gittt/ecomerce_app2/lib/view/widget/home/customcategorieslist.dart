import "package:ecomerce_app2/controller/home_page_controller.dart";
import "package:ecomerce_app2/core/function/translatedatabase.dart";
import "package:ecomerce_app2/data/model/categoriesmodel.dart";
import "package:ecomerce_app2/linkapi.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:cached_network_image/cached_network_image.dart';

class Customcategorieslist extends GetView<HomePageControllerimp> {
  const Customcategorieslist({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 135,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.categories.length,
            itemBuilder: (context, i) {
              return Categories(
                  index: i,
                  categoriesModel:
                      CategoriesModel.fromJson(controller.categories[i]));
            }));
  }
}

class Categories extends GetView<HomePageControllerimp> {
  final CategoriesModel categoriesModel;
  final int? index;
  const Categories(
      {super.key, required this.categoriesModel, required this.index});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.gotoItemsCategoriesList(
              controller.categories, index!, categoriesModel.categoriesId!);
        },
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            height: 110,
            width: 140,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: CachedNetworkImage(
                  imageUrl:
                      "${Applink.imagecategories}/${categoriesModel.categoriesImage}",
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10, top: 3),
            height: 22,
            width: 140,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(10, 10),
                    topRight: Radius.elliptical(10, 10)),
                color: Colors.white),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                translatedatabase(categoriesModel.categoriesNameAr,
                    categoriesModel.categoriesName),
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "BebasNeue",
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ]));
  }
}
