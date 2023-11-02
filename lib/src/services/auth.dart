import 'dart:io';

import 'package:docapp/src/models/error.dart';
import 'package:docapp/src/models/login.dart';
import 'package:docapp/src/models/register.dart';
import 'package:docapp/src/services/restclient.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/routes/app_routes.dart';

class AuthService extends GetxService {
  String? myloggedInStatus;
  RestClient restClient = Get.find<RestClient>();
  String? loggedInUser;
  late SharedPreferences prefs;

  Future<AuthService> init() async {
    prefs = await SharedPreferences.getInstance();
    isLoggedIn();
    return this;
  }

  Future<bool> login(String username, String password) async {
    LoginRequest req = LoginRequest.fromJson({
      "usr": username,
      "pwd": password,
      "device": "mobile",
    });
    try {
      LoginResponse res = await restClient.login(req);

      if (res.userId != null) {
        loggedInUser = res.userId;
        print('---- $loggedInUser');
        await prefs.setString("loggedInUser", loggedInUser!);

        return true;
      }
    } catch (e) {
      e as ErrorResponse;
      print("ERRRRRRRRRRRRROOORRR${e.statusMessage}");
    }

    loggedInUser = null;
    return false;
  }

  bool isLoggedIn() {
    String? loggedInStatus = prefs.getString('loggedInUser');
    print("##################################3: ${loggedInStatus}");

    myloggedInStatus = loggedInStatus;
    return myloggedInStatus != null;
  }

  void logout() {
    prefs.clear();
    Get.offAllNamed(Routes.loginRoute);
  }

  //////////////////////////////////////////////////

  Future<bool> register(
      String firstName, String lastName, String email, String password) async {
    final response = await restClient.sendRequest(
      '/method/signup',
      data: {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
      },
      type: RequestType.post,
    );

    return true;
  }

  // Future<void> signup() async {}

  Future<void> forgotPassword() async {}

  Future<void> do2FA() async {}

  Future<dynamic> getLoggedUser() async {}
}
