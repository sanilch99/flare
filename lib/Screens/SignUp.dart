import 'package:flare/Controllers/AuthController.dart';
import 'package:flare/Screens/Login.dart';
import 'package:flare/Screens/Root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignUp extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.redAccent,
        body:SafeArea(
          child:Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Welcome To Flare",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Container(
                  width: Get.width,
                  height: Get.height,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.redAccent[100],
                                borderRadius: BorderRadius.circular(100)
                            ),
                            height: 200,
                            width: 200,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 24),
                                child: Lottie.asset("Assets/lottieflare.json"),
                              ),
                            )
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
                                TextFormField(
                                  autofocus: false,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                                          borderRadius: BorderRadius.circular(25)
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.red, width: 5.0),
                                          borderRadius: BorderRadius.circular(25)
                                      ),
                                      hintText: "Email",
                                      hintStyle: TextStyle(
                                          color: Colors.white
                                      )
                                  ),
                                  controller: emailController,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  autofocus: false,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white, width: 1.0),
                                          borderRadius: BorderRadius.circular(25)
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.red, width: 5.0),
                                          borderRadius: BorderRadius.circular(25)
                                      ),
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                          color: Colors.white
                                      )
                                  ),
                                  controller: passwordController,
                                  obscureText: true,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                RaisedButton(
                                  color: Colors.red[100],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)
                                  ),
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14
                                    ),
                                  ),
                                  onPressed: () {
                                    controller.createUser(
                                        emailController.text, passwordController.text);
                                  },
                                ),
                                FlatButton(
                                  child: Text("Already Registered? Click here to Login"),
                                  onPressed: () {
                                    Get.off(Login());
                                  },
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
