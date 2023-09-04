import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/NewDocumentController.dart';
import '../widgets/common_scaffold.dart';
import '../widgets/docList.dart';

class DocListPage extends StatelessWidget {
  Widget bodyData() {
    return GetBuilder<NewDocumentController>(
      builder: (_) {
        return _.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : CustomDoclistWidget(
                docList: _.docList,
                getFileName: _.getFileName,
                getMimeType: _.getMimeType,
                listTap: _.listTap,
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
      showBottomNav: false,
      appTitle: 'Scanned Docs',
    );
  }
}
