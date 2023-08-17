import 'dart:io';

import 'package:docapp/src/controllers/createProjectController.dart';
import 'package:docapp/src/ui/widgets/forms/textfields/text_field.dart';
import 'package:docapp/src/ui/widgets/forms/textfields/textformfield_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/config/uidata.dart';

import '../../controllers/NewDocumentController.dart';
import '../widgets/common_scaffold.dart';
import '../widgets/docList.dart';

class CreateProjectPage extends StatelessWidget {
  Widget bodyData() {
    return GetBuilder<CreateProjectController>(builder: (_) {
      return SafeArea(
        minimum: EdgeInsets.only(right: 20, left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormFieldContainer(
              hintText: "Project Name",
              controllerText: _.controller,
              labelText: "Project Name",
            ),
            SizedBox(
              height: 15,
            ),
            TextFormFieldContainer(
              hintText: "Project Name",
              controllerText: _.controller,
              labelText: "Project Name",
            ),
            SizedBox(
              height: 15,
            ),
            TextFormFieldContainer(
              hintText: "Project Name",
              controllerText: _.controller,
              labelText: "Project Name",
            ),
            SizedBox(
              height: 15,
            ),
            TextFormFieldContainer(
              hintText: "Project Name",
              controllerText: _.controller,
              labelText: "Project Name",
            ),
            SizedBox(
              height: 15,
            ),
            TextFormFieldContainer(
              hintText: "Project Name",
              controllerText: _.controller,
              labelText: "Project Name",
            ),
            SizedBox(
              height: 15,
            ),
          ],
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
      showBottomNav: false,
      appTitle: 'Create Project',
    );
  }
}
