
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handlingdata.dart';
import '../core/services/services.dart';
import 'package:flutter/material.dart';

import '../data/datasource/remote/cart_data.dart';
import '../data/model/cartmodel.dart';

class CartController extends GetxController {
  TextEditingController? controllercoupon;

  //CouponModel? couponModel;
  CartData cartData = CartData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  List<CartModel> data = [];

  double priceorders = 0.0;

 int? discountcoupon = 0;

 // String? couponname;
 // String? couponId;

  int totalcountitems = 0;

  add(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("===============================CART Controller $response  ");
    print(
        'Type of text: ${myServices.sharedPreferences.getString("id").runtimeType}');
    print('Type of text2: ${itemsid.runtimeType}');

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم اضافة المنتج الى السلة "));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  delete(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.removeCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار", messageText: const Text("تم حذف المنتج من السلة "));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  goToPageCheckOut() {
    if(data.isEmpty) return Get.snackbar("تنبيه","السلة فارغة");
    Get.toNamed(AppRoute.checkOutPgae  ,arguments: {
    //  "couponId" :couponId ?? "0",
      "priceorders": priceorders.toString(),
   //   "discountcoupon" : discountcoupon.toString(),
    });
  }

  getTotalPrice() {
    return (priceorders - priceorders * discountcoupon! / 100);
  }



  resetVarCart() {
    totalcountitems = 0;
    priceorders = 0.0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    data.clear();
    var response =
        await cartData.viewCart(myServices.sharedPreferences.getString("id")!);
    print("===============================CARTNNN Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          List dataresponse = response['datacart']['data'];
          Map dataresponsecountprice = response['countprice'];
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalcountitems =
              int.parse(dataresponsecountprice['totalcount'].toString());
          priceorders =
              double.parse(dataresponsecountprice['totalprice'].toString());
          print(priceorders);
        }
      } else {
        statusRequest = StatusRequest.failure;
        //   discountcoupon=0;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();

    view();
    super.onInit();
  }
}
