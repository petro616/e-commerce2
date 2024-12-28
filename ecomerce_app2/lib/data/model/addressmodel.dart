class Addressmodel {
  String? adressId;
  String? adressUsersid;
  String? adressName;
  String? adressCity;
  String? adressStreet;
  String? adressLat;
  String? adressLong;

  Addressmodel(
      {this.adressId,
      this.adressUsersid,
      this.adressName,
      this.adressCity,
      this.adressStreet,
      this.adressLat,
      this.adressLong});

  Addressmodel.fromJson(Map<String, dynamic> json) {
    adressId = json['adress_id'];
    adressUsersid = json['adress_usersid'];
    adressName = json['adress_name'];
    adressCity = json['adress_city'];
    adressStreet = json['adress_street'];
    adressLat = json['adress_lat'];
    adressLong = json['adress_long'];
  }
}
/*
 Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['adress_id'] = this.adressId;
    data['adress_usersid'] = this.adressUsersid;
    data['adress_name'] = this.adressName;
    data['adress_city'] = this.adressCity;
    data['adress_street'] = this.adressStreet;
    data['adress_lat'] = this.adressLat;
    data['adress_long'] = this.adressLong;
    return data;
  }
*/
