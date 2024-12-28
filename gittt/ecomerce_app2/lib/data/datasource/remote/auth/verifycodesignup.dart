import 'package:ecomerce_app2/core/class/crud.dart';
import 'package:ecomerce_app2/linkapi.dart';

class Verifycodesignupdata {
  Crud crud;
  Verifycodesignupdata(this.crud);
  postdata(String email, String verifycode) async {
    var response = await crud.postdata(
        Applink.verifycode, {"email": email, "verifycode": verifycode});
    return response.fold((l) => l, (r) => r);
  }

  resendData(String email) async {
    var response = await crud.postdata(Applink.resendverify, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
