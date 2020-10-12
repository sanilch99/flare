import 'package:flare/Controllers/AuthController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Home extends StatelessWidget {
  final AuthController ac=Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(8,16,8,8),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Lottie.asset("Assets/lottieflare.json"),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.redAccent[100],
                      borderRadius: BorderRadius.circular(75)
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  Text(
                    "Hi User!\n\nWelcome to Flare, here you can ask help for anything, you want it you got it\n",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                      "The Flare Community is here for you!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Card(
                    elevation: 5,
                    child: ExpansionTile(
                      title:Text(
                          "Frequently Asked Questions"
                      ) ,
                      leading: Icon(Icons.question_answer_outlined,color: Colors.redAccent,),
                      childrenPadding: EdgeInsets.zero,
                      children: [
                        ExpansionTile(
                          title: Text("1. How to request a Flare?"),
                          children: [
                            Text("Click on the fire button on the bottom right of your screen to send out a Flare for help.")
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Card(
                    elevation: 5,
                    child: ExpansionTile(
                      title:Text(
                          "Send Feedback"
                      ) ,
                      leading: Icon(Icons.feedback_outlined,color: Colors.redAccent,),
                      childrenPadding: EdgeInsets.zero,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white, width: 1.0),
                                            borderRadius: BorderRadius.circular(25)
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.red, width: 1.0),
                                            borderRadius: BorderRadius.circular(25)
                                        ),
                                      hintText: "Suggestions/Feedback"
                                    ),
                                  ),
                                  RaisedButton(
                                    color: Colors.red[100],
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25)
                                    ),
                                    child: Text(
                                      "Send",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 14
                                      ),
                                    ),
                                    onPressed: () {
                                      //TODO SEND FEEDBACK
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Card(
                    elevation: 5,
                    child: ExpansionTile(
                      title:Text(
                          "Terms & Conditions"
                      ) ,
                      leading: Icon(Icons.favorite,color: Colors.redAccent,),
                      childrenPadding: EdgeInsets.zero,
                      children: [
                        Row(
                          children: [
                            Text("Some Setting"),
                            Switch(
                                activeColor: Colors.redAccent[100],
                                value: false,
                                onChanged: (bool){
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Card(
                    elevation: 5,
                    child: ExpansionTile(
                      title:Text(
                          "General Settings"
                      ) ,
                      leading: Icon(IconData(0xe9c6, fontFamily: 'MaterialIcons'),color: Colors.redAccent,),
                      childrenPadding: EdgeInsets.fromLTRB(16,8,8,0),
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Dark Mode"),
                                Switch(
                                    activeColor: Colors.redAccent[100],
                                    value: false,
                                    onChanged: (bool){
                                      Get.changeTheme(ThemeData.dark());
                                    })
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Notifications"),
                                Switch(
                                  activeColor: Colors.redAccent[100],
                                    value: true,
                                    onChanged: (bool){
                                    })
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Location Sharing"),
                                Switch(
                                    activeColor: Colors.redAccent[100],
                                    value: true,
                                    onChanged: (bool){
                                    })
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Card(
                    elevation: 5,
                    child: ListTile(
                      title:Text(
                          "Logout"
                      ) ,
                      trailing: Icon(Icons.arrow_forward_ios,size: 14,),
                      onTap: (){
                        ac.signOut();
                      },
                      leading: Icon(Icons.logout,color: Colors.redAccent,),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
