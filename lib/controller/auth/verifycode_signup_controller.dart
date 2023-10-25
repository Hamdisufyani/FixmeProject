
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/remote/auth/veriycode_signup.dart';

abstract class VerifyCodeSignUpController extends GetxController{
  checkCode();

  goToSuccessSignUp(verificationCode);

}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController{
  VerifyCodeSignUp verifyCodeSignUp =VerifyCodeSignUp(Get.find());

  String? email;

  StatusRequest statusRequest =StatusRequest.none;

  @override
  checkCode() {

  }

  @override
  goToSuccessSignUp(verificationCode) async{
    statusRequest =StatusRequest.loading;
    update();
    var response =await verifyCodeSignUp.postData(email!, verificationCode) ;
    statusRequest =handlingData(response) ;
    if(StatusRequest.success ==statusRequest){
      if(response['status'] =="success"){
        //  data.addAll(response['data']) ;
        Get.offNamed(AppRoute.successSignUp);
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
   email =Get.arguments['email'];
    super.onInit();
  }
  reSend(){
    verifyCodeSignUp.resendData(email!);
  }

}