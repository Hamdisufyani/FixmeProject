
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handlingdata.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/home_data.dart';
import '../data/model/itemsmodel.dart';

abstract class HomeController extends GetxController{
  initialData();
  getDate();
  goToItems(List categories,int selectedCa, String categoryid);
}
class HomeControllerImp extends HomeController{
  MyServices myServices =Get.find();
  String? username;
  HomeData homeData =HomeData(Get.find()) ;
  String? lang;
  String? id;
  List categories =[] ;
  List items =[] ;
  StatusRequest statusRequest =StatusRequest.none;
  @override
  initialData(){
    username =myServices.sharedPreferences.getString("username");
    lang = myServices.sharedPreferences.getString("lang");
    id = myServices.sharedPreferences.getString("id");

  }

  @override
  void onInit(){
    search = TextEditingController();
    initialData();
    getDate();
    super.onInit();
  }


  @override
  getDate() async{
    statusRequest =StatusRequest.loading;
    var response =await homeData.getData() ;
    statusRequest =handlingData(response) ;
    if(StatusRequest.success ==statusRequest){
      if(response['status'] =="success"){
        categories.addAll(response['categories']['data']) ;
        items.addAll(response['items']['data']) ;
        print("$statusRequest  is status");
      }else{
        statusRequest =StatusRequest.failure ;
      }

    }
    update();
  }

  @override
  goToItems( categories,selectedCa , categoryid) {
    Get.toNamed(AppRoute.itemsPage, arguments: {
      "categories" :categories,
      "selectedCat":selectedCa,
      "catId":categoryid

    });
  }
  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
  TextEditingController? search;
  List<ItemsModel> listdata = [];

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  bool isSearch = false;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }
}