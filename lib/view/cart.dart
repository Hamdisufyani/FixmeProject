
import 'package:fixme/view/widget/cart/bottombarcart.dart';
import 'package:fixme/view/widget/cart/customitemscartlist.dart';
import 'package:fixme/view/widget/cart/topcardcart.dart';
import 'package:fixme/view/widget/items/itemappbar.dart';
import 'package:flutter/material.dart';

import '../../controller/cart_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/dimensions.dart';

import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());

    return SafeArea(
      child: Scaffold(
          appBar:const PreferredSize(
              preferredSize: Size.fromHeight(100.0),
              child: ItemAppBar(textTitle: 'My Cart',)),
          bottomNavigationBar: GetBuilder<CartController>(
              builder: (controller) => BottomNavgationBarCart(
                    shipping: '0',
                controllercoupon: controller.controllercoupon!,
                onApplyCoupon: () {
                },
                  price: "${cartController.priceorders}",
                  totalprice: "${controller.getTotalPrice()}",)),

          body: GetBuilder<CartController>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [

                 // SizedBox(height: 10),
                  TopCardCart(
                      message:
                          "You Have ${cartController.totalcountitems} Items in Your List"),
      Container(
      padding: EdgeInsets.all(10),
      child: Column(
      children: [
      ...List.generate(
      cartController.data.length,
      (index) =>CustomItemsListCart(
          onAdd: () async {
            await cartController
                .add(cartController.data[index].itemId!);
            cartController.refreshPage();
          },
          onRemove: () async  {
            await cartController.delete(
                cartController.data[index].itemId!);
            cartController.refreshPage();
          },
          imagename:
          "${cartController.data[index].itemImage}",
          name: "${cartController.data[index].itemName}",
          price:
          "${cartController.data[index].itemsprice} \$",
          count:
          "${cartController.data[index].countitems}"),
      )
      ],
      ),
      )
                ],
              ),
            ),
          )),
    );
  }
}
