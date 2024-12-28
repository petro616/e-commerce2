import 'package:ecomerce_app2/core/class/crud.dart';
import 'package:ecomerce_app2/linkapi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  getdata() async {
    var response = await crud.postdata(Applink.home, {});
    return response.fold((l) => l, (r) => r);
  }

  searchdata(String search) async {
    var response = await crud.postdata(Applink.search, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
