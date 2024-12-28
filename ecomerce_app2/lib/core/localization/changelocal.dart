import 'package:ecomerce_app2/core/constant/apptheme.dart';
import 'package:ecomerce_app2/core/services/servisess.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  Locale? language;
  late ThemeData apptheme = themeEnglish;
  MyServices myServices = Get.find();
  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    apptheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(apptheme);
    Get.updateLocale(locale);
  }

  requestpermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar(
          "Alert", "please go and turn on service location on your phone");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("Alert",
            "you cant use the application without the location please approve it");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar("Alert",
          "sorry mester you cant use the application without approve the locatoin enabled");
    }
  }

  @override
  void onInit() {
    requestpermission();
    String? sharePrefLang = myServices.sharedPreferences.getString("lang");
    if (sharePrefLang == "ar") {
      language = const Locale("ar");
      apptheme = themeArabic;
    } else if (sharePrefLang == "en") {
      language = const Locale("en");
      apptheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      apptheme = themeEnglish;
    }
    super.onInit();
  }
}
