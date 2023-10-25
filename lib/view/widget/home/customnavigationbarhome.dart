import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/homescreen_controller.dart';
import 'customappbarhome.dart';
class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<HomeScreenControllerImp>(
      builder: (controller) {
        return BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Row(
            children: [
              ...List.generate(controller.listPage.length+1, ((index) {
                int i =index >2?index -1 :index;
                return index ==2? const Spacer():
                CustomAppBarHome(text: controller.bottomAppbar[i]['title'], iconData: controller.bottomAppbar[i]['icon'],onPressed:() {
                  controller.changePage(i);
                },  active: controller.currentPage==i ?true :false , );
              })),

            ],
          ),
        );
      }
    );
  }
}
