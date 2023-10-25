

import 'package:flutter/material.dart';


import '../../controller/home_controller.dart';
import 'package:get/get.dart';

import '../../core/class/handlingdataview.dart';
import '../../data/model/itemsmodel.dart';
import '../../linkapi.dart';
import '../widget/home/customcardhome.dart';
import '../widget/home/customtexthome.dart';
import '../widget/home/listcategorieshome.dart';
import '../widget/home/listitemshome.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) =>  const ListCategoriesHome(),
    );
  }
}

