// package imports

import 'package:cloud_firestore/cloud_firestore.dart';
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

    await auth.loginUser(email, password);
  }

  void signUpUser() async {
    final email = signupEmail.text.trim();
    final password = signupPassword.text.trim();
    final firstName = signupFirstname.text.trim();
    final lastName = signupLastname.text.trim();

    if (email.isNotEmpty) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        User user = userCredential.user!;
        await user.updateDisplayName("$firstName $lastName");
        FirebaseFirestore.instance.collection("users").doc().set(
          {
            "firstName": firstName,
            "lastName": lastName,
            "userEmail": email,
            "userPassword": password,
          },
        );

        if (!user.emailVerified) {
          try {
            await user.sendEmailVerification();
            Get.snackbar(
              "",
              "",
              titleText: Text(
                'Verification Send',
                style: TextStyle(
                  fontFamily: 'font',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5,
                ),
              ),
              messageText: Text(
                'Please Check Your Email',
                style: TextStyle(
                  fontFamily: 'font',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: Colors.white,
              margin: const EdgeInsets.all(10),
            );
            // Verification email sent successfully
            // You can show a success message or navigate to a confirmation page
          } catch (e) {
            // Error occurred while sending verification email
            // You can show an error message to the user
            Get.log('Failed to send verification email. Error: $e');
          }
        }

        // Get.offAndToNamed(Routes.authMain);
      } on FirebaseAuthException catch (e) {
        // print(e);
        if (e.code != 'user-not-found') {
          Get.snackbar(
            "",
            "",
            titleText: Text(
              'Error!',
              style: TextStyle(
                fontFamily: 'font',
                fontWeight: FontWeight.bold,
                letterSpacing: 5,
              ),
            ),
            messageText: Text(
              'User Already Exists',
              style: TextStyle(
                fontFamily: 'font',
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
              ),
            ),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            margin: const EdgeInsets.all(10),
          );
        }
      }
    } else {
      Get.snackbar(
        "Error",
        "Please Fill All Fields",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
      );
    }
  }

  // void signUp() async {
  //   isSigningUp = true;

  //   String firstName = signupFirstname.text;
  //   String lastName = signupLastname.text;

  //   String email = signupEmail.text;
  //   String password = signupPassword.text;

  //   // User? user = await auth.signUpWithEmailAndPassword(email, password);

  //   isSigningUp = false;

  //   if (user != null) {
  //     Fluttertoast.showToast(
  //         msg: "User is successfully created",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.blue,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //     Get.toNamed(Routes.homeRoute);
  //   } else {
  //     Fluttertoast.showToast(
  //         msg: "Some error happend",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.blue,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //   }
  // }

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }
}
