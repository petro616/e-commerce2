import "package:ecomerce_app2/core/class/crud.dart";
import "package:ecomerce_app2/linkapi.dart";

class VerifycodeforpasswordData {
  Crud crud;
  VerifycodeforpasswordData(this.crud);
  postData(String email, String verifycode) async {
    var response = await crud.postdata(Applink.verifycodeforgetpassword,
        {"email": email, "verifycode": verifycode});
    return response.fold((l) => l, (r) => r);
  }
}
