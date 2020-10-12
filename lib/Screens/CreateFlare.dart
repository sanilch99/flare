import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare/Models/Flare.dart';
import 'package:flare/Models/User.dart';
import 'package:flare/Screens/Root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CreateFlare extends StatelessWidget {
  final TextEditingController reqController=TextEditingController();
  final TextEditingController descController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        titleSpacing: 0,
        title: Text("Create Your Flare",style: TextStyle(color: Colors.red[900]),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.red[900]),
          onPressed: (){
            Get.offAll(Root());
          },
        ),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Flexible(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Title Of Your Flare",style: TextStyle(color: Colors.red),),
                          TextFormField(
                            controller: reqController,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Description",style: TextStyle(color: Colors.red),),
                          TextFormField(
                            controller: descController,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          Text("Do you agree to share your location?"),
                          Switch(
                              value: true,
                              onChanged: (x){

                              })
                        ],
                      ),
                    ),
                    RaisedButton(
                      color: Colors.red[100],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                      ),
                      child: Text(
                        "Launch Flare",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 14
                        ),
                      ),
                      onPressed: () {
                        String reqId;
                        User curr;
                        Flare fl;
                        FirebaseAuth.instance.currentUser().then((value) {
                          reqId = value.uid;
                          Firestore.instance.collection("Users").document(reqId).get().then((value){
                            curr=User.fromDocumentSnapshot(documentSnapshot: value);
                            fl=Flare(
                                request:reqController.text,
                                desc: descController.text,
                                requestId: reqId,
                                lat: curr.Lat,
                                long: curr.Long,
                                accepted: false,
                                acceptId: ""
                            );
                            Firestore.instance.collection("Flares").add({
                              "request":reqController.text,
                              "desc": descController.text,
                              "requestId": reqId,
                              "lat": curr.Lat,
                              "long": curr.Long,
                              "accepted": false,
                              "acceptId": ""
                            }).then((value){
                              Get.snackbar("Flare Created", "Wait for community to help you!",snackPosition: SnackPosition.BOTTOM);
                              reqController.text="";
                              descController.text="";
                            });
                          });
                        });

                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
