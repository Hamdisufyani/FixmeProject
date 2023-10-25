import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/dimensions.dart';

class BottomNavigationItem extends StatelessWidget {
  const BottomNavigationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      color: AppColors.backGroundColor,
      child:  Center(
        child: Container(
          height: Dimensions.height45,
          width: 150,
          //   color: Colors.white38,
          decoration: BoxDecoration(
            //color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2,color: Colors.white),
          ),
          child: const Center(child: Text("Next")),
        ),
      ),
    );
  }
}
