import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/config/uidata.dart';

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
                listTap: _.listTap);
        // Container(
        //     child: ListView.builder(
        //       itemCount: _.docList.length,
        //       itemBuilder: (BuildContext context, int i) {
        //         // return SizedBox();
        //         // FileSystemEntity? file = object.data;
        //         FileSystemEntity? file = _.docList[i];
        //         return Container(
        //           color: Colors.grey[300],
        //           child: ListTile(
        //             leading: Icon(
        //               Icons.insert_drive_file_outlined,
        //               color: UIDataColors.commonColor,
        //               size: 48,
        //             ),
        //             onTap: () {
        //               _.listTap(i);
        //             },
        //             title: Text(
        //               _.getFileName(file.path),
        //               style: TextStyle(
        //                 fontSize: 18,
        //               ),
        //             ),
        //             subtitle: Text(
        //               _.getMimeType(file.path),
        //               style: TextStyle(fontSize: 12),
        //             ),
        //             trailing: IconButton(
        //                 onPressed: () {},
        //                 icon: Icon(
        //                   Icons.done,
        //                   color: UIDataColors.commonColor,
        //                 )),
        //           ),
        //         ).paddingOnly(top: Get.height * 0.02);
        //       },
        //     ).paddingOnly(
        //       left: 20,
        //       right: 20,
        //     ),
        //   );
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
      appTitle: 'Upload All Required Docs',
    );
  }
}
