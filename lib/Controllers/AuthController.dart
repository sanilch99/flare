import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare/Controllers/UserController.dart';
import 'package:flare/Models/User.dart';
import 'package:flare/Screens/CreateProfile.dart';
import 'package:flare/Screens/Login.dart';
import 'package:flare/Screens/Root.dart';
import 'package:flare/Utils/Databse.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<FirebaseUser> _firebaseUser = Rx<FirebaseUser>();

  FirebaseUser get user => _firebaseUser.value;

  @override
  onInit() {
    _firebaseUser.bindStream(_auth.onAuthStateChanged);
  }

  void createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password).then((value){
            User user=User(
              id:value.uid,
              Email:email,
            );
         Get.to(CreateProfile(user));
      });
    } catch (e) {
      Get.snackbar(
        "Error creating Account",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password).then((value) async {
          Get.to(Root());
      });
    } catch (e) {
      Get.snackbar(
        "Error signing in",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    try {
      await _auth.signOut().then((value) {
        Get.offAll(Login());
      });
    } catch (e) {
      Get.snackbar(
        "Error signing out",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}