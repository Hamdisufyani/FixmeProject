
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../../controller/forgetpassword/veridycode_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/customtexttitleauth.dart';
import '../../../widget/auth/logoauth.dart';

class VerifyCodeForgetPassword extends StatelessWidget {
  const VerifyCodeForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        elevation: 0.0,
        title: Text(
          'Verification Code',
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColors.grey),
        ),
      ),
      body:GetBuilder<VerifyCodeControllerImp>(
        builder: (controller) => HandlingDataRequest(statusRequest:controller.statusRequest,
        widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: ListView(
              children: [
                const LogoAuth(),
                const CustomTextTitleAuth(
                  text: 'Check Code',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextTitleAuth(
                  text: 'please enter digit code that you recieved',
                ),
                const SizedBox(
                  height: 15,
                ),
                OtpTextField(
                  fieldWidth: 50.0,
                  borderRadius: BorderRadius.circular(20),
                  numberOfFields: 5,
                  borderColor: Color(0xFF512DA8),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode){
                    controller.goToResetPassword(verificationCode);
                  }, // end onSubmit
                ),



              ],
            )),
      ),
    ));
  }
}
