import 'package:flare/Controllers/AuthController.dart';
import 'package:flare/Controllers/UserController.dart';
import 'package:flare/Models/User.dart';
import 'package:flare/Utils/Databse.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          GetX<UserController>(
            init: UserController(),
            initState: (_) async {
              Get.find<UserController>().user =
                  await Database().getUser(Get.find<AuthController>().user.uid);
            },
            builder: (_){
              if (_.user.Name != null) {
                return Text("Welcome " + _.user.Name);
              } else {
                return Text("loading...");
              }
            },
          )
        ],
      ),
    );
  }
}
