
import 'package:flare/Models/User.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<User> _userModel = User().obs;

  User get user => _userModel.value;

  set user(User value) => this._userModel.value = value;


  @override
  void onInit() {

  }

  void clear() {
    _userModel.value = User();
  }
}