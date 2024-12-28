import 'package:ecomerce_app2/core/class/crud.dart';
import 'package:ecomerce_app2/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  addtocart(String usersid, String itemsid) async {
    var response = await crud
        .postdata(Applink.addtocart, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  deletefromcart(String usersid, String itemsid) async {
    var response = await crud.postdata(
        Applink.deletefromcart, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  getcount(String usersid, String itemsid) async {
    var response = await crud.postdata(Applink.countBetwenAddAndMinus,
        {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  viewcart(String usersid) async {
    var response = await crud.postdata(Applink.viewcart, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  getcoupon(String couponname) async {
    var response =
        await crud.postdata(Applink.checkcoupon, {"couponname": couponname});
    return response.fold((l) => l, (r) => r);
  }
}
