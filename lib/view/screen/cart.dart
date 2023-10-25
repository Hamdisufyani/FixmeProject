import 'package:flutter/material.dart';

import '../../controller/cart_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/dimensions.dart';
import '../widget/big_text.dart';
import '../widget/cart/appbarcart.dart';
import '../widget/cart/bottombarcart.dart';
import '../widget/cart/customitemscartlist.dart';
import '../widget/cart/topcardcart.dart';
import '../widget/small_text.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());

    return Scaffold(
        appBar: AppBar(
          title: Text("My Cart"),
              backgroundColor: Colors.red,
        ),
        bottomNavigationBar: GetBuilder<CartController>(
            builder: (controller) => BottomNavgationBarCart(
                shipping: '0',
                controllercoupon: controller.controllercoupon!,
                onApplyCoupon: () {
                  //   controller.checkcoupon();
                },
                price: "${cartController.priceorders}",
                ////    discount: "${controller.discountcoupon}%",
                totalprice: "${controller.getTotalPrice()}")),
        body: GetBuilder<CartController>(
          builder: (controller) =>ListView(
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
                        (index) => CustomItemsListCart(
                            onAdd: () async {
                              await cartController
                                  .add(cartController.data[index].itemId!);
                              cartController.refreshPage();
                            },
                            onRemove: () async {
                              await cartController
                                  .delete(cartController.data[index].itemId!);
                              cartController.refreshPage();
                            },
                            imagename:
                                "${cartController.data[index].itemImage}",
                            name: "${cartController.data[index].itemName}",
                            price:
                                "${cartController.data[index].itemsprice} \$",
                            count: "${cartController.data[index].countitems}"),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
  }
}
