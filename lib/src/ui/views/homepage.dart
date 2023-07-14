// flutter imports
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

// utils

// services

// import '../../../../utils/config/uidata.dart';
// import '../../../widgets/common_scaffold.dart';
// import '../controller/home_controller.dart';
// import '../../../widgets/lists/listcard.dart';

// widgets

//Dynamic list

class HomePage extends StatelessWidget {
  Widget bodyData() {
    return GetBuilder<HomeController>(
      builder: (_) {
        return SafeArea(
          child: _.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: Get.height / 5,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: UIDataColors.bgColor,
                          border: Border.all(color: UIDataColors.bgColor),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(3),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('12'),
                            const Text('In Progres \nProject'),
                          ],
                        ).paddingAll(20),
                      ).marginOnly(left: 15, right: 15),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.signatureRoute );
                        },
                        child: Container(
                          color: Colors.grey.shade100,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                CustomCard(
                                  statusText: "stats",
                                  // ${_.data['data'][0]['name']}
                                  valueText: '12',
                                  icon: const Icon(
                                      Icons.document_scanner_outlined,
                                      color: Colors.white),
                                  color: UIDataColors.commonColor,
                                ).paddingOnly(left: 15),
                                const CustomCard(
                                  statusText: 'In Progres \nProject',
                                  valueText: '12',
                                  icon: Icon(Icons.document_scanner_outlined,
                                      color: Colors.white),
                                  color: UIDataColors.appCardSecondary,
                                ),
                                CustomCard(
                                  statusText: 'In Progres \nProject',
                                  valueText: '12',
                                  icon: const Icon(
                                      Icons.document_scanner_outlined,
                                      color: Colors.white),
                                  color: UIDataColors.commonColor,
                                ),
                                const CustomCard(
                                  statusText: 'In Progres \nProject',
                                  valueText: '12',
                                  icon: Icon(Icons.document_scanner_outlined,
                                      color: Colors.white),
                                  color: UIDataColors.appCardSecondary,
                                ),
                              ],
                            ),
                          ).paddingOnly(
                            top: 20,
                            bottom: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          const Text(
                            "All Documents",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () => {Get.toNamed(Routes.docListPage)},
                            child: SizedBox(
                                height: 30,
                                width: 30,
                                child: Icon(
                                  Icons.arrow_circle_right,
                                  color: UIDataColors.kBlueButtonColor,
                                  size: 30,
                                )),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.docListPage);
                            },
                            child: Text(
                              "Go to Documents",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ).marginOnly(right: 20),
                        ],
                      ).paddingAll(20),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (c, i) {
                          return const Listcard(
                            title: 'Title',
                            subtitle: 'subtitle',
                            time: '14 Jan, 2023',
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
      showFAB: false,
      showAppBar: true,
      showBottomNav: true,
      appTitle: 'Home',
      actionFirstIconCallBack: () {
        Get.toNamed(Routes.newDocument);
      },
      actionFirstIcon: Icons.control_point_duplicate_sharp,
    );
  }
}
