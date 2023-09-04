import 'package:get/get.dart';

import '../services/restclient.dart';

class ListDetailController extends GetxController {
  bool isLoading = true;

  String subtitle = Get.arguments["subtitle"];
  String doctype = Get.arguments["case"];
  RestClient restClient = Get.find<RestClient>();
  dynamic res;
  Map allPro = {};

  @override
  Future<void> onInit() async {
    print(doctype);
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await getDetail();
    isLoading = false;
    super.onReady();
  }

  Future<void> getDetail() async {
    try {
      String path;
      switch (doctype) {
        case 'project':
          path = '/resource/Project/$subtitle';
          break;
        case 'task':
          path = '/resource/Task/';
          break;
        case 'customer':
          path = '/resource/Customer';
          break;

        default:
          path = '/resource/Project/$subtitle';
          break;
      }

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
}
