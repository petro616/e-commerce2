import 'dart:async';
import 'package:ecomerce_app2/core/class/status_request.dart';
import 'package:ecomerce_app2/core/constant/routes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddController extends GetxController {
  double? lat;
  double? long;
  List<Marker> markers = [];
  addtomarker(LatLng latlong) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId("1"), position: latlong));
    lat = latlong.latitude;
    long = latlong.longitude;
    update();
  }

  gotoaddadressparttwo() {
    Get.toNamed(AppRoute.addaddressparttwo, arguments: {
      "lat": lat.toString(),
      "long": long.toString(),
    });
  }

  StatusRequest statusRequest = StatusRequest.loading;
  Position? position;
  CameraPosition? kGooglePlex;
  Completer<GoogleMapController>? completercontroller;

  getcurrentlocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    getcurrentlocation();
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }
}
