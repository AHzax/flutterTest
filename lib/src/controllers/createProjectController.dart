import 'package:dio/dio.dart';
import 'package:docapp/src/models/lists.dart';
import 'package:docapp/src/utils/config/config.dart';
import 'package:docapp/src/utils/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/createProj.dart';
import '../models/error.dart';
import '../services/restclient.dart';
import 'lists_controller.dart';

class CreateProjectController extends GetxController {
  RestClient restClient = Get.find<RestClient>();
  ListsController list = Get.find<ListsController>();

//controller

  Rx<DateTime> startDate = DateTime.now().obs;
  Rx<DateTime> endDate = DateTime.now().obs;
  DateTime selectedDate = DateTime.now();

  dynamic deparmentValue;
  dynamic typeValue;
  dynamic statusValue;
  dynamic priorityValue;

  //project
  TextEditingController NameController = TextEditingController();
  TextEditingController OwnerController = TextEditingController();
  TextEditingController TypeController = TextEditingController();
  TextEditingController DepartmentController = TextEditingController();

  // var projectName = ''.obs;
  // var projectType = ''.obs;
  // var projectDepartment = ''.obs;
  // final project = Project(
  //   name: 'John Doe8',
  //   type: 'Full-time',
  //   // owner: 'Software Engineer',
  //   department: 'Marketing',
  // );

//ios datepicker
  // void openDatePicker(int fieldNumber) {
  //   DateTime initialDate =
  //       fieldNumber == 1 ? selectedDate1.value : selectedDate2.value;

  //   showModalBottomSheet(
  //     context: Get.context!,
  //     builder: (BuildContext context) {
  //       return SizedBox(
  //         height: 200,
  //         child: CupertinoDatePicker(
  //           mode: CupertinoDatePickerMode.date,
  //           initialDateTime: initialDate,
  //           minimumYear: 2000,
  //           maximumYear: 2101,
  //           onDateTimeChanged: (DateTime newDate) {
  //             if (fieldNumber == 1) {
  //               selectedDate1.value = newDate;
  //             } else {
  //               selectedDate2.value = newDate;
  //             }
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }

  // void myfun() {
  //   Project project = Project(
  //   name: NameController.text,
  //   type: "dfdf",
  //   // owner: 'Software Engineer',
  //   department: "Marketing",
  // );
  // }

  Future<void> openDatePicker(int fieldNumber, BuildContext context) async {
    DateTime initialDate = fieldNumber == 1 ? startDate.value : endDate.value;

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      if (fieldNumber == 1) {
        startDate.value = picked;
      } else {
        endDate.value = picked;
      }
      update();
    }
  }

  void submitForm() async {
    // DateTime EndDate = endDate.value;
    // String expected_end_date =
    //     DateFormat('dd-MM-YYYY hh:ii:ss').format(EndDate);
    try {
      Project project = Project(
        name: NameController.text,
        type: typeValue,
        priority: priorityValue,
        status: statusValue,
        endDate: endDate.value,
        startDate: startDate.value,
        department: deparmentValue,
      );
      var res = await restClient.sendRequest(
        '/resource/Project',
        data: project.toApiJson(),
        type: RequestType.post,
      );
      print('---- ${"hahahahahahahah ${deparmentValue}"}');
    } catch (e) {
      e as ErrorResponse;
      print("ERRRRRRRRRRRRROOORRR${e.statusMessage}");
      ////////////////////////////////
      NameController.clear();
      TypeController.clear();
      DepartmentController.clear();
      OwnerController.clear();
    }
  }

  //   Future<bool> login(String username, String password) async {
  //   LoginRequest req = LoginRequest.fromJson({
  //     "usr": username,
  //     "pwd": password,
  //     "device": "mobile",
  //   });
  // try {
  //   LoginResponse res = await restClient.login(req);

  //   if (res.userId != null) {
  //     loggedInUser = res.userId;
  //     print('---- $loggedInUser');
  //     await prefs.setString("loggedInUser", loggedInUser!);

  //     return true;
  //   }
  // } catch (e) {
  //   e as ErrorResponse;
  //   print("ERRRRRRRRRRRRROOORRR${e.statusMessage}");
  // }

  //   loggedInUser = null;
  //   return false;
  // }
}
