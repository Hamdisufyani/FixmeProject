
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onboardincontrooler.dart';
import '../../core/constant/color.dart';
import '../widget/onboarding/custombutton.dart';
import '../widget/onboarding/customslider.dart';
import '../widget/onboarding/dotsonboarding.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
        body: SafeArea(
      child: Column(
        children: [
          const Expanded(
            flex: 3,
            child: CustomSliderOnBoarding()
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: const [
                  CustomDotControllerOnBoarding(),
                  Spacer(flex: 2,),
                  CustomButtonOnBoarding(),
                ],
              ))
        ],
      ),
    ));
  }
}
