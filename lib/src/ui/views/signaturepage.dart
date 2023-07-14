import 'dart:io';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../controllers/NewDocumentController.dart';
import '../../controllers/signaturepagecontroller.dart';
import '../../utils/routes/app_routes.dart';
import '../widgets/common_scaffold.dart';
import '../widgets/forms/textfields/text_field.dart';

class SignaturePage extends StatelessWidget {
  Widget bodyData() {
    return GetBuilder<SignaturePageController>(builder: (_) {
      return SafeArea(
          minimum: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                              // _.openPdfScanner(context);
                            },
                            child: Column(
                              children: [
                                Card(
                                  elevation: 5.0,
                                  child: Signature(
                                    controller: _.controller,
                                    width: 350,
                                    height: 200,
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      _.controller.clear();

                                      _.exportedSign!.clear();
                                    },
                                    child: Text("Change")),
                                // if (_.exportedSign != null)
                                // Image.memory(_.exportedSign!),
                              ],
                            ),
                          )),
                ),
                SizedBox(
                  height: Get.height * .04,
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      // _.scannedDocumentFile != null
                      //     ? Colors.green
                      //     : Colors.grey[400],
                      borderRadius: BorderRadius.circular(100)),
                  child: IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.arrow_forward),
                      onPressed: () async {
                        _.exportedSign = await _.controller.toPngBytes();
                        _.update();
                        Get.toNamed(Routes.homeRoute);
                      }
                      // () {
                      //   if (_.title.text.isNotEmpty &&
                      //       _.scannedDocumentFile != null) {
                      //     // Get.toNamed(Routes.uploadedPage)
                      //     // _.writepdf(_.scannedDocumentFile);
                      //     Get.snackbar(
                      //       'Succussfull!',
                      //       'Data Upload Successfully',
                      //       duration: Duration(seconds: 2),
                      //     );
                      //   } else {
                      //     Get.snackbar(
                      //       'Enter Complete Data',
                      //       'Some data is missing!',
                      //       duration: Duration(seconds: 2),
                      //     );
                      //   }
                      // },
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
      showDrawer: false,
      enableHeader: false,
      headerName: false,
      showFAB: false,
      showAppBar: true,
      showBottomNav: false,
      appTitle: 'New Document',
    );
  }
}
