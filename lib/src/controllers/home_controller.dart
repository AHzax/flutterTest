
import 'package:get/get.dart';

import '../services/restclient.dart';

class HomeController extends GetxController {
  bool isLoading = true;

  RestClient restClient = Get.find<RestClient>();
  dynamic res;
  // Map allPro = {};
  Map data = {};

  // Map projects = {};

  // String? OwnerName;
  // String? Time;

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
    await getUser();
    // await getAllProject();
    // await getProject();

    isLoading = false;
    super.onReady();
  }

  Future<void> getUser() async {
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

  // Future<void> getAllProject() async {
  //   try {
  //     res = await restClient.sendRequest('/resource/Project',
  //         type: RequestType.get);
  //     allPro.addAll(res);
  //     update();
  //     print("Check Data allProoooooooooo;${allPro.toString()}");
  //   } catch (e, s) {
  //     print("Error is allProoooooooooo: ${e}");
  //     print("Error is stack allProoooooooooo: ${s}");
  //   }
  // }

  // Future<void> getProject() async {
  //   try {
  //     res = await restClient.sendRequest('/resource/Project/PROJ-0001',
  //         type: RequestType.get);
  //     projects.addAll(res);
  //     spliting();
  //     update();
  //     print("Check Data projects;${projects.toString()}");
  //   } catch (e, s) {
  //     print("Error is: ${e}");
  //     print("Error is stack: ${s}");
  //   }
  // }

  // void spliting() {
  //   String owner = projects["data"]["owner"];
  //   dynamic ownerName = owner.split("@");
  //   OwnerName = ownerName[0];
  //   String time = projects["data"]["to_time"];
  //   dynamic splitTime = time.split(".");
  //   print("spliting splitingspliting spliting${splitTime[0]}");
  //   Time = splitTime[0];
  // }

  //${_.projects["data"]["owner"]}
  //projects["data"]["to_time"]}
}
