import 'package:ecomerce_app2/core/class/crud.dart';
import 'package:ecomerce_app2/linkapi.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);

  getdata(Map data) async {
    var response = await crud.postdata(Applink.checkout, data);
    return response.fold((l) => l, (r) => r);
  }
}
