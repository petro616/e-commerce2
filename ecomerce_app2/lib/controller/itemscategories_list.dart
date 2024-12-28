import 'package:ecomerce_app2/controller/home_page_controller.dart';
import 'package:ecomerce_app2/core/class/status_request.dart';
import 'package:ecomerce_app2/core/constant/routes.dart';
import 'package:ecomerce_app2/core/function/handlingdatacontroller.dart';
import 'package:ecomerce_app2/core/services/servisess.dart';
import 'package:ecomerce_app2/data/datasource/remote/items_data.dart';
import 'package:ecomerce_app2/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemscategoriesListcontroller extends GetxController {
  initialdata();
  changecat(int val);
  getItems(String categoryid);
  gotoproductdetails(ItemsModel itemsmodel);
}

class ItemscategoriesListcontrollerImp extends Search {
  List categories = [];
  int? selectCat;
  String? categoryid;
  MyServices myservices = Get.find();
  ItemsData testData = ItemsData(Get.find());
  List<ItemsModel> data = [];

  changecat(int val) {
    selectCat = val;
    update();
  }

  getItems(categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await testData.getdata(
        categoryid, myservices.sharedPreferences.getString("id")!);
    statusRequest = handlingdata(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  gotoproductdetails(itemsmodel) {
    Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": itemsmodel});
  }

  initialdata() {
    categoryid = Get.arguments["catid"];
    categories = Get.arguments["categories"];
    selectCat = Get.arguments["selectedCat"];
    getItems(categoryid!);
  }

  @override
  void onInit() {
    search = TextEditingController();
    initialdata();
    super.onInit();
  }

  @override
  dispose() {
    search!.dispose();
    super.dispose();
  }
}
