import "package:ecomerce_app2/controller/favourite_controller.dart";
import "package:ecomerce_app2/controller/itemscategories_list.dart";
import "package:ecomerce_app2/core/class/handlingdataview.dart";
import "package:ecomerce_app2/core/constant/colors.dart";
import "package:ecomerce_app2/core/constant/routes.dart";
import "package:ecomerce_app2/view/screen/home.dart";
import "package:ecomerce_app2/view/widget/customappbar.dart";
import "package:ecomerce_app2/view/widget/items/customitems_cat_card.dart";
import "package:ecomerce_app2/view/widget/items/customlistcategoriesitems.dart";
import "package:eva_icons_flutter/eva_icons_flutter.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class ItemsCategorieslist extends GetView<ItemscategoriesListcontrollerImp> {
  const ItemsCategorieslist({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ItemscategoriesListcontrollerImp());
    FavouriteController controllerfav = Get.put(FavouriteController());
    return Scaffold(
        backgroundColor: AppColor.colorscaffoldLogin,
        body: Container(
            padding: const EdgeInsets.only(right: 13, left: 13, top: 10),
            child: ListView(children: [
              Row(children: [
                Expanded(
                  flex: 8,
                  child: Customappbar(
                      mycontroller: controller.search!,
                      onChanged: (val) {
                        controller.checksearch(val);
                      },
                      onPressedSearch: () {
                        controller.onpressediconsearch();
                      },
                      titlehintText: "Find Your Product"),
                ),
                Expanded(
                    child: IconButton(
                  icon: const Icon(
                    EvaIcons.arrowCircleRight,
                    size: 35,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Get.offAllNamed(AppRoute.homescreen);
                  },
                )),
              ]),
              const SizedBox(height: 10),
              const Customlistcategoriesitems(),
              const SizedBox(height: 10),
              GetBuilder<ItemscategoriesListcontrollerImp>(
                  builder: (controller) {
                return Handlingdataview(
                    statusRequest: controller.statusRequest,
                    widget: controller.issearch == false
                        ? GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, mainAxisExtent: 225),
                            itemCount: controller.data.length,
                            itemBuilder: (BuildContext context, i) {
                              controllerfav
                                      .isfavourite[controller.data[i].itemsId] =
                                  controller.data[i].favourite;
                              return CustomitemsCatCard(
                                  itemsModel: controller.data[i]);
                            })
                        : Listsearch(modelListdata: controller.listdata));
              })
            ])));
  }
}
