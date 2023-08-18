// flutter imports
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:docapp/src/controllers/lists_controller.dart';
import 'package:docapp/src/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

// package imports
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../../utils/config/uidata.dart';
import '../widgets/card.dart';
import '../widgets/common_scaffold.dart';
import '../widgets/lists/listcard.dart';
import '../widgets/logoWidget.dart';
import '../widgets/tab/ReusableTabWithFilterList.dart';

// utils

// services

// import '../../../../utils/config/uidata.dart';
// import '../../../widgets/common_scaffold.dart';
// import '../controller/home_controller.dart';
// import '../../../widgets/lists/listcard.dart';

// widgets

//Dynamic list
class ListsPage extends StatelessWidget {
  String docType = Get.arguments['docType'];

  Widget bodyData() {
    return GetBuilder<ListsController>(
      builder: (_) {
        // String name = _.docType;
        return SafeArea(
          child: _.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _.allPro.length,
                        itemBuilder: (c, i) {
                          return Listcard(
                            title: "${_.allPro[i]["name"]}",
                            //not only project its selecting the mode: i.e project, tasks , docs, customers and changing list accordingly
                            subtitle: _.getSubTitle(_.docType, i),
                            time: '',
                            owner: "Owner: ${_.getOwner(_.docType, i)}",
                            type: "type: ${_.getType(_.docType, i)}",
                            date: "${_.allPro[i]["expected_end_date"] ?? ''}",
                          );
                        },
                      ).marginOnly(left: 15, right: 15),
                    ],
                  ),
                ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      bodyData: bodyData(),
      showDrawer: true,
      enableHeader: false,
      headerName: false,
      showFAB: true,
      qrCallback: () {
        if (docType.toString() == "project") {
          Get.toNamed(Routes.CreateProjectRoute);
        } else if (docType.toString() == "task") {
          Get.toNamed(Routes.CreatetTaskRoute);
        } else if (docType.toString() == "Documents") {
          Get.toNamed(Routes.CreateDocumentsRoute);
        } else if (docType.toString() == "customer") {
          Get.toNamed(Routes.CreateCustomerRoute);
        }
      },
      // floatingIcon: Icons.add,
      showAppBar: true,
      showBottomNav: true,
      appTitle: "Lists",

      actionFirstIcon: Icons.control_point_duplicate_sharp,
    );
  }
}
