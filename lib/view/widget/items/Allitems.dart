import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/dimensions.dart';
import '../../../controller/items_controller.dart';

import 'package:get/get.dart';

import '../../../data/model/itemsmodel.dart';
import '../../../linkapi.dart';
import 'itesms_details.dart';

class ItemRepairType extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  final int? i;
  const ItemRepairType({required this.itemsModel,required this.i, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(itemsModel);

      },
      child:  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      SizedBox(width: Dimensions.height10,),

   //

  Container(
            height:90,
            width: 100,
            //   color: Colors.white38,
            decoration: BoxDecoration(
              color:AppColors.backGroundColor,
              borderRadius: BorderRadius.circular(5),
               border: Border.all(width: 2,color: Colors.white),
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: Dimensions.height10,),
                  Hero(
                      tag: "${itemsModel.itemsId}",
                      child:  ImageIcon(NetworkImage(
                        "${AppLink.itemsImage}/${itemsModel.itemsImage!}",),size: 40,)),
                  Text(itemsModel.itemsName!,style: const TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.normal),)

                ],
              ),
            ),

        ),
      //
  //  const Center(
  //  child:  Text("All prices are inclusive of 25% VAT",style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.black),)
  //  ,
   // ),
      ]

    ),
    ));
  }
}
