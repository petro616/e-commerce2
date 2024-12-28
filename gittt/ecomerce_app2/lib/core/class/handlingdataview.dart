import "package:ecomerce_app2/controller/home_page_controller.dart";
import "package:ecomerce_app2/core/class/status_request.dart";
import "package:ecomerce_app2/core/constant/colors.dart";
import "package:ecomerce_app2/core/constant/imageasset.dart";
import "package:flutter/material.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";
import "package:get/get.dart";
import "package:lottie/lottie.dart";

class Handlingdataview extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const Handlingdataview(
      {super.key, required this.statusRequest, required this.widget});
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(
            child: SpinKitSpinningLines(
              itemCount: 15,
              lineWidth: 15,
              color: Colors.white,
              size: 130.0,
            ),
          )
        : statusRequest == StatusRequest.offlinefailure
            ? Container(
                margin: EdgeInsets.only(top: Get.width / 5),
                child: Center(
                    child: Lottie.asset(AppImageAsset.offline,
                        width: 150, height: 150)),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Container(
                    margin: EdgeInsets.only(top: Get.width / 5),
                    child: Center(
                        child: Lottie.asset(AppImageAsset.serverfailure,
                            width: 250, height: 250)),
                  )
                : statusRequest == StatusRequest.failure
                    ? SafeArea(
                        child: SizedBox(
                          height: 500,
                          child: Stack(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.elliptical(50, 50),
                                      bottomRight: Radius.elliptical(50, 50)),
                                  gradient: LinearGradient(
                                      colors: [Colors.grey, Colors.white]),
                                ),
                                height: 50,
                                width: Get.width,
                              ),
                              const Positioned(
                                left: 40,
                                top: 370,
                                child: Text(
                                  "N O T H I N G   H E R E",
                                  style: TextStyle(
                                      color: AppColor.colorBodyonboarding,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    : widget;
  }
}

class Handlingdatarequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const Handlingdatarequest(
      {super.key, required this.statusRequest, required this.widget});
  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerimp());
    return statusRequest == StatusRequest.loading
        ? const Center(
            child: SpinKitSpinningLines(
              itemCount: 15,
              lineWidth: 15,
              color: Colors.white,
              size: 130.0,
            ),
          )
        : statusRequest == StatusRequest.offlinefailure
            ? Container(
                margin: EdgeInsets.only(top: Get.width / 5),
                child: Center(
                    child: Lottie.asset(AppImageAsset.offline,
                        width: 150, height: 150)),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Container(
                    margin: EdgeInsets.only(top: Get.width / 5),
                    child: Center(
                        child: Lottie.asset(AppImageAsset.serverfailure,
                            width: 250, height: 250)),
                  )
                : widget;
  }
}
