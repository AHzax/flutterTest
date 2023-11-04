// package imports

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:docapp/src/services/restclient.dart';

import '../models/error.dart';

import '../services/auth.dart';
import '../utils/routes/app_routes.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController pass = TextEditingController();

  TextEditingController signupFirstname = TextEditingController();
  TextEditingController signupLastname = TextEditingController();
  TextEditingController signupPassword = TextEditingController();
  TextEditingController signupEmail = TextEditingController();
  bool isSigningUp = false;

  RestClient restClient = Get.find<RestClient>();
  AuthService authService = Get.find<AuthService>();

  RxBool isLoading = false.obs;
  AuthService auth = AuthService();

  // Service Initialization

  void signIn() async {
    String email = username.text;
    String password = pass.text;

    User? user = await auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      auth.prefs.setBool("loggedInUser", user.emailVerified);
      print("444444444444444444444444444444::::::::::${user.emailVerified}");
      Fluttertoast.showToast(
          msg: "User is successfully signed in",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
      Get.toNamed(Routes.homeRoute);
    } else {
      Fluttertoast.showToast(
          msg: "some error occured",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  void signUp() async {
    isSigningUp = true;

    String firstName = signupFirstname.text;
    String lastName = signupLastname.text;

    String email = signupEmail.text;
    String password = signupPassword.text;

    User? user = await auth.signUpWithEmailAndPassword(email, password);

    isSigningUp = false;

    if (user != null) {
      Fluttertoast.showToast(
          msg: "User is successfully created",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
      Get.toNamed(Routes.homeRoute);
    } else {
      Fluttertoast.showToast(
          msg: "Some error happend",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }
}
