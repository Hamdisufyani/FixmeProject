class AppLink{

  static const String server ="https:/example.com/fixme";
  static const String test ="$server/test.php";
  //=======================Auth=========================//
  static const String signUp ="$server/auth/signup.php";
  static const String verifyCodeSignUp ="$server/auth/verfiycode.php";
  static const String login ="$server/auth/login.php";
  static const String resend ="$server/auth/resend.php";
  //=================ForgetPassword ========================
  static const String checkEmail ="$server/forgetpassword/checkemail.php";
  static const String resetPassword="$server/forgetpassword/resetpassword.php";
  static const String verifyCodeResetPassword="$server/forgetpassword/verifycode.php";

  //===============Categories ==========================

  static const String category ="$server/categories/view.php";

  static const String homePage ="$server/home.php";

  static const String itemsImage ="$server/upload/items/";
  static const String categoriesImage ="$server/upload/categories/";

 //==================Items ==============
static const String items ="$server/items/items.php";
  static const String searchItems="$server/items/search.php";


  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deleteFromFavorite = "$server/favorite/deletefromfavroite.php";


  //====================Cart==========
  static const String cartAdd = "$server/cart/add.php";
  static const String cartDelete = "$server/cart/delete.php";
  static const String cartView = "$server/cart/view.php";
  static const String cartItemsCount = "$server/cart/getcountitems.php";

  //====================coupon==========checkcoupon
  static const String checkcoupon = "$server/coupon/checkcoupon.php";

// Address

  static const String addressView = "$server/address/view.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressEdit = "$server/address/edit.php";
  static const String addressDelete = "$server/address/delete.php";

  //CheckOut order/checkout.php  delete.php pending.php archive.php details.php pending.php
  static const String checkOut = "$server/order/checkout.php";
  static const String ordersPending = "$server/order/orders.php";
  static const String orderArchive = "$server/order/archive.php";
  static const String ordersDetails = "$server/order/details.php";
  static const String ordersdelete = "$server/order/delete.php";

}