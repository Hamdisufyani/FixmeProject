
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/forgetpassword/resetpassword_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/class/statusrequest.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';
import '../../../widget/auth/logoauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        elevation: 0.0,
        title: Text(
          'Reset Password',
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColors.grey),
        ),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
        builder: (controller) =>
    HandlingDataRequest(statusRequest:controller.statusRequest,
    widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  const LogoAuth(),
                  const CustomTextTitleAuth(
                    text: 'New Password',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomTextTitleAuth(
                    text: 'please enter new password',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormAuth(
                    isNumber: false,
                    hintText: 'Enter your password',
                    labelText: "Password",
                    iconData: Icons.lock_clock_outlined,
                    myController: controller.password,
                    valid: (val) {  },
                  ),
                  CustomTextFormAuth(
                    isNumber: false,
                    hintText: 'ReEnter Password',
                    labelText: "Password",
                    iconData: Icons.lock_clock_outlined,
                    myController: controller.repassword,
                    valid: (val) {  },
                  ),



                  CustomButtonAuth(
                    text: " Reset",
                    onPressed: () {
                    controller.goToSuccessPassword();
                    },
                  ),

                ],
              ),
            )),
      ),
    ));
  }
}
