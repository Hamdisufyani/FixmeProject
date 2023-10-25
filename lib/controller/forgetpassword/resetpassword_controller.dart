import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/remote/forgetpassword/resetpassword.dart';

abstract class ResetPasswordController extends GetxController{
  resetPassword();

  goToSuccessPassword();

}

class ResetPasswordControllerImp extends ResetPasswordController{
  GlobalKey<FormState> formState= GlobalKey<FormState>();

  late TextEditingController password;
  late TextEditingController repassword;

  String? email;
  StatusRequest statusRequest =StatusRequest.none;

  ResetPasswordData resetPasswordData =ResetPasswordData(Get.find()) ;

  List data =[] ;
  @override
  resetPassword() {

  }

  @override
  goToSuccessPassword() async{
    if(password.text!=repassword.text){
      return Get.defaultDialog(
          title: "warning", middleText: "Password Not Match");
    }
    var formData = formState.currentState ;
    if(formData!.validate()){
      statusRequest =StatusRequest.loading;
      update();
      var response =await resetPasswordData.postData(email!,password.text) ;
      statusRequest =handlingData(response) ;
      if(StatusRequest.success ==statusRequest){
        if(response['status'] =="success"){
          //  data.addAll(response['data']) ;
          Get.offNamed(AppRoute.successPassword);
        }else{
          Get.defaultDialog(title: "Warning",middleText: "Try Again", );
          statusRequest =StatusRequest.failure ;
        }

      }
      update();
  }else{

    }}

  @override
  void onInit() {
    email=Get.arguments['email'];
    password=TextEditingController();
    repassword=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    password.dispose();
    repassword.dispose();

    super.dispose();
  }

}