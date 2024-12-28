import "package:ecomerce_app2/core/class/crud.dart";
import "package:ecomerce_app2/linkapi.dart";

class ResetpasswordData {
  Crud crud;
  ResetpasswordData(this.crud);
  postData(String email, String password) async {
    var response = await crud.postdata(
        Applink.resetpassword, {"email": email, "password": password});
    return response.fold((l) => l, (r) => r);
  }
}
