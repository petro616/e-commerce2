class Applink {
  static const String server = "https://repostoree.online/ecommerce";
  static const String imagestatic =
      "https://repostoree.online/ecommerce/upload";
  static const String test = "$server/test.php";
  //////////////////////( IMAGE )///////////////////////
  static const String imagecategories = "$imagestatic/categories";
  static const String imageitems = "$imagestatic/items";
  //////////////////////( AUTH )///////////////////////
  static const String signup = "$server/auth/signup.php";
  static const String verifycode = "$server/auth/verifycode.php";
  static const String login = "$server/auth/login.php";
  static const String resendverify = "$server/auth/resend.php";
  //////////////////////( FORGET_PASSWORD )///////////////////////
  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String verifycodeforgetpassword =
      "$server/forgetpassword/verifycodeforgetpassword.php";
  static const String resetpassword =
      "$server/forgetpassword/resetpassword.php";
  //////////////////////( HOME )///////////////////////
  static const String home = "$server/home.php";
  static const String items = "$server/items/items.php";
  static const String categories = "$server/categories/view.php";
  static const String search = "$server/items/search.php";
  //////////////////////( FAVOURITE )///////////////////////
  static const String addfavourite = "$server/favourite/add.php";
  static const String deletefavourite = "$server/favourite/remove.php";
  static const String viewfavourite = "$server/favourite/view.php";
  static const String deletemyfavourite =
      "$server/favourite/deletefrommyfavourite.php";
  //////////////////////( CART )///////////////////////////
  static const String addtocart = "$server/cart/add.php";
  static const String deletefromcart = "$server/cart/delete.php";
  static const String viewcart = "$server/cart/view.php";
  static const String countBetwenAddAndMinus =
      "$server/cart/count_betwen_add_minus.php";
  //////////////////////( ADDRESS )///////////////////////////
  static const String viewdataaddress = "$server/adress/view.php";
  static const String adddataaddress = "$server/adress/add.php";
  static const String editdataaddress = "$server/adress/edit.php";
  static const String deletedataaddress = "$server/adress/delete.php";
  //////////////////////( COUPON )///////////////////////////
  static const String checkcoupon = "$server/coupon/checkCoupon.php";
  //////////////////////( CHECK OUT )///////////////////////////
  static const String checkout = "$server/orders/checkout.php";
}
