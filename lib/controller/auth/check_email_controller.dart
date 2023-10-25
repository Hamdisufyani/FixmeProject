import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class CheckEmailController extends GetxController{
  checkEmail();

  goToSuccessSignUp();

}

class CheckEmailControllerImp extends CheckEmailController{
  late TextEditingController email;
  @override
  checkEmail() {

  }

  @override
  goToSuccessSignUp() {
    Get.toNamed(AppRoute.verifyCodeSignUp);
  }

  @override
  void onInit() {
    email=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }

}