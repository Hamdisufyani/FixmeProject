class ItemsModel {
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsCat;
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;
  String? favorite;
  String? itemsPriceDiscount;


  ItemsModel(
      {this.itemsId,
        this.itemsName,
        this.itemsNameAr,
        this.itemsDesc,
        this.itemsDescAr,
        this.itemsImage,
        this.itemsCount,
        this.itemsActive,
        this.itemsPrice,
        this.itemsDiscount,
        this.itemsDate,
        this.itemsCat,
        this.categoriesId,
        this.categoriesName,
        this.categoriesNameAr,
        this.categoriesImage,
        this.categoriesDatetime,
        this.favorite,
        this.itemsPriceDiscount,
      });

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['item_id'].toString();
    itemsName = json['item_name'];
    itemsNameAr = json['item_name_ar'];
    itemsDesc = json['item_description'];
    itemsDescAr = json['item_description_ar'];
    itemsImage = json['item_image'];
    itemsCount = json['item_count'].toString();
    itemsActive = json['item_active'].toString();
    itemsPrice = json['item_price'].toString();
    itemsDiscount = json['item_discount'].toString();
    itemsDate = json['item_date'];
    itemsCat = json['item_cat'].toString();
    categoriesId = json['categories_id'].toString();
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
    favorite =json['favorite'].toString();
    itemsPriceDiscount =json['itemspricediscount'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['item_id'] = itemsId.toString();
    data['item_name'] = itemsName;
    data['item_name_ar'] = itemsNameAr;
    data['item_description'] = itemsDesc;
    data['item_description_ar'] = itemsDescAr;
    data['item_image'] = itemsImage;
    data['item_count'] = itemsCount;
    data['item_active'] = itemsActive;
    data['item_price'] = itemsPrice;
    data['item_discount'] = itemsDiscount;
    data['item_date'] = itemsDate;
    data['item_cat'] = itemsCat;
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_image'] = categoriesImage;
    data['categories_datetime'] = categoriesDatetime;
    data['favorite'] = favorite;
    data['itemspricediscount'] = itemsPriceDiscount;


    return data;
  }
}