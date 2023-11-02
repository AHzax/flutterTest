// import 'package:docapp/src/ui/widgets/buttons/raised_button.dart';
import 'dart:io';

import 'package:docapp/src/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../controllers/NewDocumentController.dart';
import '../widgets/common_scaffold.dart';
import '../widgets/forms/textfields/text_field.dart';

class NewDocument extends StatelessWidget {
  Widget bodyData() {
    return GetBuilder<NewDocumentController>(builder: (_) {
      return SafeArea(
          minimum: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonTextField(
                  controller: _.title,
                  hintText: "Title",
                  labelText: "Title",
                  prefix: const Icon(
                    Icons.edit,
                    size: 17,
                  ),
                  // isTextHidden :true,
                ).marginOnly(top: 20),
                SizedBox(
                  height: Get.height * .04,
                ),
                Text(
                  "Add New Document",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: Get.height * .04,
                ),
                Center(
                  child: Builder(
                    builder: (context) => InkWell(
                      onTap: () async {
                        Get.toNamed(Routes.addImages);
                        // _.openPdfScanner(context);
                      },
                      child: Container(
                        height: Get.height / 2,
                        width: Get.width / 1.2,
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(20)),
                        child: _.pdfImage != null
                            ? SfPdfViewer.file(File(_.pathPdf))
                            : Center(
                                child: Icon(
                                  Icons.insert_drive_file_outlined,
                                  color: Colors.white,
                                  size: Get.height / 3,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * .04,
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color:
                          _.pdfImage != null ? Colors.green : Colors.grey[400],
                      borderRadius: BorderRadius.circular(100)),
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      if (_.title.text.isNotEmpty && _.pdfImage != null) {
                        // Get.toNamed(Routes.uploadedPage)
                        _.writepdf(File(_.pathPdf));
                            Get.toNamed(Routes.docListPage);

                        Get.snackbar(
                          'Success!',
                          'File Saved Successfully',
                          duration: Duration(seconds: 2),
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      } else {
                        Get.snackbar(
                          'Enter Complete Data',
                          'Some data is missing!',
                          duration: Duration(seconds: 2),
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ));
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
      appTitle: 'New Document',
    );
  }
}
