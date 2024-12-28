import 'package:ecomerce_app2/core/class/crud.dart';
import 'package:ecomerce_app2/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  getdata(String id, String usersid) async {
    var response = await crud
        .postdata(Applink.items, {"id": id.toString(), "usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
