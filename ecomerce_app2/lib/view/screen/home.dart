import "package:ecomerce_app2/controller/home_page_controller.dart";
import "package:ecomerce_app2/core/class/handlingdataview.dart";
import "package:ecomerce_app2/core/constant/colors.dart";
import "package:ecomerce_app2/core/constant/routes.dart";
import "package:ecomerce_app2/data/model/itemsmodel.dart";
import "package:ecomerce_app2/linkapi.dart";
import "package:ecomerce_app2/view/widget/home/customcategorieslist.dart";
import "package:ecomerce_app2/view/widget/customappbar.dart";
import "package:ecomerce_app2/view/widget/home/customcard.dart";
import "package:ecomerce_app2/view/widget/home/customfirsttitle.dart";
import "package:ecomerce_app2/view/widget/home/customundercategoriestitle.dart";
import "package:ecomerce_app2/view/widget/home/customitemslist.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:cached_network_image/cached_network_image.dart';

//ignore:camel_case_types
class home extends StatelessWidget {
  const home({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomePageControllerimp());
    HomePageControllerimp controllerimp = Get.find();
    return Scaffold(
      backgroundColor: AppColor.colorscaffoldLogin,
      body: GetBuilder<HomePageControllerimp>(builder: (controller) {
        return Container(
            padding:
                const EdgeInsets.only(top: 3, right: 13, left: 13, bottom: 5),
            child: ListView(
              children: [
                const Customfirsttitle(title: " Emporium e-commerce"),
                const SizedBox(height: 8),
                Customappbar(
                    mycontroller: controller.search!,
                    onChanged: (val) {
                      controller.checksearch(val);
                    },
                    onPressedSearch: () {
                      controller.onpressediconsearch();
                    },
                    titlehintText: "Find Your Product"),
                const SizedBox(height: 13),
                Handlingdataview(
                    statusRequest: controller.statusRequest,
                    widget: controller.issearch == false
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Customcard(
                                  texttitle:
                                      "What A Summer\nSurprise ...\nCash Back\n20%"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Customundercategoriestitle(
                                      title: "Categories"),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(AppRoute.viewallcategories);
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "view-all-",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey[700],
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          Icons.category,
                                          color: Colors.grey[700],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const Customcategorieslist(),
                              const SizedBox(height: 3),
                              const Customundercategoriestitle(
                                  title: "Recommended for you"),
                              const Customitemslist(),
                              const Customundercategoriestitle(
                                  title: "Offers with love"),
                              const Customitemslist(),
                            ],
                          )
                        : Listsearch(modelListdata: controller.listdata))
              ],
            ));
      }),
    );
  }
}

class Listsearch extends GetView<HomePageControllerimp> {
  final List<ItemsModel> modelListdata;
  const Listsearch({super.key, required this.modelListdata});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: modelListdata.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              controller.gotoproductdetails(
                modelListdata[i],
              );
            },
            child: SizedBox(
                child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(100, 100),
                      bottomRight: Radius.elliptical(100, 100))),
              child: Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.elliptical(50, 50),
                              bottomRight: Radius.elliptical(50, 50)),
                          child: CachedNetworkImage(
                            imageUrl:
                                "${Applink.imageitems}/${modelListdata[i].itemsImage}",
                            fit: BoxFit.cover,
                            height: 135,
                          ))),
                  Expanded(
                      flex: 4,
                      child: ListTile(
                        title: Container(
                            margin: const EdgeInsets.only(bottom: 4),
                            child: Text(
                              "${modelListdata[i].itemsName}",
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold),
                            )),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                "${modelListdata[i].categoriesName}",
                                style: const TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "BebasNeue"),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            )),
          );
        });
  }
}
