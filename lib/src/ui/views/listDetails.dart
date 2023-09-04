import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controllers/listDetail_controller.dart';
import '../widgets/common_scaffold.dart';

//Dynamic list
class ListsDetailPage extends StatelessWidget {
  // final String docType = Get.arguments['docType'];

  Widget bodyData() {

    return GetBuilder<ListDetailController>(
      builder: (_) {
        return SafeArea(
          child: _.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [Text("OWNER: ${_.allPro["owner"]}")],
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
      showFAB: false,
      showAppBar: true,
      showBottomNav: true,
      appTitle: "Detail",
    );
  }
}
