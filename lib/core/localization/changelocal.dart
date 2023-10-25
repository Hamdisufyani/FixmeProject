import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/apptheme.dart';
import '../services/services.dart';

class LocaleController extends GetxController{
  Locale? language ;

  MyServices myServices =Get.find() ;

  ThemeData appTheme = themEnglish;

  changeLang(String langCode){
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    appTheme = langCode=="ar" ? themArabic :themEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);

  }

  @override
  void onInit() {

    String? sharedPrefLang =myServices.sharedPreferences.getString("lang");
    if(sharedPrefLang =="ar"){
      language =const Locale("ar");
      appTheme = themArabic;
    }else if(sharedPrefLang =="en"){
      language =const Locale("en");
      appTheme = themEnglish;
    }else{
      language =Locale(Get.deviceLocale!.languageCode);
      appTheme = themEnglish;
    }
    super.onInit();
  }

}