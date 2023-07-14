import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../services/restclient.dart';

class HomeController extends GetxController {
  bool isLoading = true;

  RestClient restClient = Get.find<RestClient>();
  dynamic res;
  Map data = {};

  //   Future<void> fetchData() async {
  //   final String apiUrl =
  //       'http://docapp.sofodynamix.com/api/resource/ahzax'; // Replace with your API endpoint

  //   try {
  //     final response = await Dio().get(apiUrl);

  //     // Handle the response data
  //     if (response.statusCode == 200) {
  //       // Request successful
  //       final responseData = response.data;
  //       // Process the responseData as needed
  //       print(responseData);
  //     } else {
  //       // Request failed
  //       print('Request failed with status: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     // Error occurred during request
  //     print('Error: $error');
  //   }
  // }

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await getData();
    isLoading = false;
    super.onReady();
  }

  Future<void> getData() async {
    try {
      res =
          await restClient.sendRequest('/resource/User', type: RequestType.get);
      data.addAll(res);
      update();
      print("Check Data ${res}");
    } catch (e) {
      print("Error is: ${e.toString()}");
    }
  }
}
