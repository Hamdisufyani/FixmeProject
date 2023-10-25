
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../view/orders/details.dart';
import '../view/screen/home_screen.dart';
import '../view/setting.dart';
abstract class HomeScreenController extends GetxController{
  changePage(int i);

}
class HomeScreenControllerImp extends HomeScreenController{

  int currentPage =0;
  List<Widget> listPage =[
    const HomePage(),
    const Settings(),


    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(child:  Text("Favorite"),)
      ],
    ),
    const Settings(),



  ];
  List<IconData> listIcons =[
    Icons.home_outlined,
    Icons.settings,
    Icons.person_outline,
    Icons.favorite_outline
  ];
  List bottomAppbar =[
    {"title": "home", "icon": Icons.home},
    { "title": "ca","icon": Icons.view_list} ,
    {"title": "profile", "icon": Icons.star_border_rounded} ,
    {"title": "setting", "icon": Icons.settings}

  ];
  @override
  changePage(int i) {
    currentPage = i;
    update();
  }

}