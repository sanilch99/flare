import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{
  File image;
  Position current;
  String address;
  TextEditingController locationCont = TextEditingController();



  void getUpdateLocation(Position newP){
    current=newP;
    update();
  }

  void updateText(String newAddress){
    address=newAddress;
    locationCont.text=address;
    update();
  }

  void updateImage(File img){
    image=img;
    update();
  }


}