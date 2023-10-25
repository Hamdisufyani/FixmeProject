import 'dart:async';


import 'package:geolocator/geolocator.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import 'package:get/get.dart';
class AddAddressController  extends GetxController{


  StatusRequest statusRequest =StatusRequest.loading;
   Completer<GoogleMapController>? completerController ;
   List<Marker> markers=[];



  double? lat;
  double? long;

  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }
   Position? position ;


    CameraPosition? kGooglePlex ;

  getCurrLocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    statusRequest = StatusRequest.none;
    update();
  }

  goToPageAddDetailsAddress() {
    Get.toNamed(AppRoute.addressdetailspage,
        arguments: {"lat": lat.toString(), "long": long.toString()});
  }


  @override
  void onInit() {
      getCurrLocation();
      completerController= Completer<GoogleMapController>();
    super.onInit();
  }
}