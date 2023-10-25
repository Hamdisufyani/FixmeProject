import 'package:flutter/material.dart';

import '../../../core/constant/dimensions.dart';

class ItemTitleWidget extends StatelessWidget {
  final String titleText;
  const ItemTitleWidget({Key? key, required this.titleText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return        Row(
      children: [
        SizedBox(width: Dimensions.width10,),

        Container(
          height: Dimensions.height20+Dimensions.height10,
          width: Dimensions.height45+Dimensions.height45,
          decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft:  Radius.circular(5))
          ),
          child: Center(child: Text('Services',style: TextStyle(color: Colors.white,fontSize: 16),)),
        ),
        Container(
          height: Dimensions.height20+Dimensions.height10,
          width: 280,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(5),bottomRight:  Radius.circular(5))
          ),
          child: Center(child: Text(titleText,style: TextStyle(color: Colors.black,fontSize: 16),)),
        )
      ],
    );
  }
}
