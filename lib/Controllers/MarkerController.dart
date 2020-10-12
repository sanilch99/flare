import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flare/Models/Flare.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MarkerController extends GetxController {
  List<Marker> markers = <Marker>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    Firestore.instance.collection("Flares").where("accepted",isEqualTo: true).getDocuments().then((value) {
      List<DocumentSnapshot> ds = value.documents;
      for (DocumentSnapshot x in ds) {
        Flare fl=Flare.fromDocumentSnapshot(documentSnapshot: x);
        markers.add(Marker(
            markerId: MarkerId(fl.request),
            position: LatLng(fl.lat,fl.long),
            onTap: () {
              Get.defaultDialog(
                title: fl.request,
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      child: Text("No"),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    RaisedButton(
                      child: Text("Yes"),
                      onPressed: () {
                        launch(
                            "https://maps.google.com?q=${fl.lat.toString()}, ${fl.long.toString()}");
                      },
                    ),
                  ],
                ),
              );
            }));
      }
    });
    super.onInit();
  }

  void updateAll(){
    Firestore.instance.collection("Flares").getDocuments().then((value) {
      List<DocumentSnapshot> ds = value.documents;
      for (DocumentSnapshot x in ds) {
        Flare fl=Flare.fromDocumentSnapshot(documentSnapshot: x);
        markers.add(Marker(
            markerId: MarkerId(fl.request),
            position: LatLng(fl.lat,fl.long),
            onTap: () {
              Get.defaultDialog(
                title: fl.request,
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      child: Text("No"),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    RaisedButton(
                      child: Text("Yes"),
                      onPressed: () {
                        launch(
                            "https://maps.google.com?q=${fl.lat.toString()}, ${fl.long.toString()}");
                      },
                    ),
                  ],
                ),
              );
            }));
      }
    });
  }
}
