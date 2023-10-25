
import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addCart(String usersid, String itemsid) async {
    var response = await crud.postData(
        AppLink.cartAdd, {"usersid": usersid, "itemsid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  removeCart(String usersid, String itemsid) async {
    var response = await crud.postData(
        AppLink.cartDelete, {"usersid": usersid, "itemsid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }
  getCount(String usersid, String itemsid) async {
    var response = await crud.postData(
        AppLink.cartItemsCount, {"usersid": usersid, "itemsid": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String usersid) async {
    var response = await crud.postData(AppLink.cartView, {
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }
  checkCoupon(String couponname) async {
    var response =
    await crud.postData(AppLink.checkcoupon, {"couponname": couponname});
    return response.fold((l) => l, (r) => r);
  }
}