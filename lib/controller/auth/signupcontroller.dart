
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdata.dart';
import '../../data/datasource/remote/auth/signup.dart';

abstract class SignUpController extends GetxController{
  signUp();

  goToLogin();

}

class SignUpControllerImp extends SignUpController{
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  late TextEditingController userName;

  GlobalKey<FormState> formState= GlobalKey<FormState>();

     StatusRequest statusRequest =StatusRequest.none;

  SignUpData signUpData =SignUpData(Get.find()) ;

  List data =[] ;

  bool isShowPassword =true;
  showPassword(){
    isShowPassword =isShowPassword ==true ? false :true;
    update();
  }
  @override
  signUp() async{
   if(formState.currentState!.validate()){

     statusRequest =StatusRequest.loading;
     update();
     var response =await signUpData.postData(userName.text, password.text, email.text, phone.text) ;
     statusRequest =handlingData(response) ;
     if(StatusRequest.success ==statusRequest){
       if(response['status'] =="success"){
       //  data.addAll(response['data']) ;
         Get.offNamed(AppRoute.verifyCodeSignUp , arguments: {
           "email" :email.text
         });
       }else{
         Get.defaultDialog(title: "Warning",middleText: "Phone Number or email already exists", );
         statusRequest =StatusRequest.failure ;
       }

     }
     update();

    }else{

    }
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    email=TextEditingController();
    password =TextEditingController();
    phone= TextEditingController();
    userName =TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    phone.dispose();
    userName.dispose();
    super.dispose();
  }



}