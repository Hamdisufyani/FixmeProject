import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/settings_controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller= Get.put(SettingsController());
    return ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: Get.width/3, color: AppColors.primaryColor,
            ),
            Positioned(
                top: Get.width/3.5,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child:  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[100],
                    backgroundImage: const AssetImage("assets/images/avatar.png"),
                  ),
                )),


          ],
        ),
        const SizedBox(height: 100,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                //  onTap: (){ },
                  title: Text("Disable Notification"),
                  trailing: Switch(onChanged: (val){},value: true,),

                ),
                ListTile(
                  onTap: (){
                    controller.goToAddressPage();

                  },
                  title: Text("Address"),
                  trailing: Icon(Icons.location_on_outlined),

                ),
                ListTile(
                  onTap: (){
                    Get.toNamed(AppRoute.orderPending);


                  },
                  title: const Text("Orders"),
                  trailing: const Icon(Icons.card_giftcard),

                ),
                ListTile(
                  onTap: (){
                    Get.toNamed(AppRoute.orderArchive);


                  },
                  title: const Text("Archive"),
                  trailing: const Icon(Icons.archive_rounded),

                ),
                ListTile(
                  onTap: (){

                  },
                  title: Text("About us"),
                  trailing: Icon(Icons.info),

                ),

                ListTile(
                  onTap: (){

                  },
                  title: Text("Contact us"),
                  trailing: Icon(Icons.phone_callback_outlined),

                ),


                ListTile(
                  onTap: (){
                    controller.logout();

                  },
                  title: Text("Log out"),
                  trailing: Icon(Icons.exit_to_app_outlined),
                )
              ],
            ),
          ),
        )
      ],

    );
  }
}
