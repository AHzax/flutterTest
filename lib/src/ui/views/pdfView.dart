import 'dart:io';

import 'package:docapp/src/controllers/NewDocumentController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../widgets/common_scaffold.dart';

class PdfViewPage extends StatelessWidget {
  Widget bodyData() {
    return GetBuilder<NewDocumentController>(builder: (_) {
      return SafeArea(
        minimum: const EdgeInsets.only(left: 20, right: 20),
        child: SizedBox(
          height: 300,
          width: 300,
          child: SfPdfViewer.file(File(_.file!)),
        ),
      );
    });
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
      appTitle: 'Document Viewer',
    );
  }
}
