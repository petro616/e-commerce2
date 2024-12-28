class Couponmodel {
  String? couponId;
  String? couponName;
  String? couponCount;
  String? couponDiscount;
  String? couponExpiredata;

  Couponmodel(
      {this.couponId,
      this.couponName,
      this.couponCount,
      this.couponDiscount,
      this.couponExpiredata});

  Couponmodel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponName = json['coupon_name'];
    couponCount = json['coupon_count'];
    couponDiscount = json['coupon_discount'];
    couponExpiredata = json['coupon_expiredata'];
  }
}
/*
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coupon_id'] = this.couponId;
    data['coupon_name'] = this.couponName;
    data['coupon_count'] = this.couponCount;
    data['coupon_discount'] = this.couponDiscount;
    data['coupon_expiredata'] = this.couponExpiredata;
    return data;
  }
*/
