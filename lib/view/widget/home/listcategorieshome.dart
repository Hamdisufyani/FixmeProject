import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translatdatabase.dart';
import '../../../data/model/categoriesmodel.dart';
import '../../../linkapi.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.categories.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, index) {
          return Categories(
            i: index,
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),
          );
        });
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({Key? key, required this.categoriesModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.goToItems(controller.categories, i!,
              categoriesModel.categoriesId!.toString());
        },
        child: Card(
          elevation: 5,
          shadowColor: Colors.grey, // Shadow depth

          margin: EdgeInsets.all(10), // Margin around the card
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                          offset: Offset(
                            5.0, // Move to right 7.0 horizontally
                            5.0, // Move to bottom 8.0 Vertically
                          ))
                    ],
                  ), // Height of the image container
                  // color: Colors.green, // White background color
                  child: Image.network(
                    "${AppLink.categoriesImage}/${categoriesModel.categoriesImage}", // Your image asset
                    fit: BoxFit.fitHeight, // BoxFit to cover the container
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
                  style: const TextStyle(color: AppColors.black, fontSize: 18),
                ),
              ),
            ],
          ),
        ));
  }
}
