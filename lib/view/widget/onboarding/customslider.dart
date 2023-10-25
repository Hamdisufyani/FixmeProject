
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboardincontrooler.dart';
import '../../../core/constant/color.dart';
import '../../../data/static/static.dart';
class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val){
        controller.onPageChanged(val);
      },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
          children: [
            Text(
              onBoardingList[i].title!,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.black),
            ),
            const SizedBox(
              height: 60,
            ),
            Image.asset(
              onBoardingList[i].image!,
              width: Get.width /1.3,
            fit: BoxFit.fill,
            //  height: 220,
            ),
            const SizedBox(
              height: 80,
            ),
            Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  onBoardingList[i].body!,
                  textAlign: TextAlign.center,
                  style:TextStyle(
                      height: 2,
                      color: AppColors.grey,
                      fontSize: 14),
                )),
          ],
        ));
  }
}
