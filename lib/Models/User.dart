import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class User{
  String id;
  String Email;
  String Name;
  String Phone;
  String Address;
  int Age;
  double Long;
  double Lat;
  String Img;
  String Gender;

  User({this.Email, this.Name, this.Phone, this.Address, this.Age,
      this.Long, this.Lat, this.Img, this.Gender,this.id});

  User.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.documentID;
    Name = documentSnapshot["Name"];
    Email = documentSnapshot["Email"];
    Phone = documentSnapshot["Phone"];
    Address = documentSnapshot["Address"];
    Age = documentSnapshot["Age"];
    Long = documentSnapshot["Long"];
    Lat = documentSnapshot["Lat"];
    Img = documentSnapshot["Img"];
    Gender = documentSnapshot["Gender"];
  }

}