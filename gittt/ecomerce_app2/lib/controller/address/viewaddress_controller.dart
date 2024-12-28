import 'package:ecomerce_app2/core/class/status_request.dart';
import 'package:ecomerce_app2/core/function/handlingdatacontroller.dart';
import 'package:ecomerce_app2/core/services/servisess.dart';
import 'package:ecomerce_app2/data/datasource/remote/address.dart';
import 'package:ecomerce_app2/data/model/addressmodel.dart';
import 'package:get/get.dart';

class ViewaddressController extends GetxController {
  AddressData testData = AddressData(Get.find());
  List<Addressmodel> data = [];
  late StatusRequest statusRequest;
  MyServices myservices = Get.find();
  deletedata(String addressid) {
    testData.deletedata(addressid);
    data.removeWhere((e) => e.adressId == addressid);
    update();
  }

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response =
        await testData.viewdata(myservices.sharedPreferences.getString("id")!);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List listdata = response["data"];
        data.addAll(listdata.map((e) => Addressmodel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
