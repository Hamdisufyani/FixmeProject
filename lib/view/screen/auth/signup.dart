
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signupcontroller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../../widget/auth/textsignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Get.put(SignUpControllerImp());

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backGroundColor,
          elevation: 0.0,
          title: Text(
            'Sign In',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColors.grey),
          ),
        ),
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<SignUpControllerImp>(builder: (controller)=>
    HandlingDataRequest(statusRequest:controller.statusRequest,
    widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formState,
                    child: ListView(
                      children: [

                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextTitleAuth(
                          text: '3'.tr,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextFormAuth(
                          isNumber: false,
                          hintText: 'Enter your UserName',
                          labelText: "UserName",
                          iconData: Icons.person_outline,
                          myController: controller.userName,
                          valid: (val) {
                            return validInput(val!, 3, 20, "username");
                          },
                        ),
                        CustomTextFormAuth(
                          isNumber: true,
                          hintText: 'Enter your Phone',
                          labelText: "Phone ",
                          iconData: Icons.phone,
                          myController: controller.phone,
                          valid: (val) {
                            return validInput(val!, 9, 14, "phone");
                          },
                        ),
                        CustomTextFormAuth(
                          isNumber: false,
                          hintText: 'Enter your Email',
                          labelText: "Email",
                          iconData: Icons.email_rounded,
                          myController: controller.email,
                          valid: (val) {
                            return validInput(val!, 5, 100, "email");
                          },
                        ),
                    GetBuilder<SignUpControllerImp>(builder: (controller)=>CustomTextFormAuth(
                      obSecureText: controller.isShowPassword,
                      onTapIcon: (){
                        controller.showPassword();
                      },
                            isNumber: false,
                            hintText: 'Enter your password',
                            labelText: "Password",
                            iconData: Icons.lock_clock_outlined,
                            myController: controller.password,
                            valid: (val) {
                              return validInput(val!, 5, 30, "password");
                            },
                          ),
                        ),
                        CustomButtonAuth(
                          text: "Sign Up",
                          onPressed: () {
                            controller.signUp();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextSign(
                          text1: "Do you have an account?",
                          text2: "Login",
                          onPressed: () {
                            controller.signUp();
                          },
                        )
                      ],
                    ),
                  )),
            ),
          ),
        ));
  }
}
