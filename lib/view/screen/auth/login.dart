
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/logincontroller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../../widget/auth/logoauth.dart';
import '../../widget/auth/textsignup.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
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
            child: GetBuilder<LoginControllerImp>(
              builder: (controller) => HandlingDataRequest(statusRequest:controller.statusRequest,
       widget: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      child: Form(
                        key: controller.formState,
                        child: ListView(
                          children: [
                          //  const LogoAuth(),

                            const SizedBox(
                              height: 15,
                            ),
                            CustomTextFormAuth(
                              isNumber: false,
                              hintText: 'Enter your email',
                              labelText: "Email",
                              iconData: Icons.email_outlined,
                              myController: controller.email,
                              valid: (val) {
                                return validInput(val!, 5, 100, "email");
                              },
                            ),
                            GetBuilder<LoginControllerImp>(
                              builder: (controller) => CustomTextFormAuth(
                                obSecureText: controller.isShowPassword,
                                onTapIcon: () {
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
                            InkWell(
                              onTap: () {
                                controller.getToForgetPassword();
                              },
                              child: const Text(
                                "Forget  Password",
                                textAlign: TextAlign.end,
                              ),
                            ),
                            CustomButtonAuth(
                              text: "Sign in",
                              onPressed: () {
                                controller.login();
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextSign(
                              text1: "Don't have an account?",
                              text2: "Sign Up",
                              onPressed: () {
                                controller.goToSignUp();
                              },
                            )
                          ],
                        ),
                      ))),
            )));
  }
}
