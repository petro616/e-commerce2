import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce_app2/controller/categories_controller.dart';
import 'package:ecomerce_app2/data/model/categoriesmodel.dart';
import 'package:ecomerce_app2/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomViewallcategories extends GetView<CategoriesControllerImp> {
  const CustomViewallcategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisExtent: 160),
          itemCount: controller.categories.length,
          itemBuilder: (BuildContext context, i) {
            return Viewallvcategories(
                index: i,
                categoriesModel:
                    CategoriesModel.fromJson(controller.categories[i]));
          }),
    );
  }
}

class Viewallvcategories extends GetView<CategoriesControllerImp> {
  final CategoriesModel categoriesModel;
  final int? index;
  const Viewallvcategories(
      {super.key,
      required this.index,
      required,
      required this.categoriesModel});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.gotoItemsCategoriesList(
              controller.categories, index!, categoriesModel.categoriesId!);
        },
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(20, 20),
                bottomRight: Radius.elliptical(20, 20)),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 130,
                width: double.infinity,
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.elliptical(20, 20),
                        bottomRight: Radius.elliptical(20, 20)),
                    child: CachedNetworkImage(
                      imageUrl:
                          "${Applink.imagecategories}/${categoriesModel.categoriesImage}",
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                  child: Text(
                "${categoriesModel.categoriesName}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blueGrey),
              ))
            ],
          ),
        ));
  }
}
