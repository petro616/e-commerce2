import 'package:ecomerce_app2/core/class/status_request.dart';
import 'package:ecomerce_app2/core/function/handlingdatacontroller.dart';
import 'package:ecomerce_app2/core/services/servisess.dart';
import 'package:ecomerce_app2/data/datasource/remote/address.dart';
import 'package:ecomerce_app2/data/datasource/remote/checkout.dart';
import 'package:ecomerce_app2/data/model/addressmodel.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  List<Addressmodel> dataaddress = [];
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = CheckoutData(Get.find());
  MyServices myservices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  String? paymentmethod;
  String? deliverytype;
  String? shippingaddressid;
  late String couponid;
  late String priceorder;
  choosepaymentmethod(String val) {
    paymentmethod = val;
    update();
  }

  choosedeliverytype(String val) {
    deliverytype = val;
    update();
  }

  chooseshippingaddress(String val) {
    shippingaddressid = val;
    update();
  }

  getshippingaddress() async {
    dataaddress.clear();
    statusRequest = StatusRequest.loading;
    var response = await addressData
        .viewdata(myservices.sharedPreferences.getString("id")!);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List listdata = response["data"];
        dataaddress.addAll(listdata.map((e) => Addressmodel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkout() async {
    statusRequest = StatusRequest.loading;
    Map data = {
      "usersid": myservices.sharedPreferences.getString("id"),
      "ordertype": deliverytype.toString(),
      "address": shippingaddressid.toString(),
      "shippingprice": "10",
      "orderprice": priceorder,
      "couponid": couponid,
      "paymentmethod": paymentmethod.toString(),
    };
    var response = await checkoutData.getdata(data);
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments["couponid"];
    priceorder = Get.arguments["priceorder"];
    getshippingaddress();
    super.onInit();
  }
}
