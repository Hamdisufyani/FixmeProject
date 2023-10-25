
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/forgetpassword/forgetpassword-controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  Get.put(ForgetPasswordCControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        elevation: 0.0,
        title: Text(
          'Forget Password',
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColors.grey),
        ),
      ),
      body: GetBuilder<ForgetPasswordCControllerImp>(builder: (controller)=>
    HandlingDataRequest(statusRequest:controller.statusRequest,
    widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [

                  const CustomTextTitleAuth(
                    text: 'Check Email',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomTextTitleAuth(
                    text: 'please enter your email to verify code',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormAuth(
                    isNumber: false,
                    hintText: 'Enter your email',
                    labelText: "Email",
                    iconData: Icons.email_outlined,
                    myController: controller.email,
                    valid: (val) {  },
                  ),


                  CustomButtonAuth(
                    text: " Check",
                    onPressed: () {
                      controller.checkEmail();
                    },
                  ),

                ],
              ),
            )),
      ),
    ));
  }
}
