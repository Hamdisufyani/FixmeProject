import 'package:flutter/material.dart';

import '../../controller/checkout_controller.dart';
import '../../core/class/handlingdataview.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';
import '../../core/constant/imageassets.dart';
import '../widget/checkout/carddeliveerytype.dart';
import '../widget/checkout/cardpaymentmethod.dart';
import '../widget/checkout/cardshippingaddress.dart';
import '../widget/items/itemappbar.dart';
class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());

    return  SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: ItemAppBar(textTitle: 'Check Out',)),
        bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MaterialButton(
              color: AppColors.secondaryColor,
              textColor: Colors.white,
              onPressed: () {
                controller.checkOut();
              },
              child: const Text("Checkout",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            )),
        body: GetBuilder<CheckoutController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                    padding: const EdgeInsets.all(20),
                    child: ListView(
                      children: [
                         Text(
                          "Choose Payment Method",
                          style: TextStyle(
                              color: AppColors.secondaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            controller.choosePaymentMethod("0");
                          },
                          child: CardPaymentMethodCheckout(
                              title: "Cash On Delivery",
                              isActive: controller.paymentMethod == "0"
                                  ? true
                                  : false),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            controller.choosePaymentMethod("1");
                          },
                          child: CardPaymentMethodCheckout(
                              title: "Payment Cards",
                              isActive: controller.paymentMethod == "1"
                                  ? true
                                  : false),
                        ),
                        const SizedBox(height: 20),
                         Text(
                          "Choose Delivery Type",
                          style: TextStyle(
                              color: AppColors.secondaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                controller.chooseDeliveryType("0");
                              },
                              child: CardDeliveryTypeCheckout(
                                  imagename: AppImageAsset.deliveryImage2,
                                  title: "Delivery",
                                  active: controller.deliveryType == "0"
                                      ? true
                                      : false),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                controller.chooseDeliveryType("1");
                              },
                              child: CardDeliveryTypeCheckout(
                                  imagename: AppImageAsset.drivethruImage,
                                  title: "Revice",
                                  active: controller.deliveryType == "1"
                                      ? true
                                      : false),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        if (controller.deliveryType == "0")
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                "Shipping Address",
                                style: TextStyle(
                                    color: AppColors.secondaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              const SizedBox(height: 10),
                              ...List.generate(
                                controller.dataaddress.length,
                                    (index) => InkWell(
                                  onTap: () {
                                    controller.chooseShippingAddress(
                                        controller.dataaddress[index].addressId!);
                                  },
                                  child: CardShppingAddressCheckout(
                                      title:
                                      "${controller.dataaddress[index].addressName}",
                                      body:
                                      "${controller.dataaddress[index].addressCity} ${controller.dataaddress[index].addressStreet}",
                                      isactive: controller.addressid ==
                                          controller
                                              .dataaddress[index].addressId
                                          ? true
                                          : false),
                                ),
                              )
                            ],
                          )
                      ],
                    )))),
      ),
    );
  }
}