import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

import '../../controller/address/add_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/color.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddAddressController controllerPage = Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(
        title: Text('add new address'),
      ),

      body: GetBuilder<AddAddressController>(builder: (controllerPage) {
        return HandlingDataView(
            statusRequest: controllerPage.statusRequest,
            widget: Column(children: [
              if (controllerPage.kGooglePlex != null)
                Expanded(
                    child: Stack(
                  alignment: Alignment.center,
                  children: [
                    GoogleMap(
                      mapType: MapType.normal,
                      markers: controllerPage.markers.toSet(),
                      onTap: (latlong) {
                        controllerPage.addMarkers(latlong);
                      },
                      initialCameraPosition: controllerPage.kGooglePlex!,
                      onMapCreated: (GoogleMapController controllermap) {
                        controllerPage.completerController!
                            .complete(controllermap);
                      },
                    ),
                    Positioned(
                      bottom: 10,
                      child: Container(
                        child: MaterialButton(
                          minWidth: 200,
                          onPressed: () {
                            controllerPage.goToPageAddDetailsAddress();
                          },
                          child:
                              Text("اكمال", style: TextStyle(fontSize: 18)),
                          color: AppColors.primaryColor,
                          textColor: Colors.red,
                        ),
                      ),
                    )
                  ],
                ))
            ]));
      }),
    );
  }
}
