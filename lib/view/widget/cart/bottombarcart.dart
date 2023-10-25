import 'package:flutter/material.dart';

import '../../../controller/cart_controller.dart';
import '../../../core/constant/color.dart';

import 'package:get/get.dart';

import 'custombuttoncart.dart';
import 'custombuttoncoupon.dart';

class BottomNavgationBarCart extends  GetView<CartController>{
  final String price;
  final String shipping;
 // final String discount;

  final String totalprice;
  final TextEditingController controllercoupon;

  final void Function()? onApplyCoupon;

  const BottomNavgationBarCart(
      {Key? key,
      required this.price,
      required this.shipping,
      required this.totalprice,
      this.onApplyCoupon,
      required this.controllercoupon,
   })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(

            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("price", style: TextStyle(fontSize: 16))),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("$price \$", style: TextStyle(fontSize: 16)))
                ],
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("$shipping", style: TextStyle(fontSize: 16))),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("300 \$", style: TextStyle(fontSize: 16)))
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Total Price",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor))),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("$totalprice \$",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor)))
          ],
        ),
        SizedBox(height: 10),
        CustomButtonCart(
          textbutton: " Order",
          onPressed: () {
            controller.goToPageCheckOut() ;
          },
        )
      ],
    ));
  }
}
