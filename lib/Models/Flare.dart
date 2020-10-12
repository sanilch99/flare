import 'package:cloud_firestore/cloud_firestore.dart';

class Flare{
  String acceptId;
  bool accepted;
  double lat;
  double long;
  String request;
  String requestId;
  String id;
  String desc;

  Flare({this.acceptId, this.accepted, this.lat, this.long, this.request,
      this.requestId, this.id,this.desc});

  Flare.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.documentID;
    acceptId = documentSnapshot["acceptId"];
    accepted = documentSnapshot["accepted"];
    lat = documentSnapshot["lat"];
    long = documentSnapshot["long"];
    request = documentSnapshot["request"];
    requestId = documentSnapshot["requestId"];
    desc=documentSnapshot["desc"];
  }
}