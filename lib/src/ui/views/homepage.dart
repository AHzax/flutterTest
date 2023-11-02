// flutter imports
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
import '../widgets/logoWidget.dart';
import '../widgets/tab/ReusableTabWithFilterList.dart';

// utils

// services

// import '../../../../utils/config/uidata.dart';
// import '../../../widgets/common_scaffold.dart';
// import '../controller/home_controller.dart';
// import '../../../widgets/lists/listcard.dart';

// widgets

//Dynamic list

class HomePage extends StatelessWidget {
  // GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Widget bodyData() {
    return GetBuilder<HomeController>(
      builder: (_) {
        return _.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Container(
                    height: Get.height / 1.275,
                    child: ReusableTabWithFilterList(
                      tabLength: 2,
                      tabs: [
                        Tab(
                          child: Text(
                            "Personal",
                            style: TextStyle(
                                // color: UIDataColors.whiteColor,
                                fontSize: 15),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Business",
                            style: TextStyle(
                              // color: UIDataColors.whiteColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                      tabBarView: [
                        /////////////////////////////tab1///////////////////////////

                        SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: Get.height / 40,
                              ),
                              Container(
                                height: Get.height / 4.2,
                                width: Get.width / 1.11,
                                decoration: ShapeDecoration(
                                  color: Colors.black38,
                                  image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/Group 94.jpg',
                                      ),
                                      fit: BoxFit.cover),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  // color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                height: Get.height / 40,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LogoCard(
                                    onPressed: () {

                                      _.openAndLoadFiles();
                                    },
                                    imagePath:
                                        "assets/images/file-storage 1.png",
                                    CardText: "File Storage",
                                  ),
                                  LogoCard(
                                    onPressed: () {
                                      // Get.toNamed(Routes.signatureRoute);
                                    },
                                    imagePath: "assets/images/drive 1.png",
                                    CardText: "Google Drive",
                                  ),
                                  LogoCard(
                                    onPressed: () {
                                      // Get.toNamed(Routes.signatureRoute);
                                    },
                                    imagePath: "assets/images/dropbox 1.png",
                                    CardText: "DropBox",
                                  ),
                                  LogoCard(
                                    onPressed: () {
                                      // Get.toNamed(Routes.signatureRoute);
                                    },
                                    imagePath:
                                        "assets/images/personal-information 1.png",
                                    CardText: "Personal Storage",
                                  )
                                ],
                              ),
                              SizedBox(
                                height: Get.height / 40,
                              ),
                              _.isLoading
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: Get.height / 4.3,
                                          child: Image.asset(
                                            'assets/images/Artboard 12 1.png',
                                          ),
                                        ),
                                        TextButton(
                                            onPressed: () {},
                                            child: Container(
                                              width: Get.width / 2.4,
                                              height: Get.height * 0.06,
                                              decoration: ShapeDecoration(
                                                  color:
                                                      UIDataColors.commonColor,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20))),
                                              child: Center(
                                                child: Text(
                                                  'Create Task',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ))
                                      ],
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: 7,
                                      itemBuilder: (c, i) {
                                        return Listcard(
                                          title: 'Title',
                                          subtitle: 'subtitle',
                                          rSubtitle: '14 Jan, 2023',
                                        );
                                      },
                                    ).marginOnly(left: 15, right: 15),
                            ],
                          ),
                        ),

                        ////////////////////////////////////////////tab2///////////////////
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: Get.height / 40,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    CustomCard(
                                      onPressed: () {
                                        Get.toNamed(Routes.ListsRoute,
                                            arguments: {"docType": "project"});
                                      },
                                      statusText: "Projects",
                                      // ${_.data['data'][0]['name']}
                                      valueText: _.projCount.toString(),
                                      icon: const Icon(
                                          Icons.document_scanner_outlined,
                                          color: Colors.white),
                                      color: UIDataColors.commonColor,
                                    ).paddingOnly(left: 15),
                                    CustomCard(
                                      statusText: 'Tasks',
                                      onPressed: () {
                                        Get.toNamed(Routes.ListsRoute,
                                            arguments: {"docType": "task"});
                                        // Get.toNamed(Routes.signatureRoute);
                                      },
                                      valueText: _.taskCount.toString(),
                                      icon: Icon(
                                          Icons.document_scanner_outlined,
                                          color: Colors.white),
                                      color: UIDataColors.appCardSecondary,
                                    ),
                                    CustomCard(
                                      statusText: 'Documents',
                                      valueText: _.docCount.toString(),
                                      onPressed: () {
                                        Get.toNamed(Routes.ListsRoute,
                                            arguments: {
                                              "docType": "Documents"
                                            });
                                        // Get.toNamed(Routes.signatureRoute);
                                      },
                                      icon: const Icon(
                                          Icons.document_scanner_outlined,
                                          color: Colors.white),
                                      color: UIDataColors.commonColor,
                                    ),
                                    CustomCard(
                                      statusText: 'Customers',
                                      valueText: _.customerCount.toString(),
                                      onPressed: () {
                                        Get.toNamed(Routes.ListsRoute,
                                            arguments: {"docType": "customer"});
                                        // Get.toNamed(Routes.signatureRoute);
                                      },
                                      icon: Icon(
                                          Icons.document_scanner_outlined,
                                          color: Colors.white),
                                      color: UIDataColors.appCardSecondary,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: Get.height / 40,
                              ),
                              _.isLoading
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: Get.height / 4.3,
                                          child: Image.asset(
                                              'assets/images/Artboard 12 1.png'),
                                        ),
                                        TextButton(
                                            onPressed: () {},
                                            child: Container(
                                              width: Get.width / 2.4,
                                              height: Get.height * 0.06,
                                              decoration: ShapeDecoration(
                                                  color:
                                                      UIDataColors.commonColor,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20))),
                                              child: Center(
                                                child: Text(
                                                  'Create Task',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ))
                                      ],
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: _.task!.length,
                                      itemBuilder: (c, i) {
                                        return Listcard(
                                          title: _.task![i].subject ?? '',
                                          subtitle: _.task![i].priority,
                                          belowSubtitle: (_.task![i].endDate
                                                      .toString()
                                                      .length >
                                                  11)
                                              ? _.task![i].endDate
                                                  .toString()
                                                  .substring(0, 11)
                                              : _.task![i].endDate.toString(),
                                          rTitle: _.task![i].status,
                                          rSubtitle: _.task![i].type,
                                          belowRSubtitle: _.task![i].project,
                                        );
                                      },
                                    ).marginOnly(left: 15, right: 15),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
