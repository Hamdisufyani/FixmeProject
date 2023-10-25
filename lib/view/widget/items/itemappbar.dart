import 'package:fixme/core/constant/color.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/dimensions.dart';
import 'package:get/get.dart';
class ItemAppBar extends StatelessWidget {
  final String textTitle;
  const ItemAppBar({Key? key, required this.textTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: AppColors.backGroundColor,
      child: Column(
         children: [
           SizedBox(height: Dimensions.height20,),
           Row(
             children: [
               SizedBox(width: Dimensions.width10,),

               Container(
                 height: Dimensions.height45,
                 width: Dimensions.height45,
                 //   color: Colors.white38,
                 decoration: BoxDecoration(
                   //color: Colors.white,
                   borderRadius: BorderRadius.circular(5),
                   border: Border.all(width: 2,color: Colors.white),
                 ),
                 child: IconButton(icon: Icon(Icons.keyboard_double_arrow_left), onPressed: () {
                   Get.back();
                 },),
               ),
               SizedBox(width: Dimensions.width10,),
               Center(child: const ImageIcon(AssetImage("assets/images/settings_50px.png"),size: 20,)),
               Text(textTitle,style: TextStyle(color: Colors.teal,fontSize: 20,fontWeight: FontWeight.bold),)


             ],
           ),
           const Center(
             child: Divider(
               color: Colors.grey,
               thickness: 2,
               height: 10, // height of the line
               indent: 70, // left padding
               endIndent: 20, // right padding
             ),
           ),
         ],

      ),
    );
  }
}
