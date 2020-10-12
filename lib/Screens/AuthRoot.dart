import 'package:flare/Controllers/AuthController.dart';
import 'package:flare/Screens/Login.dart';
import 'package:flare/Screens/Root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthRoot extends GetWidget<AuthController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetX(
      initState: (_) async {
        //Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user?.uid != null) {
          return Root();
        } else {
          return Login();
        }
      },
    );
  }
  
}