import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handlingdata.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/address_data.dart';
import '../data/datasource/remote/checkout_data.dart';
import '../data/model/addressmodel.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckOutData checkOutData = Get.put(CheckOutData(Get.find()));

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  String? paymentMethod;
  String? deliveryType;
  String addressid = "8";


  late String couponId;
  late String coupondiscount;

  late String priceOrders;
  List<AddressModel> dataaddress = [];

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }
  checkOut() async {
    if (paymentMethod == null) {
      return Get.snackbar("Error", "Please select a payment method");
    }
    if (deliveryType == null) {
      return Get.snackbar("Error", "Please select a order Type");
    }

    statusRequest = StatusRequest.loading;

    update();

    Map data = {
      "usersid": myServices.sharedPreferences.getString("id"),
      "addressid": addressid.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": deliveryType.toString(),
      "ordersprice": priceOrders.toString(),
   //   "couponid": couponId.toString(),
      "paymentmethod": paymentMethod.toString(),
    //  "coupondiscount" : coupondiscount.toString() ,
    };
    print(data);

    var response = await checkOutData.checkOut(data);

    print("=============================== checkout status is  $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homePage);
        Get.snackbar("Success", "the order was successfully");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Error", "try again");
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    //couponId =Get.arguments['couponId'];
    priceOrders =Get.arguments['priceorders'];
  //  coupondiscount = Get.arguments['discountcoupon'].toString();

    getShippingAddress();
    super.onInit();
  }
}