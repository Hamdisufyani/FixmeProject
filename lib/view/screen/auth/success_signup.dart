import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/successreset_controller.dart';
import '../../../core/constant/color.dart';
import '../../widget/auth/custombuttonauth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp  controller = Get.put(SuccessResetPasswordControllerImp());

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        elevation: 0.0,
        title: Text(
          'Success',
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColors.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(

          children: [
            Center(child: Icon(Icons.check_circle_outline,size: 200,color: AppColors.primaryColor,)),
            const Text("Verification Successfully"),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButtonAuth(
                text: "Go to Login",
                onPressed: () {
                  controller.goToPageLogin();
                },
              ),
            ),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
