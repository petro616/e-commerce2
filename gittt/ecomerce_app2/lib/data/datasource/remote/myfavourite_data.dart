import 'package:ecomerce_app2/core/class/crud.dart';
import 'package:ecomerce_app2/linkapi.dart';

class MyfavouriteData {
  Crud crud;
  MyfavouriteData(this.crud);

  viewdata(String usersid) async {
    var response =
        await crud.postdata(Applink.viewfavourite, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  deletefavouritedata(String usersid) async {
    var response =
        await crud.postdata(Applink.deletemyfavourite, {"id": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
