// package imports

import 'package:docapp/src/models/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docapp/src/services/restclient.dart';

import '../models/error.dart';

import '../services/auth.dart';
import '../utils/routes/app_routes.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  TextEditingController signupFirstname = TextEditingController();
  TextEditingController signupLastname = TextEditingController();
  TextEditingController signupPassword = TextEditingController();
  TextEditingController signupEmail = TextEditingController();

  RestClient restClient = Get.find<RestClient>();
  AuthService authService = Get.find<AuthService>();

  RxBool isLoading = false.obs;
  // Service Initialization

  Future<void> login() async {
    try {
      bool success = await authService.login(username.text, password.text);
      if (success) {
        Get.offAndToNamed(Routes.homeRoute);
      }
      // print(res.toJson().toString());
    } catch (e) {
      e as ErrorResponse;
      print(e.statusMessage);
    }
  }

  Future<void> signUp() async {
    try {
      bool success = await authService.register(signupFirstname.text,
          signupLastname.text, signupEmail.text, signupPassword.text);

      if (success) {
        Get.offAndToNamed(Routes.homeRoute);
      }
      // print(res.toJson().toString());
    } catch (e) {
      e as ErrorResponse;
      print(e.statusMessage);
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
