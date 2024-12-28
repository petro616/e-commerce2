import 'package:ecomerce_app2/controller/home_page_controller.dart';
import 'package:ecomerce_app2/core/class/status_request.dart';
import 'package:ecomerce_app2/core/constant/routes.dart';
import 'package:ecomerce_app2/core/function/handlingdatacontroller.dart';
import 'package:ecomerce_app2/core/services/servisess.dart';
import 'package:ecomerce_app2/data/datasource/remote/categories_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CategoriesController extends GetxController {
  getcategories();
  initialdata();
  gotoItemsCategoriesList(List categories, int selectedCat, String categoryid);
}

class CategoriesControllerImp extends Search {
  List categories = [];
  MyServices myservices = Get.find();
  CategoriesData testData = CategoriesData(Get.find());

  @override
  void onInit() {
    search = TextEditingController();
    initialdata();
    super.onInit();
  }

  initialdata() {
    getcategories();
  }

  @override
  void dispose() {
    search!.dispose();
    super.dispose();
  }

  getcategories() async {
    categories.clear();
    statusRequest = StatusRequest.loading;
    var response = await testData.getdatacategories();
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        categories.addAll(response["data"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  gotoItemsCategoriesList(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.itemsCategorieslist, arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
      "catid": categoryid,
    });
  }
}
