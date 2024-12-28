import 'package:ecomerce_app2/core/class/status_request.dart';
import 'package:ecomerce_app2/core/constant/routes.dart';
import 'package:ecomerce_app2/core/function/handlingdatacontroller.dart';
import 'package:ecomerce_app2/core/services/servisess.dart';
import 'package:ecomerce_app2/data/datasource/remote/cart_data.dart';
import 'package:ecomerce_app2/data/model/cartviewmodel.dart';
import 'package:ecomerce_app2/data/model/couponmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  int discountcoupon = 0;
  String? couponname;
  String? couponid;
  Couponmodel? couponmodel;
  late TextEditingController couponcode;
  CartData cartData = CartData(Get.find());
  List<CartViewModel> data = [];
  double totalprice = 0.0;
  int totalcount = 0;
  late StatusRequest statusRequest;
  MyServices myservices = Get.find();
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

  resetvariablecartview() {
    totalcount = 0;
    totalprice = 0.0;
    data.clear();
  }

  refreshvariablecartview() {
    resetvariablecartview();
    viewcart();
  }

  viewcart() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.viewcart(myservices.sharedPreferences.getString("id")!);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        if (response["datacartview"]["status"] == "success") {
          List<dynamic> dataresponse = response["datacartview"]["data"];
          data.addAll(dataresponse.map((e) => CartViewModel.fromJson(e)));
          Map dataresponsecount = response["totalpricebycountandtotalcount"];
          totalcount = int.parse(dataresponsecount["totalcount"]);
          totalprice = double.parse(dataresponsecount["totalprice"]);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getcoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getcoupon(couponcode.text);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Map<String, dynamic> responsecoupon = response["data"];
        couponmodel = Couponmodel.fromJson(responsecoupon);
        discountcoupon = int.parse(couponmodel!.couponDiscount!);
        couponname = couponmodel!.couponName;
        couponid = couponmodel!.couponId;
      } else {
        discountcoupon = 0;
        couponname = null;
        couponid = null;
      }
    }
    update();
  }

  gettotalprice() {
    return (totalprice - totalprice * discountcoupon / 100);
  }

  gotocheckout() {
    if (data.isEmpty) return Get.snackbar("notice", "the basket is empty");
    Get.toNamed(AppRoute.checkout, arguments: {
      "couponid": couponid ?? "0",
      "priceorder": totalprice.toString()
    });
  }

  @override
  void onInit() {
    couponcode = TextEditingController();
    viewcart();
    super.onInit();
  }

  @override
  void dispose() {
    couponcode.dispose();
    super.dispose();
  }
}
