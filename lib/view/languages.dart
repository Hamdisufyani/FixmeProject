
import 'package:fixme/view/widget/languages/custombuttonlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../core/localization/changelocal.dart';


class Languages extends GetView<LocaleController> {
  const Languages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("1".tr,style: Theme.of(context).textTheme.displayLarge,),
            const SizedBox(height: 20,),
            CustomButtonLang(textButton: "Ar", onPresses: (){
              controller.changeLang("ar");
              Get.toNamed(AppRoute.onBoarding);
            },),
            CustomButtonLang(textButton: "En", onPresses: (){
              controller.changeLang("en");
              Get.toNamed(AppRoute.onBoarding);

            },),
          ],
        ),
      ),
    );
  }
}
