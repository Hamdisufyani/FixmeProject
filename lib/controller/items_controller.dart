
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdata.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/itemsdata.dart';
import '../data/model/itemsmodel.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changCat(int val, String catval);
  getItems(String categoryId);
  goToPageProductDetails(ItemsModel itemsModel);
  toggleContainer2Visibility();
}

class ItemsControllerImp extends ItemsController {
  bool isContainer2Visible = false;

   @override
  toggleContainer2Visibility() {
      isContainer2Visible = !isContainer2Visible;
     // print(isContainer2Visible);
    }
  List categories = [];
  int? selectedCat;
  String? catId;
  StatusRequest statusRequest = StatusRequest.none;
  List data = [];
  ItemsData itemsData = ItemsData(Get.find());
  MyServices myServices = Get.find();
  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    catId = Get.arguments["catId"];
    getItems(catId!);
   // toggleContainer2Visibility();

  }
  TextEditingController? search;

  @override
  getItems(categoryId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
        categoryId, myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
        // print("$statusRequest  is status");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();

    initialData();
    super.onInit();
  }

  @override
  changCat(val, catval) {
    selectedCat = val;
    selectedCat = val;
    catId = catval;
    getItems(catId!);
    update();
  }

  @override
  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}
