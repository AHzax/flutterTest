import 'package:flutter/material.dart';

import 'package:get/get.dart';

// import '../models/createProj.dart';
import '../models/createTask.dart';
import '../models/error.dart';
// import '../models/getProj.dart';
import '../services/restclient.dart';
import 'lists_controller.dart';

class CreateTaskController extends GetxController {
  RestClient restClient = Get.find<RestClient>();
  ListsController list = Get.find<ListsController>();

  List<String> projectNames = [];

  List<Map<String, dynamic>> allPro = [];

  Rx<DateTime> startDate = DateTime.now().obs;
  Rx<DateTime> endDate = DateTime.now().obs;
  DateTime selectedDate = DateTime.now();

  // dynamic typeValue;
  dynamic statusValue;
  dynamic priorityValue;
  dynamic projValue;

  //project
  TextEditingController subjectController = TextEditingController();
  TextEditingController TypeController = TextEditingController();
  TextEditingController projectController = TextEditingController();
  void onReady() async {
    await getProj();
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() async {
    //  await getProj();
    // TODO: implement onInit
    super.onInit();
  }

  getProj() async {
    var res = await restClient.sendRequest("/resource/Project",
        type: RequestType.get);
    if (res["data"] != null) {
      if (res["data"].length > 0) {
       List<String> projectNames =
            res["data"].map((project) => project['name'] as String).toList();
        return projectNames;
        // List<dynamic> names = item!.map((item) => item).toList();
      }
    }
    print("##################::::::${allPro}");
  }

  // Future<void> openDatePicker(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2101),
  //   );

  //   selectedDate = picked!;
  //   update();
  // }

//ios datePicker
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
      Task task = Task(
        subject: subjectController.text,
        type: TypeController.text,
        priority: priorityValue,
        status: statusValue,
        endDate: endDate.value,
        startDate: startDate.value,
        // project: ,
      );
      var res = await restClient.sendRequest(
        '/resource/Task',
        data: task.toApiJson(),
        type: RequestType.post,
      );
      await list.getAllProject();
      print('---- ${"hahahahahahahah ${subjectController}"}');
    } catch (e) {
      e as ErrorResponse;
      print("ERRRRRRRRRRRRROOORRR${e.statusMessage}");
      ////////////////////////////////
    }
  }

  //project
}
