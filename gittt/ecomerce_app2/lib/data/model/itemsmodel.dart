class ItemsModel {
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
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;
  String? favourite;
  String? itemspriceDiscount;
  ItemsModel(
      {this.itemsId,
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
      this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesDatetime,
      this.favourite,
      this.itemspriceDiscount});

  ItemsModel.fromJson(Map<String, dynamic> json) {
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
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
    favourite = json['favoutire'];
    itemspriceDiscount = json['itemspricediscount'];
  }
}

/*
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_image'] = categoriesImage;
    data['categories_datetime'] = categoriesDatetime;
    data['favoutire'] = favourite;
    data['itemspricediscount'] = itemspriceDiscount;
    return data;
  }
*/
