
import 'package:get/get.dart';

import '../../../controller/items_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translatdatabase.dart';
import '../../../data/model/categoriesmodel.dart';
import '../../../linkapi.dart';
import 'package:flutter/material.dart';
class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i:index,
            categoriesModel:
            CategoriesModel.fromJson(controller.categories[index]),

          );
        },
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories( {Key? key, required this.categoriesModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //controller.goToItems(controller.categories,i!);
        controller.changCat(i! ,categoriesModel.categoriesId.toString());
      },
      child: Column(
        children: [

          GetBuilder<ItemsControllerImp>(
            builder: (controller) {
              return Container(
                padding: const EdgeInsets.only(right: 5, left: 5, bottom: 5),
                decoration: controller.selectedCat ==i ?const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 3, color: AppColors.iconColor1)
                  )
                ):null,
                child: Text(
                  "${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
                  style: const TextStyle(color: AppColors.black, fontSize: 20),
                ),
              );
            }
          )
        ],
      ),
    );
  }
}
