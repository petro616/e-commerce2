import 'package:ecomerce_app2/core/class/crud.dart';
import 'package:ecomerce_app2/linkapi.dart';

class CategoriesData {
  Crud crud;
  CategoriesData(this.crud);

  getdatacategories() async {
    var response = await crud.postdata(Applink.categories, {});
    return response.fold((l) => l, (r) => r);
  }
}
