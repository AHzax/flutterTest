import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../models/createCustomer.dart';
import '../models/error.dart';
import '../services/restclient.dart';
import 'home_controller.dart';
import 'lists_controller.dart';

class CreateCustomerController extends GetxController {
  RestClient restClient = Get.find<RestClient>();
  ListsController list = Get.find<ListsController>();
  HomeController homeController = Get.find<HomeController>();

  // Rx<DateTime> selectedDate1 = DateTime.now().obs;
  // Rx<DateTime> selectedDate2 = DateTime.now().obs;
  TextEditingController nameController = TextEditingController();

  dynamic groupValue;
  dynamic priceListValue;
  dynamic territoryValue;
  dynamic typeValue;

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

  void submitForm() async {
    // DateTime EndDate = endDate.value;
    // String expected_end_date =
    //     DateFormat('dd-MM-YYYY hh:ii:ss').format(EndDate);
    try {
      Customer customer = Customer(
        name: nameController.text,
        type: typeValue,
        group: groupValue,
        territory: territoryValue,
      );
      var res = await restClient.sendRequest(
        '/resource/Customer',
        data: customer.toJson(),
        type: RequestType.post,
      );
      await list.getAllProject();
      await list.getCustomerData();
      print('---- ${"hahahahahahahah ${typeValue}"}');
    } catch (e) {
      e as ErrorResponse;
      print("ERRRRRRRRRRRRROOORRR${e.statusMessage}");
      ////////////////////////////////
      nameController.clear();
    }
    homeController.getCustomerCount();
    homeController.getDocCount();
    homeController.getTaskCount();
    homeController.getProjCount();
  }

  //project
}
