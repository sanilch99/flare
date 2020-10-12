import 'dart:async';
import 'package:flare/Controllers/MarkerController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FlareMap extends StatelessWidget {
  final MarkerController mc=Get.put(MarkerController());

  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> _controller = Completer();
    
    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(19.1176513, 72.8971456),
      zoom: 14.4746,
    );

    final CameraPosition _kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(37.43296265331129, -122.08832357078792),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);

    return SafeArea(
      child:GetX<MarkerController>(
        init: MarkerController(),
        builder: (mc){
          return Stack(
            children: [
              GoogleMap(
                mapType: MapType.hybrid,
                markers: Set<Marker>.of(mc.markers),
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
              Container(
                color: Colors.red,
                width: 50,
                height: 50,
                child: IconButton(
                  icon: Icon(Icons.add_location_outlined),
                  onPressed: (){
                    mc.updateAll();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
