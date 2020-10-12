import 'package:flare/Controllers/AuthController.dart';
import 'package:flare/Controllers/ProfileController.dart';
import 'package:flare/Controllers/UserController.dart';
import 'package:flare/Screens/AuthRoot.dart';
import 'package:flare/Screens/CreateProfile.dart';
import 'package:flare/Screens/Root.dart';
import 'package:flare/Screens/Login.dart';
import 'package:flare/Binding/AuthBinding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.redAccent[100], // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(()=>UserController());
    return GetMaterialApp(
        initialBinding: AuthBinding(),
        title: 'Flutter Demo',
        theme: ThemeData(
          accentColor: Colors.redAccent,
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home:AuthRoot()
    );
  }
}

/*
Features:-
1. Email & Password Auth
2. User Profile Creation
3. Create a Flare - predefined types or create own
4. Accept a flare
5. Your Google map location
6. FCM
7. Chat maybe
8. On completion of flare, point reward

 Screens:-
 1. SplashScreen
 2. Login
 3. SignUp
 4. ProfileCreate
 5. Home
 6. ProfileView
 7. Flare Creation
 8. Available Flares
 9. Point Redeem
 10. Settings
 */
