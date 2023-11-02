import 'dart:io';

import 'package:docapp/src/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/common_scaffold.dart';

class ShowFilesPage extends StatelessWidget {
  Widget bodyData() {
    return GetBuilder<HomeController>(builder: (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _.files.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Image.file(File(_.files[index].path)),
                );
              },
            ),
          ),
        ],
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
      appTitle: 'Files Viewer',
    );
  }
}
