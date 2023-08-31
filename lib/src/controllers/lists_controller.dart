
import 'package:get/get.dart';

import '../services/restclient.dart';

class ListsController extends GetxController {
  String docType = Get.arguments['docType'];


  bool isLoading = true;
  RestClient restClient = Get.find<RestClient>();
  dynamic res;
  List allPro = [];
  Map data = {};

  Map projects = {};
  String? owner;
  String? ownerName;
  String? time;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    // await getUser();
    await getAllProject();
    //  owner = allPro["data"]["owner"];
    // await getProject();

    isLoading = false;
    super.onReady();
  }

  // Future<void> getUser() async {
  //   try {
  //     res =
  //         await restClient.sendRequest('/resource/User', type: RequestType.get);
  //     data.addAll(res);

  //     update();
  //     print("Check Data ${res}");
  //   } catch (e) {
  //     print("Error is: ${e.toString()}");
  //   }
  // }

  Future<void> getAllProject() async {
    try {
      String path;
      switch (docType) {
        case 'project':
          path = '/method/$docType';
          break;
        case 'task':
          path = '/method/$docType';
          break;
        case 'customer':
          path = '/method/$docType';
          break;

        default:
          path = '/resource/$docType';
          break;
      }

      allPro = [];
      res = await restClient.sendRequest(path, type: RequestType.get);
      if (res["data"] != null) {
        if (res["data"].length > 0) {
          allPro = res["data"];
        }
      }

      update();
      print("Check Data allProoooooooooo;${allPro.toString()}");
    } catch (e, s) {
      print("Error is allProoooooooooo: ${e}");
      print("Error is stack allProoooooooooo: ${s}");
    }
  }

  String getSubTitle(String d, int i) {
    String subtitle = '';
    switch (d) {
      case 'project':
        subtitle = "${allPro[i]["department"] ?? ''}";
        break;
      case 'customer':
        subtitle = "${allPro[i]["territory"] ?? ''}";

        break;
      case 'task':
        subtitle = "Priority: ${allPro[i]["priority"] ?? ''}";

        break;
    }
    return subtitle;
  }

  String getRTitle(String d, int i) {
    String rTitle = '';
    switch (d) {
      case 'project':
        rTitle = "${allPro[i]["expected_end_date"] ?? ""}";
        break;
      case 'customer':
        rTitle = "Lead: ${allPro[i][""] ?? ''}";

        break;
      case 'task':
        rTitle = "${allPro[i][""] ?? ''}";

        break;
    }
    return rTitle;
  }

  String getbelowRSub(String d, int i) {
    String type = '';
    switch (d) {
      case 'project':
        if (type.length > 11) {
          type = type.substring(0, 9);
        } else {
          type = "type: ${allPro[i]["project_type"] ?? ''}";
        }
        // type.toString() == "Human Resources" ? type = "HR" : null;
        break;
      case 'customer':
        type = "type: ${allPro[i]["customer_group"] ?? ''}";

        break;
      case 'task':
        type = '';

        break;
    }
    return type;
  }

  String getBelowSub(String d, int i) {
    String bSub = '';
    switch (d) {
      case 'project':
        bSub = "${allPro[i]["owner"] ?? ""}";
        // type.toString() == "Human Resources" ? type = "HR" : null;
        break;
      case 'customer':
        bSub = "Type: ${allPro[i]["customer_group"] ?? ""}";

        ///different in postman vs frappe!!!

        break;
      case 'task':
        bSub = "${allPro[i]["project"] ?? ""}";

        break;
      default:
        bSub = "${allPro[i]["owner"] ?? ""}";
        break;
    }
    return bSub;
  }

}
