import 'package:ecomerce_app2/core/constant/routes.dart';
import 'package:ecomerce_app2/core/midlleware/mymidlleware.dart';
import 'package:ecomerce_app2/test.dart';
import 'package:ecomerce_app2/test_view.dart';
import 'package:ecomerce_app2/view/address/add.dart';
import 'package:ecomerce_app2/view/address/addaddressparttwo.dart';
import 'package:ecomerce_app2/view/address/view.dart';
import 'package:ecomerce_app2/view/screen/auth/forgetpassword/forgetpassowrd.dart';
import 'package:ecomerce_app2/view/screen/auth/login.dart';
import 'package:ecomerce_app2/view/screen/auth/forgetpassword/reseatpassword.dart';
import 'package:ecomerce_app2/view/screen/auth/signup.dart';
import 'package:ecomerce_app2/view/screen/auth/forgetpassword/succesreseatpassword.dart';
import 'package:ecomerce_app2/view/screen/auth/successignup.dart';
import 'package:ecomerce_app2/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecomerce_app2/view/screen/auth/verifycodesignup.dart';
import 'package:ecomerce_app2/view/screen/cart.dart';
import 'package:ecomerce_app2/view/screen/checkout.dart';
import 'package:ecomerce_app2/view/screen/home.dart';
import 'package:ecomerce_app2/view/screen/homescreen.dart';
import 'package:ecomerce_app2/view/screen/items_categorieslist.dart';
import 'package:ecomerce_app2/view/screen/language.dart';
import 'package:ecomerce_app2/view/screen/myfavourite.dart';
import 'package:ecomerce_app2/view/screen/onboarding.dart';
import 'package:ecomerce_app2/view/screen/productdetails.dart';
import 'package:ecomerce_app2/view/screen/settings.dart';
import 'package:ecomerce_app2/view/screen/viewallcategories.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signup, page: () => const Signup()),
  GetPage(name: AppRoute.forgetpassowrd, page: () => const Forgetpassowrd()),
  GetPage(name: AppRoute.reseatPassword, page: () => const Reseatpassword()),
  GetPage(name: AppRoute.verifycode, page: () => const Verifycode()),
  GetPage(
      name: AppRoute.verifycodesignup, page: () => const Verifycodesignup()),
  GetPage(
      name: AppRoute.succesReseatPassword,
      page: () => const Succesreseatpassword()),
  GetPage(name: AppRoute.succesSignUp, page: () => const Successignup()),
  GetPage(name: AppRoute.onboarding, page: () => const Onboarding()),
  GetPage(
      name: AppRoute.language,
      page: () => const Language(),
      middlewares: [Mymidlleware()]),
  GetPage(name: AppRoute.test, page: () => const Test()),
  GetPage(name: AppRoute.testView, page: () => const TestView()),
  GetPage(name: AppRoute.homescreen, page: () => const Homescreen()),
  GetPage(name: AppRoute.home, page: () => const home()),
  GetPage(name: AppRoute.productdetails, page: () => const Productdetails()),
  GetPage(name: AppRoute.myfavourite, page: () => const Myfavourite()),
  GetPage(
      name: AppRoute.viewallcategories, page: () => const Viewallcategories()),
  GetPage(
      name: AppRoute.itemsCategorieslist,
      page: () => const ItemsCategorieslist()),
  GetPage(name: AppRoute.settingsscreen, page: () => const SettingsScreen()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  GetPage(name: AppRoute.viewadress, page: () => const viewaddress()),
  GetPage(name: AppRoute.addaddress, page: () => const Addaddress()),
  GetPage(
      name: AppRoute.addaddressparttwo, page: () => const Addaddressparttwo()),
  GetPage(name: AppRoute.checkout, page: () => const Checkout()),
];
