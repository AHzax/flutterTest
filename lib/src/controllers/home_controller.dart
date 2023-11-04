import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../models/createTask.dart';
import '../models/error.dart';
import '../services/restclient.dart';
import '../utils/helpers/frappeHelpers.dart';
import '../utils/routes/app_routes.dart';

class HomeController extends GetxController {
  bool isLoading = true;
  final FrappeHelper frappeHelper = FrappeHelper();
  List<Task>? task = [];
  int? projCount;
  int? taskCount;
  int? docCount;
  List<File> files = [];

  int? customerCount;

  RestClient restClient = Get.find<RestClient>();
  dynamic res;
  Map data = {};

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await getUser();
    await getTaskData();
    await getProjCount();
    await getDocCount();
    await getCustomerCount();
    await getTaskCount();

    isLoading = false;
    super.onReady();
  }

  Future<void> openAndLoadFiles() async {
    var status = await Permission.photos.request();
    if (status.isGranted) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.any,
      );

      List<File> pickedFiles =
          result!.paths.map((path) => File(path!)).toList();
      files = pickedFiles;
      update();
      Get.toNamed(Routes.FilesRoute);

      print("%%%%%%%%%%%%%%object$files");
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
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

  Future<void> getTaskData() async {
    await frappeHelper.getItem(
      doctype: "Task",
      fields: '["subject","exp_end_date","type","status","project","priority"]',
      filters: [
        ["Task", "status", "in", "Open"],
      ],
    );

// asd
    frappeHelper.response.forEach((e) {
      print('hahahahahha${e['subject']}');
      task!.add(Task.fromJson({
        'subject': e['subject'],
        "type": e['type'],
        "status": e['status'],
        "project": e['project'],
        "priority": e["priority"],
        "exp_end_date": e["exp_end_date"],
      }));
    });
    print("###############################$task");
    update();
  }

  Future<void> getProjCount() async {
    try {
      Map<String, dynamic> params = {
        "doctype": "Project",
      };
      dynamic resItems = await restClient.sendRequest(
          '/method/frappe.desk.reportview.get_count',
          type: RequestType.post,
          data: params);
      print("%%%%%%%%%%%%%${resItems}");
      projCount = resItems['message'] ?? 0 ?? 0;
    } on ErrorResponse catch (e) {
      print(e.statusMessage);
    } catch (e, s) {
      print("error $e");
      print("stack $s");
    }
    isLoading = false;
    update();
  }

  Future<void> getTaskCount() async {
    try {
      Map<String, dynamic> params = {
        "doctype": "Task",
      };
      dynamic resItems = await restClient.sendRequest(
          '/method/frappe.desk.reportview.get_count',
          type: RequestType.post,
          data: params);
      print("%%%%%%%%%%%%%${resItems}");
      taskCount = resItems['message'] ?? 0;
    } on ErrorResponse catch (e) {
      print(e.statusMessage);
    } catch (e, s) {
      print("error $e");
      print("stack $s");
    }
    isLoading = false;
    update();
  }

  Future<void> getDocCount() async {
    try {
      Map<String, dynamic> params = {
        "doctype": "Document",
      };
      dynamic resItems = await restClient.sendRequest(
          '/method/frappe.desk.reportview.get_count',
          type: RequestType.post,
          data: params);
      print("%%%%%%%%%%%%%${resItems}");
      docCount = resItems['message'] ?? 0;
    } on ErrorResponse catch (e) {
      print(e.statusMessage);
    } catch (e, s) {
      print("error $e");
      print("stack $s");
    }
    isLoading = false;
    update();
  }

  Future<void> getCustomerCount() async {
    try {
      Map<String, dynamic> params = {
        "doctype": "Customer",
        // "fields":
        //     '["project_name","expected_start_date","expected_end_date","project_type","department","status","owner"]',
        // "filters": '[["Task", "status", "in", "Completed"]]',
        // "order_by": " modified DESC",
        // "start": 0,
        // "page_length": 20,
        // "view": "List",
        // "group_by": "name",
        // "with_comment_count": true,
      };
      dynamic resItems = await restClient.sendRequest(
          '/method/frappe.desk.reportview.get_count',
          type: RequestType.post,
          data: params);
      print("%%%%%%%%%%%%%${resItems}");
      customerCount = resItems['message'] ?? 0;
    } on ErrorResponse catch (e) {
      print(e.statusMessage);
    } catch (e, s) {
      print("error $e");
      print("stack $s");
    }
    isLoading = false;
    update();
  }
}
