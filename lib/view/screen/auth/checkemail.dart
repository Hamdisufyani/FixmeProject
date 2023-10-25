

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/check_email_controller.dart';
import '../../../core/constant/color.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';



class CheckEmail extends StatelessWidget {
  const CheckEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckEmailControllerImp  controller = Get.put(CheckEmailControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        elevation: 0.0,
        title: Text(
          'Check Email',
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColors.grey),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
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
                  controller.goToSuccessSignUp();
                },
              ),

            ],
          )),
    );
  }
}
