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
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
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
                      // Container(
                      //   height: Get.height / 5,
                      //   width: Get.width,
                      //   decoration: BoxDecoration(
                      //     color: UIDataColors.bgColor,
                      //     border: Border.all(color: UIDataColors.bgColor),
                      //     borderRadius: const BorderRadius.all(
                      //       Radius.circular(3),
                      //     ),
                      //   ),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       const Text('12'),
                      //       const Text('In Progres \nProject'),
                      //     ],
                      //   ).paddingAll(20),
                      // ).marginOnly(left: 15, right: 15),
                      ReusableTabWithFilterList(
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
                            child: Text("Business",
                                style: TextStyle(
                                    // color: UIDataColors.whiteColor,
                                    fontSize: 15)),
                          ),
                        ],
                        tabBarView: [
                          /////////////////////////////tab1///////////////////////////
                          Column(
                            children: [
                              Container(
                                height: Get.height / 4.2,
                                width: Get.width / 1.11,
                                decoration: ShapeDecoration(
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
                              ).paddingOnly(top: Get.height * 0.025),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.signatureRoute);
                                },
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Container(
                                    width: Get.width / 1.1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        LogoCard(
                                            imagePath:
                                                "assets/images/file-storage 1.png",
                                            CardText: "File Storage"),
                                        LogoCard(
                                          imagePath:
                                              "assets/images/drive 1.png",
                                          CardText: "Google Drive",
                                        ),
                                        LogoCard(
                                          imagePath:
                                              "assets/images/dropbox 1.png",
                                          CardText: "DropBox",
                                        ),
                                        LogoCard(
                                          imagePath:
                                              "assets/images/personal-information 1.png",
                                          CardText: "Personal Storage",
                                        )
                                      ],
                                    ),
                                  ),
                                ).paddingOnly(
                                  top: 8,
                                  bottom: 8,
                                ),
                              ),

                              // const SizedBox(
                              //   height: 25,
                              // ),
                              // Container(
                              //   decoration: BoxDecoration(
                              //     border: Border(
                              //       bottom: BorderSide(color: Colors.black),
                              //     ),
                              //   ),
                              //   child: Row(
                              //     children: [
                              //       const Text(
                              //         "All",
                              //         style: TextStyle(
                              //           fontSize: 20,
                              //           color: Colors.black,
                              //           fontWeight: FontWeight.normal,
                              //         ),
                              //       ),
                              //       const Spacer(),
                              //       GestureDetector(
                              //         onTap: () =>
                              //             {Get.toNamed(Routes.docListPage)},
                              //         child: SizedBox(
                              //             height: 30,
                              //             width: 30,
                              //             child: Icon(
                              //               Icons.arrow_circle_right,
                              //               color:
                              //                   UIDataColors.kBlueButtonColor,
                              //               size: 30,
                              //             )),
                              //       ),
                              //       const SizedBox(
                              //         width: 5,
                              //       ),
                              //       TextButton(
                              //         onPressed: () {
                              //           Get.toNamed(Routes.docListPage);
                              //         },
                              //         child: Text(
                              //           "Go to Documents",
                              //           style: TextStyle(
                              //             fontSize: 10,
                              //             color: Colors.black,
                              //             fontWeight: FontWeight.normal,
                              //           ),
                              //         ),
                              //       ).marginOnly(right: 20),
                              //     ],
                              //   ).paddingAll(10),
                              // ).marginSymmetric(horizontal: 20),
                              SizedBox(
                                height: Get.height * 0.022,
                              ),

                              Container(
                                height: Get.height / 3.2,
                                child: _.isLoading
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: Get.height / 2.9,
                                            child: Image.asset(
                                                'assets/images/Artboard 12 1.png'),
                                          ),
                                          TextButton(
                                              onPressed: () {},
                                              child: Container(
                                                width: Get.width / 2,
                                                height: Get.height * 0.06,
                                                decoration: ShapeDecoration(
                                                    color: UIDataColors
                                                        .commonColor,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20))),
                                                child: Center(
                                                  child: Text(
                                                    'Create Task',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ))
                                        ],
                                      )
                                    : SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
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
                              ),
                            ],
                          ),

                          ////////////////////////////////////////////tab2///////////////////
                          Column(
                            children: [
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
                                      valueText: '12',
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
                                      valueText: '12',
                                      icon: Icon(
                                          Icons.document_scanner_outlined,
                                          color: Colors.white),
                                      color: UIDataColors.appCardSecondary,
                                    ),
                                    CustomCard(
                                      statusText: 'Documents',
                                      valueText: '12',
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
                                      valueText: '12',
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
                              ).paddingOnly(
                                top: 20,
                                bottom: 20,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              // const SizedBox(
                              //   height: 25,
                              // ),
                              // Container(
                              //   decoration: BoxDecoration(
                              //     border: Border(
                              //       bottom: BorderSide(color: Colors.black),
                              //     ),
                              //   ),
                              //   child: Row(
                              //     children: [
                              //       const Text(
                              //         "All",
                              //         style: TextStyle(
                              //           fontSize: 20,
                              //           color: Colors.black,
                              //           fontWeight: FontWeight.normal,
                              //         ),
                              //       ),
                              //       const Spacer(),
                              //       GestureDetector(
                              //         onTap: () =>
                              //             {Get.toNamed(Routes.docListPage)},
                              //         child: SizedBox(
                              //             height: 30,
                              //             width: 30,
                              //             child: Icon(
                              //               Icons.arrow_circle_right,
                              //               color:
                              //                   UIDataColors.kBlueButtonColor,
                              //               size: 30,
                              //             )),
                              //       ),
                              //       const SizedBox(
                              //         width: 5,
                              //       ),
                              //       TextButton(
                              //         onPressed: () {
                              //           Get.toNamed(Routes.docListPage);
                              //         },
                              //         child: Text(
                              //           "Go to Documents",
                              //           style: TextStyle(
                              //             fontSize: 10,
                              //             color: Colors.black,
                              //             fontWeight: FontWeight.normal,
                              //           ),
                              //         ),
                              //       ).marginOnly(right: 20),
                              //     ],
                              //   ).paddingAll(10),
                              // ).marginSymmetric(horizontal: 20),

                              Container(
                                height: Get.height / 2.24,
                                child: _.isLoading
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: Get.height / 2.9,
                                            child: Image.asset(
                                                'assets/images/Artboard 12 1.png'),
                                          ),
                                          TextButton(
                                              onPressed: () {},
                                              child: Container(
                                                width: Get.width / 2,
                                                height: Get.height * 0.06,
                                                decoration: ShapeDecoration(
                                                    color: UIDataColors
                                                        .commonColor,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20))),
                                                child: Center(
                                                  child: Text(
                                                    'Create Task',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ))
                                        ],
                                      )
                                    : SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
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
                              ),
                            ],
                          ),
                        ],
                      ),
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
