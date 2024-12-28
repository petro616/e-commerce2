import 'package:ecomerce_app2/core/class/status_request.dart';
import 'package:ecomerce_app2/core/constant/routes.dart';
import 'package:ecomerce_app2/core/function/handlingdatacontroller.dart';
import 'package:ecomerce_app2/core/services/servisess.dart';
import 'package:ecomerce_app2/data/datasource/remote/myfavourite_data.dart';
import 'package:ecomerce_app2/data/model/itemsmodel.dart';
import 'package:ecomerce_app2/data/model/myfavourite.dart';
import 'package:get/get.dart';

class MyfavouriteController extends GetxController {
  MyServices myservices = Get.find();
  MyfavouriteData testData = MyfavouriteData(Get.find());
  List<Myfavouritemodel> data = [];
  List<ItemsModel> data2 = [];
  StatusRequest statusRequest = StatusRequest.none;
  viewfavourite() async {
    data.clear();
    data2.clear();
    statusRequest = StatusRequest.loading;
    var response =
        await testData.viewdata(myservices.sharedPreferences.getString("id")!);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List responsedata1 = response["data"];
        List responsedata2 = response["data"];
        data.addAll(responsedata1.map((e) => Myfavouritemodel.fromJson(e)));
        data2.addAll(responsedata2.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deletemyfavourite(String favouriteid) {
    // ignore: unused_local_variable
    var response = testData.deletefavouritedata(favouriteid);
    data.removeWhere((element) => element.favoutireId == favouriteid);
    update();
  }

  gotoproductdetails(itemsmodel) {
    Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": itemsmodel});
  }

  @override
  void onInit() {
    viewfavourite();
    super.onInit();
  }
}
