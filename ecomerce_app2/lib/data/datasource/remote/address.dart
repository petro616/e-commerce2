import 'package:ecomerce_app2/core/class/crud.dart';
import 'package:ecomerce_app2/linkapi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);
  viewdata(String usersid) async {
    var response = await crud.postdata(Applink.viewdataaddress, {
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }

  adddata(String usersid, String name, String city, String street, String lat,
      String long) async {
    var response = await crud.postdata(Applink.adddataaddress, {
      "usersid": usersid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return response.fold((l) => l, (r) => r);
  }

  editdata(String addressid, String name, String city, String street,
      String lat, String long) async {
    var response = await crud.postdata(Applink.editdataaddress, {
      "adressid": addressid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return response.fold((l) => l, (r) => r);
  }

  deletedata(String addressid) async {
    var response = await crud.postdata(Applink.deletedataaddress, {
      "adressid": addressid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
