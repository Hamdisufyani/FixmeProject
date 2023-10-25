
class CartModel {
  CartModel({
    this.itemsprice,
    this.countitems,
    this.cartId,
    this.cartUsersid,
    this.cartItemsid,
    this.itemId,
    this.itemName,
    this.itemNameAr,
    this.itemDescription,
    this.itemDescriptionAr,
    this.itemImage,
    this.itemCount,
    this.itemActive,
    this.itemPrice,
    this.itemDiscount,
    this.itemDate,
    this.itemCat,
  });
  String? itemsprice;
  String? countitems;
  String? cartId;
  String? cartUsersid;
  String? cartItemsid;
  String? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemDescription;
  String? itemDescriptionAr;
  String? itemImage;
  String? itemCount;
  String? itemActive;
  String? itemPrice;
  String? itemDiscount;
  String? itemDate;
  String? itemCat;

  CartModel.fromJson(Map<String, dynamic> json){
    itemsprice = json['itemsprice'].toString();
    countitems = json['countitems'].toString();
    cartId = json['cart_id'].toString();;
    cartUsersid = json['cart_usersid'].toString();
    cartItemsid = json['cart_itemsid'].toString();
    itemId = json['item_id'].toString();;
    itemName = json['item_name'];
    itemNameAr = json['item_name_ar'];
    itemDescription = json['item_description'];
    itemDescriptionAr = json['item_description_ar'];
    itemImage = json['item_image'];
    itemCount = json['item_count'].toString();
    itemActive = json['item_active'].toString();
    itemPrice = json['item_price'].toString();
    itemDiscount = json['item_discount'].toString();
    itemDate = json['item_date'];
    itemCat = json['item_cat'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = itemsprice;
    data['countitems'] = countitems;
    data['cart_id'] = cartId;
    data['cart_usersid'] = cartUsersid;
    data['cart_itemsid'] = cartItemsid;
    data['item_id'] = itemId;
    data['item_name'] = itemName;
    data['item_name_ar'] = itemNameAr;
    data['item_description'] = itemDescription;
    data['item_description_ar'] = itemDescriptionAr;
    data['item_image'] = itemImage;
    data['item_count'] = itemCount;
    data['item_active'] = itemActive;
    data['item_price'] = itemPrice;
    data['item_discount'] = itemDiscount;
    data['item_date'] = itemDate;
    data['item_cat'] = itemCat;
    return data;
  }
}