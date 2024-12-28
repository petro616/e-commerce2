class CartViewModel {
  String? countitems;
  String? itemsprice;
  String? cartId;
  String? cartUsersid;
  String? cartItemsid;
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

  CartViewModel(
      {this.countitems,
      this.itemsprice,
      this.cartId,
      this.cartUsersid,
      this.cartItemsid,
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
      this.itemsCatego});

  CartViewModel.fromJson(Map<String, dynamic> json) {
    countitems = json['countitems'];
    itemsprice = json['itemsprice'];
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartItemsid = json['cart_itemsid'];
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
  }
}
/*
 Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['countitems'] = this.countitems;
    data['itemsprice'] = this.itemsprice;
    data['cart_id'] = this.cartId;
    data['cart_usersid'] = this.cartUsersid;
    data['cart_itemsid'] = this.cartItemsid;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_description'] = this.itemsDescription;
    data['items_description_ar'] = this.itemsDescriptionAr;
    data['items_image'] = this.itemsImage;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_datetime'] = this.itemsDatetime;
    data['items_catego'] = this.itemsCatego;
    return data;
  }
*/
