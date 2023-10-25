import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/orders/orderspending_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../widget/orders/orderlistcard.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Orders'),
        ),
        body: Container(
          padding:const  EdgeInsets.all(10),
          child: GetBuilder<OrdersPendingController>(
              builder: ((controller) => HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: ((context, index) =>
                    CardOrdersList(listdata: controller.data[index])),
              )))),
        ));
  }
}