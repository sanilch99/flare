import 'package:flare/Screens/AllFlare.dart';
import 'package:flare/Screens/CreateFlare.dart';
import 'package:flare/Screens/Home.dart';
import 'package:flare/Screens/Map.dart';
import 'package:flare/Screens/Profile.dart';
import 'package:flare/Controllers/RailController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Root extends StatelessWidget {
  final RailController rc=Get.put(RailController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:GetBuilder<RailController>(
        builder:(rc){
          return Visibility(
            visible: rc.selectedIndex==3?false:true,
            child: FloatingActionButton(
              backgroundColor: Colors.redAccent[100],
              elevation: 15,
              child: Icon(Icons.whatshot,color: Colors.deepOrange,),
              onPressed: (){
                Get.to(CreateFlare());
              },
            ),
          );
        }

      ),
      body: Container(
        width:Get.width,
        height: Get.height,
        child: Row(
          children: [
            GetBuilder<RailController>(
              builder: (rc){
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: NavigationRail(
                    minWidth: 30,
                    elevation: 60,
                    selectedIndex: rc.selectedIndex,
                    onDestinationSelected: (int index) {
                      rc.select(index);
                    },
                    labelType: NavigationRailLabelType.selected,
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.home,),
                        selectedIcon: Icon(Icons.home,color: Colors.redAccent,),
                        label: Text('Home',style: TextStyle(fontSize: 12,color: Colors.redAccent),),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.account_circle_outlined),
                        selectedIcon: Icon(Icons.account_circle_outlined,color: Colors.redAccent,),
                        label: Text('Profile',style: TextStyle(fontSize: 12,color: Colors.redAccent),),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.whatshot),
                        selectedIcon: Icon(Icons.whatshot,color: Colors.redAccent,),
                        label: Text('Flares',style: TextStyle(fontSize: 12,color: Colors.redAccent),),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.map),
                        selectedIcon: Icon(Icons.map,color: Colors.redAccent,),
                        label: Text('Map',style: TextStyle(fontSize: 12,color: Colors.redAccent),),
                      ),
                    ],
                  ),
                );
              },
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: GetBuilder<RailController>(
                  builder: (rc){
                    switch(rc.selectedIndex){
                      case 0:
                        return Home();
                        break;
                      case 1:
                        return Profile();
                        break;
                      case 2:
                        return AllFlare();
                        break;
                      case 3:
                        return FlareMap();
                        break;
                    }
                  },
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}



