import 'package:docapp/src/controllers/lists_controller.dart';
import 'package:docapp/src/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../widgets/common_scaffold.dart';
import '../widgets/lists/listcard.dart';

//Dynamic list
class ListsPage extends StatelessWidget {
  final String docType = Get.arguments['docType'];

  Widget bodyData() {
    return GetBuilder<ListsController>(
      builder: (_) {
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
////not only project its selecting the mode: i.e project, tasks , docs, customers and changing list accordingly

                          return Listcard(
                            title: "${_.allPro[i]["name"]}",
                            subtitle: _.getSubTitle(_.docType, i),
                            belowSubtitle: " ${_.getBelowSub(_.docType, i)}",
                            rTitle: _.getRTitle(_.docType, i),
                            rSubtitle: "${_.allPro[i]["status"] ?? ""}",
                            belowRSubtitle: "${_.getbelowRSub(_.docType, i)}",
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
