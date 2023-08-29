// package imports
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docapp/src/services/restclient.dart';

import '../models/error.dart';

import '../services/auth.dart';
import '../utils/routes/app_routes.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
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

  ///////////////////////////////////////////////////////////
  Future<void> login2(String email, String password) async {
    final String apiUrl =
        'http://docapp.sofodynamix.com/api/resource/User'; // Replace with your API endpoint

    try {
      final response = await Dio().post(
        apiUrl,
        data: {
          'email': email,
          'password': password,
        },
      );

      // Handle the response data
      if (response.statusCode == 200) {
        // Login successful
        final responseData = response.data;
        // Process the responseData as needed
        print(responseData);
      } else {
        // Login failed
        print('Login failed with status: ${response.statusCode}');
      }
    } catch (error) {
      // Error occurred during login
      print('Error: $error');
    }
  }

  ///////////////////////////////////////////////////////////
  ///
  ///
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }
}
