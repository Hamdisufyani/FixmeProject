import 'package:flutter/material.dart';

import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';
import 'package:get/get.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
  final String titleText;
  final String textBody;
  const CustomCardHome({Key? key, required this.titleText, required this.textBody}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:
      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: 150,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              title: Text(
                titleText,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              subtitle: Text(
                textBody,
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          Positioned(
              top: -20,

              right:controller.lang == "en" ?  -20 : null ,
              left: controller.lang == "ar" ?  -20 : null ,
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: AppColors.yellowColor,
                    borderRadius: BorderRadius.circular(160)),
              ))
        ],
      ),
    );
  }
}
