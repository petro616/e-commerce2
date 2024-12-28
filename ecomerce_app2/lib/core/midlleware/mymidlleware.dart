import 'package:ecomerce_app2/core/constant/routes.dart';
import 'package:ecomerce_app2/core/services/servisess.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mymidlleware extends GetMiddleware {
  MyServices myservices = Get.find();
  @override
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
    if (myservices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: AppRoute.homescreen);
    }
    if (myservices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: AppRoute.login);
    }
    return null;
  }
}
