import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboardincontrooler.dart';
import '../../../core/constant/color.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return      Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: MaterialButton(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 0),
        textColor: Colors.white,
        onPressed: () {
          controller.next();
        },
        color: AppColors.primaryColor,
        child:  const Text("Continue"),
      ),
    );
  }
}
