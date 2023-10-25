import 'package:fixme/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/dropdown/gf_multiselect.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';

import '../../controller/items_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/dimensions.dart';
import '../../data/model/itemsmodel.dart';
import '../widget/items/Allitems.dart';
import '../widget/items/bottomnavigationitem.dart';
import '../widget/items/itemappbar.dart';
import '../widget/items/itemtitlewidget.dart';
import '../widget/items/itesms_details.dart';
import 'package:get/get.dart';
class ItemPage extends StatelessWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());

    ItemsControllerImp controller = Get.put(ItemsControllerImp());

    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: ItemAppBar(textTitle: 'Request Service',)),
        backgroundColor: AppColors.backGroundColor,
        body:ListView(
          scrollDirection: Axis.vertical,
          children: [
            const ItemTitleWidget( titleText: 'Services',),

            SizedBox(height: Dimensions.height45,),
            Text('Select Service',style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold),),
            GetBuilder<ItemsControllerImp>(
                builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 0.6),
                        itemBuilder: (BuildContext context, index) {

                          return ItemRepairType(
                            itemsModel:
                            ItemsModel.fromJson(controller.data[index]),
                            i: index,
                          );
                        })
                )),


            if (controller.isContainer2Visible==true)
              const MenuItemList(),

            SizedBox(height: Dimensions.height45,),

            const SizedBox(
              width: 360,

              child: TextField(

                maxLines: null, // Set maxLines to null for multiline input
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'More details',

                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ) ,
        bottomNavigationBar: const BottomNavigationItem(),
      ),
    );
  }
}

