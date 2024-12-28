import 'package:ecomerce_app2/core/class/status_request.dart';
import 'package:ecomerce_app2/core/constant/routes.dart';
import 'package:ecomerce_app2/core/function/handlingdatacontroller.dart';
import 'package:ecomerce_app2/core/services/servisess.dart';
import 'package:ecomerce_app2/data/datasource/remote/home_data.dart';
import 'package:ecomerce_app2/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomePageController extends Search {
  getdata();
  gotoItemsCategoriesList(List categories, int selectedCat, String categoryid);
  gotoproductdetails(ItemsModel itemsmodel);
}

class HomePageControllerimp extends HomePageController {
  List categories = [];
  List items = [];

  @override
  void onInit() {
    search = TextEditingController();
    getdata();
    super.onInit();
  }

  @override
  void dispose() {
    search!.dispose();
    super.dispose();
  }

  @override
  getdata() async {
    categories.clear();
    items.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getdata();
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        categories.addAll(response['categories']["data"]);
        items.addAll(response['items']["data"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  gotoItemsCategoriesList(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.itemsCategorieslist, arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
      "catid": categoryid,
    });
  }

  @override
  gotoproductdetails(itemsmodel) {
    Get.toNamed(AppRoute.productdetails, arguments: {
      "itemsmodel": itemsmodel,
    });
  }
}

class Search extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  List<ItemsModel> listdata = [];
  TextEditingController? search;
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());
  bool issearch = false;
  checksearch(val) {
    if (val == "") {
      issearch = false;
    }
    update();
  }

  onpressediconsearch() {
    issearch = true;
    searchdata();
    update();
  }

  searchdata() async {
    listdata.clear();
    statusRequest = StatusRequest.loading;
    update();
    Map response = await homeData.searchdata(search!.text);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List responsedata = response["data"];
        listdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.none;
      }
    }
    update();
  }
}
