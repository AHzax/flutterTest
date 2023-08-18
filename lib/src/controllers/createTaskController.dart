
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';



class CreateTaskController extends GetxController {


   Rx<DateTime> selectedDate1 = DateTime.now().obs;
  Rx<DateTime> selectedDate2 = DateTime.now().obs;

  void openDatePicker(int fieldNumber) {
    DateTime initialDate =
        fieldNumber == 1 ? selectedDate1.value : selectedDate2.value;

    showModalBottomSheet(
      context: Get.context!,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: initialDate,
            minimumYear: 2000,
            maximumYear: 2101,
            onDateTimeChanged: (DateTime newDate) {
              if (fieldNumber == 1) {
                selectedDate1.value = newDate;
              } else {
                selectedDate2.value = newDate;
              }
            },
          ),
        );
      },
    );
  }

 //project
  TextEditingController NameController = TextEditingController();
  TextEditingController OwnerController = TextEditingController();
  TextEditingController TypeController = TextEditingController();
  TextEditingController DepartmentController = TextEditingController();

  //tasks
   TextEditingController controller = TextEditingController();
}
