import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flare/Controllers/ProfileController.dart';
import 'package:flare/Models/User.dart';
import 'package:flare/Screens/Root.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateProfile extends GetWidget<ProfileController> {
  User currentUser;
  CreateProfile(this.currentUser);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Complete Your Profile',
                style: TextStyle(
                    color: Colors.red[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                ),
              ),
              Flexible(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 24,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        GetBuilder<ProfileController>(
                          builder: (pc){
                            return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(70),
                                  color: Colors.deepOrange,
                                ),
                                child: (controller.image!=null)?
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(70.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(70),
                                      color: Colors.deepOrange,
                                    ),
                                    width: 140,
                                    height: 140,
                                    child: Image.file(pc.image,fit: BoxFit.contain,) ,
                                  ),
                                ):
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(70),
                                    color: Colors.deepOrange,
                                  ),
                                  width: 140,
                                  height: 140,
                                )
                            );
                          },
                        ),
                        Positioned(
                          top: 90,
                          left: 225,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.black,
                            child: IconButton(
                              icon: Icon(Icons.camera,color: Colors.white,),
                              onPressed: () async {
                                //imagepick
                                await ImagePicker.pickImage(source:ImageSource.gallery).then((value){
                                  controller.updateImage(value);
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                                    borderRadius: BorderRadius.circular(25)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red, width: 5.0),
                                    borderRadius: BorderRadius.circular(25)
                                ),
                                hintText: "Full Name"
                            ),
                            controller: nameController,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 1.0),
                                  borderRadius: BorderRadius.circular(25)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red, width: 5.0),
                                  borderRadius: BorderRadius.circular(25)
                              ),
                              hintText: "Age",
                            ),
                            controller: age,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                                    borderRadius: BorderRadius.circular(25)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red, width: 5.0),
                                    borderRadius: BorderRadius.circular(25)
                                ),
                                hintText: "Gender"
                            ),
                            controller: genderController,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                                    borderRadius: BorderRadius.circular(25)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red, width: 5.0),
                                    borderRadius: BorderRadius.circular(25)
                                ),
                                hintText: "Phone"
                            ),
                            controller: phoneController,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          GetBuilder<ProfileController>(
                            builder: (pc){
                              return Row(
                                children: [
                                  Container(
                                    width:Get.width*0.8,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white, width: 1.0),
                                              borderRadius: BorderRadius.circular(25)
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.red, width: 5.0),
                                              borderRadius: BorderRadius.circular(25)
                                          ),
                                          hintText: "Location"
                                      ),
                                      controller: controller.locationCont,
                                    ),
                                  ),
                                  IconButton(
                                    color: Colors.red[900],
                                    icon: Icon(Icons.add_location_outlined,color: Colors.red[900],size: 32,),
                                    onPressed: (){
                                      _getCurrentLocation();
                                    },
                                  )
                                ],
                              );
                            },
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                width: Get.width,
                child: RaisedButton(
                  color: Colors.red[100],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Complete",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 14
                      ),
                    ),
                  ),
                  onPressed: () {
                    currentUser=User(
                      id: currentUser.id,
                      Email: currentUser.Email,
                      Phone: phoneController.text,
                      Name: nameController.text,
                      Age: int.parse(age.text),
                      Lat: controller.current.latitude,
                      Long: controller.current.longitude,
                      Gender: genderController.text,
                      Img: "asdas",
                      Address: controller.locationCont.text,
                    );
                    _uploadProfileDataAndRedirect(currentUser);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) async{
        controller.getUpdateLocation(position);
          List<Placemark> p = await geolocator.placemarkFromCoordinates(
              controller.current.latitude, controller.current.longitude);
          Placemark place = p[0];
          print("${place.locality}, ${place.postalCode}, ${place.country}");
        controller.updateText("${place.locality}, ${place.postalCode}, ${place.country}");
    }).catchError((e) {
      print(e);
    });
  }

  _uploadProfileDataAndRedirect(User curr){
    Firestore.instance.collection("Users").document(curr.id).setData(
      {
        "Name":curr.Name,
        "Email":curr.Email,
        "Age":curr.Age,
        "Address":curr.Address,
        "Phone":curr.Phone,
        "Lat":curr.Lat,
        "Long":curr.Long,
        "Img":curr.Img,
        "Gender":curr.Gender
      }
    ).then((value){
      Get.offAll(Root());
    });

  }
}
