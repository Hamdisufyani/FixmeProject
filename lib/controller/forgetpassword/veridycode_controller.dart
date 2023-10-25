
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/remote/forgetpassword/verifycode.dart';

abstract class VerifyCodeController extends GetxController{
  checkCode();

  goToResetPassword(String verificationCode);

}

class VerifyCodeControllerImp extends VerifyCodeController{
VerifyCodeResetPasswordData verifyCodeResetPasswordData =VerifyCodeResetPasswordData(Get.find());
  String? email;

StatusRequest statusRequest =StatusRequest.none;

  @override
  checkCode() {

  }

  @override
  goToResetPassword(verificationCode) async{
    statusRequest =StatusRequest.loading;
    update();
    var response =await verifyCodeResetPasswordData.postData(email!, verificationCode) ;
    statusRequest =handlingData(response) ;
    if(StatusRequest.success ==statusRequest){
      if(response['status'] =="success"){
        //  data.addAll(response['data']) ;
        Get.offNamed(AppRoute.resetPassword, arguments: {
          "email" :email
        });
      }else{
        Get.defaultDialog(
          title: "Warning",
          middleText: "Verify Code Not Correct", );
        statusRequest =StatusRequest.failure ;
      }

    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];

    super.onInit();
  }


}