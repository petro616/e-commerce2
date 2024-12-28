import 'package:ecomerce_app2/core/class/status_request.dart';
import 'package:ecomerce_app2/core/function/handlingdatacontroller.dart';
import 'package:ecomerce_app2/core/services/servisess.dart';
import 'package:ecomerce_app2/data/datasource/remote/favourite_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  Map isfavourite = {};
  setfavourite(id, val) {
    isfavourite[id] = val;
    update();
  }

  MyServices myservices = Get.find();
  FavouriteData testData = FavouriteData(Get.find());
  List data = [];
  late StatusRequest statusRequest;
  addfavourite(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await testData.addfavourite(
        myservices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.snackbar("Will Done", "Your Favourite Added This Product",
            colorText: Colors.white);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  removefavourite(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await testData.removefavourite(
        myservices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.snackbar("Will Done", "Your Favourite Has Been Removed Product",
            colorText: Colors.white);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
