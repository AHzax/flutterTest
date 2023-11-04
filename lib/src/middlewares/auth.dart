import 'package:docapp/src/services/auth.dart';
import 'package:docapp/src/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  final Priority = 0;
  @override
  RouteSettings? redirect(String? route) {
    final authService = Get.find<AuthService>();
   return authService.loggedInUser != null
        ? null
        : RouteSettings(name: Routes.loginRoute);
  }
}
