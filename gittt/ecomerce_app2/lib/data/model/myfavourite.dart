class Myfavouritemodel {
  String? favoutireId;
  String? favoutireItemsid;
  String? favoutireUsersid;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDescription;
  String? itemsDescriptionAr;
  String? itemsImage;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsCount;
  String? itemsActive;
  String? itemsDatetime;
  String? itemsCatego;
  String? userId;
  String? itemspricediscount;
  Myfavouritemodel(
      {this.favoutireId,
      this.favoutireItemsid,
      this.favoutireUsersid,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDescription,
      this.itemsDescriptionAr,
      this.itemsImage,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsCount,
      this.itemsActive,
      this.itemsDatetime,
      this.itemsCatego,
      this.userId,
      this.itemspricediscount});

  Myfavouritemodel.fromJson(Map<String, dynamic> json) {
    favoutireId = json['favoutire_id'];
    favoutireItemsid = json['favoutire_itemsid'];
    favoutireUsersid = json['favoutire_usersid'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDescription = json['items_description'];
    itemsDescriptionAr = json['items_description_ar'];
    itemsImage = json['items_image'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsDatetime = json['items_datetime'];
    itemsCatego = json['items_catego'];
    userId = json['user_id'];
    itemspricediscount = json['itemspricediscount'];
  }
}
/*
Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['favoutire_id'] = favoutireId;
    data['favoutire_itemsid'] = favoutireItemsid;
    data['favoutire_usersid'] = favoutireUsersid;
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_description'] = itemsDescription;
    data['items_description_ar'] = itemsDescriptionAr;
    data['items_image'] = itemsImage;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_count'] = itemsCount;
    data['items_active'] = itemsActive;
    data['items_datetime'] = itemsDatetime;
    data['items_catego'] = itemsCatego;
    data['user_id'] = userId;
    data['itemspricediscount'] = itemspricediscount;
    return data;
  }
*/
