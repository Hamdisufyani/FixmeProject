
import 'package:fixme/view/address/add.dart';
import 'package:fixme/view/address/adddetails.dart';
import 'package:fixme/view/address/view.dart';
import 'package:fixme/view/cart.dart';
import 'package:fixme/view/checkout.dart';
import 'package:fixme/view/languages.dart';
import 'package:fixme/view/orders/archive.dart';
import 'package:fixme/view/orders/details.dart';
import 'package:fixme/view/orders/pendong.dart';
import 'package:fixme/view/prodectdetails.dart';
import 'package:fixme/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:fixme/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:fixme/view/screen/auth/forgetpassword/success_password.dart';
import 'package:fixme/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:fixme/view/screen/auth/verifycodesignup.dart';
import 'package:fixme/view/screen/auth/login.dart';
import 'package:fixme/view/screen/auth/signup.dart';
import 'package:fixme/view/screen/auth/success_signup.dart';
import 'package:fixme/view/screen/homesreens.dart';
import 'package:fixme/view/screen/item.dart';
import 'package:fixme/view/screen/onboarding.dart';
import 'package:get/get.dart';

import 'core/constant/routes.dart';
import 'core/middleware/mymiddleware.dart';



List<GetPage<dynamic>>? routes = [
   GetPage(name: "/", page: () => const Languages() , middlewares: [
      MyMiddleWare()
   ]),
  // GetPage(name: "/", page: () =>TestView()),
   GetPage(name: AppRoute.login, page: () => const Login()),
   GetPage(name: AppRoute.signUp, page: () => const SignUp()),
   GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
   GetPage(name: AppRoute.verifyCodeForgetPassword, page: () => const VerifyCodeForgetPassword()),
   GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
   GetPage(name: AppRoute.successPassword, page: () => const SuccessResetPassword()),
   GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
   GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
   GetPage(name: AppRoute.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),
   GetPage(name: AppRoute.onBoarding, page:() =>  const OnBoarding()),
   GetPage(name: AppRoute.homePage, page: ()=> const HomeScreen()),
   GetPage(name: AppRoute.itemsPage, page: ()=> const ItemPage()),
   GetPage(name: AppRoute.productdetails, page: ()=> const ProductDetails()),
 //  GetPage(name: AppRoute.myFavorite, page: ()=> const MyFavorite()),
  GetPage(name: AppRoute.cartPage, page: ()=> const Cart()),
 GetPage(name: AppRoute.addressPage, page: ()=> const AddressView()),
 GetPage(name: AppRoute.addressaddPage, page: ()=> const AddressAdd()),
 GetPage(name: AppRoute.addressdetailspage, page: ()=> const AddressAddDetails()),
 GetPage(name: AppRoute.checkOutPgae, page: ()=> const CheckOut()),
  GetPage(name: AppRoute.orderPending, page: ()=> const OrdersPending()),
   GetPage(name: AppRoute.orderArchive, page: ()=> const OrdersArchiveView()),
  GetPage(name: AppRoute.orderDetails, page: ()=> const OrdersDetails()),




];
