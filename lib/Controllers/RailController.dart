import 'package:get/get.dart';

class RailController extends GetxController{
  int selectedIndex=0;

  void select(index){
    selectedIndex=index;
    update();
  }

}