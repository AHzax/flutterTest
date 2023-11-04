import 'dart:io';

import 'package:docapp/src/models/error.dart';
import 'package:docapp/src/models/login.dart';
import 'package:docapp/src/models/register.dart';
import 'package:docapp/src/services/restclient.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/routes/app_routes.dart';

class AuthService extends GetxService {
  String? myloggedInStatus;
  RestClient restClient = Get.find<RestClient>();
  String? loggedInUser;
  late SharedPreferences prefs;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<AuthService> init() async {
    prefs = await SharedPreferences.getInstance();
    isLoggedIn();
    return this;
  }

  // Future<bool> login(String username, String password) async {
  //   LoginRequest req = LoginRequest.fromJson({
  //     "usr": username,
  //     "pwd": password,
  //     "device": "mobile",
  //   });
  //   try {
  //     LoginResponse res = await restClient.login(req);

  //     if (res.userId != null) {
  //       loggedInUser = res.userId;
  //       print('---- $loggedInUser');
  //       await prefs.setString("loggedInUser", loggedInUser!);

  //       return true;
  //     }
  //   } catch (e) {
  //     e as ErrorResponse;
  //     print("ERRRRRRRRRRRRROOORRR${e.statusMessage}");
  //   }

  //   loggedInUser = null;
  //   return false;
  // }

  bool isLoggedIn() {
    String? loggedInStatus = prefs.getString('loggedInUser');
    // loggedInUser != null
    //     ? myloggedInStatus = loggedInUser
    //     : myloggedInStatus = loggedInStatus;
    myloggedInStatus = loggedInStatus;
    print(
        "##################################3444444444444: ${myloggedInStatus}");
    return myloggedInStatus != null ? true : false;
  }

  void logout() {
    prefs.clear();
    Get.offAllNamed(Routes.loginRoute);
  }

  //////////////////////////////////////////////////

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: "The email address is already in use.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "An error occurred: ${e.code}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // loggedInUser = email.toString();
      // await prefs.setString("loggedInUser", loggedInUser!);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        Fluttertoast.showToast(
            msg: "Invalid email or password.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "An error occurred: ${e.code}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
    return null;
  }

  // Future<void> signup() async {}

  Future<void> forgotPassword() async {}

  Future<void> do2FA() async {}

  Future<dynamic> getLoggedUser() async {}
}
