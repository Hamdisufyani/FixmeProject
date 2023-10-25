import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

import '../../../linkapi.dart';


class CustomItemsListCart extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imagename;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CustomItemsListCart(
      {Key? key,
      required this.name,
      required this.price,
      required this.count,
      required this.imagename,
      this.onAdd,
      this.onRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(children: [
          Expanded(
              flex: 2,
              child: Image.network(
              "${AppLink.itemsImage}/$imagename",
                height: 80,
              )),
          Expanded(
              flex: 3,
              child: ListTile(
                title: Text(name, style: TextStyle(fontSize: 15)),
                subtitle: Text(price,
                    style:
                    TextStyle(color: AppColors.primaryColor, fontSize: 17)),
              )),
          Expanded(
              child: Column(
                children: [
                  Container(
                      height: 35,
                      child: IconButton(onPressed: onAdd, icon: Icon(Icons.add))),
                  Container(
                      height: 30,
                      child: Text(
                        count,
                        style: TextStyle(fontFamily: "sans"),
                      )),
                  Container(
                      height: 25,
                      child: IconButton(onPressed: onRemove, icon: Icon(Icons.remove)))
                ],
              ))
        ]),
      ),
    );
  }
}