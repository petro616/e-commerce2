import 'package:ecomerce_app2/core/class/status_request.dart';
import 'package:ecomerce_app2/core/function/handlingdatacontroller.dart';
import 'package:ecomerce_app2/core/services/servisess.dart';
import 'package:ecomerce_app2/data/datasource/remote/cart_data.dart';
import 'package:ecomerce_app2/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductdetailsController extends GetxController {}

class ProductdetailsControllerimp extends ProductdetailsController {
  late ItemsModel itemsModel;
  MyServices myservices = Get.find();
  CartData cartData = CartData(Get.find());
  int count = 0;
  late StatusRequest statusRequest;
  List subitems = [
    {
      "color": Colors.black,
      "id": 1,
      "active": 0,
    },
    {
      "color": Colors.grey,
      "id": 2,
      "active": 0,
    },
    {
      "color": Colors.blue,
      "id": 3,
      "active": 0,
    }
  ];

  initialdata() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments["itemsmodel"];
    count = await getcount(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }

  add(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addtocart(
        myservices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  delete(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deletefromcart(
        myservices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getcount(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getcount(
        myservices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        int count = 0;
        count = int.parse(response["data"]);
        return count;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  addfrontend() {
    add(itemsModel.itemsId!);
    count++;
    update();
  }

  removefrontend() {
    if (count > 0) {
      delete(itemsModel.itemsId!);
      count--;
      update();
    }
  }

  @override
  void onInit() {
    initialdata();
    super.onInit();
  }
}
