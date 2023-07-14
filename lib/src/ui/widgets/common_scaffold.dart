// flutter imports
import 'package:flutter/material.dart';

// package imports
// import 'package:get/get.dart';

// services

// route imports

// lib imports
import '../../utils/config/uidata.dart';
// import './buttons/icon_button.dart';
import '../widgets/drawer/common_drawer.dart';
import './custom_float.dart';

class CommonScaffold extends StatelessWidget {
  final appTitle;
  final Widget bodyData;
  final showFAB;
  final showDrawer;
  final showAppBar;
  final Color? backGroundColor;
  final actionFirstIcon;
  final actionSecondIcon;
  final scaffoldKey;
  final showBottomNav;
  final floatingIcon;
  final centerDocked;
  final elevation;
  final enableHeader;
  final String? headerTitle;
  final Widget? headerIcon;
  final String headerSubTitle;
  final headerName;
  final topButton;
  final qrCallback;
  final String headerImage;
  final actionFirstIconCallBack;
  final actionSecondIconCallBack;
  final appBarSearch;
  final appBarSearchShow;
  final helpIcon;
  final Uri? helpIconLink;
  CommonScaffold({
    this.appTitle,
    required this.bodyData,
    this.showFAB = false,
    this.showDrawer = false,
    this.showAppBar = false,
    this.backGroundColor,
    this.actionFirstIcon = false,
    this.actionSecondIcon = false,
    this.scaffoldKey,
    this.showBottomNav = false,
    this.centerDocked = true,
    this.floatingIcon = Icons.add,
    this.elevation = 4.0,
    this.enableHeader = false,
    this.headerName = false,
    this.headerTitle = '',
    this.headerIcon,
    this.headerSubTitle = '',
    this.topButton = 'menu',
    this.qrCallback,
    this.headerImage = '',
    this.actionFirstIconCallBack,
    this.actionSecondIconCallBack,
    this.appBarSearch,
    this.helpIcon = false,
    this.helpIconLink,
    this.appBarSearchShow = false,
  });

  Widget myBottomBar() => BottomAppBar(
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: 59,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              // ReusableIconButton(
              //   icon: Icon(
              //     Icons.home_outlined,
              //     color: (Get.currentRoute == Routes.homeRoute)
              //         ? UIDataColors.commonColor
              //         : Colors.grey,
              //     size: 24,
              //   ),
              //   onPressed: () {
              //     if (Get.currentRoute != Routes.homeRoute) {
              //       Get.offAllNamed(Routes.homeRoute);
              //     }
              //   },
              // ),
              // ReusableIconButton(
              //     icon: Icon(
              //       Icons.dashboard,
              //       color: Get.currentRoute == Routes.dashboardRoute
              //           ? UIDataColors.commonColor
              //           : Colors.grey,
              //       size: 24,
              //     ),
              //     onPressed: () {
              //       if (Get.currentRoute != Routes.dashboardRoute) {
              //         Get.offAllNamed(Routes.dashboardRoute);
              //       }
              //     }),
              // Stack(
              //   children: [
              //     ReusableIconButton(
              //         icon: Icon(
              //           Icons.notifications_none,
              //           color: Get.currentRoute == Routes.notificationsRoute
              //               ? UIDataColors.commonColor
              //               : Colors.grey,
              //           size: 24,
              //         ),
              //         onPressed: () {
              //           if (Get.currentRoute != Routes.notificationsRoute) {
              //             Get.offAllNamed(Routes.notificationsRoute);
              //           }
              //         }),
              //     Obx(
              //       () => Positioned(
              //         right: 0,
              //         child: notificationService.notificationCounter.value > 0
              //             ? Container(
              //                 height: 25.0,
              //                 width: 25.0,
              //                 padding: EdgeInsets.all(5.0),
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.all(
              //                     Radius.circular(30.0),
              //                   ),
              //                   color: UIDataColors.commonColor,
              //                   // color: Colors.white,
              //                 ),
              //                 child: Center(
              //                   child: Text(
              //                     '${notificationService.notificationCounter.value}',
              //                     // channelSubscription[i].unread.toString(),
              //                     style: TextStyle(
              //                       fontWeight: FontWeight.w400,
              //                       fontSize: 13,
              //                       fontFamily: 'Roboto',
              //                       color: Colors.white,
              //                     ),
              //                   ),
              //                 ),
              //               )
              //             : SizedBox(),
              //       ),
              //     )
              //   ],
              // ),
              // ReusableIconButton(
              //   icon: Icon(
              //     Icons.settings_outlined,
              //     color: Get.currentRoute == Routes.settingsRoute
              //         ? UIDataColors.commonColor
              //         : Colors.grey,
              //     size: 24,
              //   ),
              //   onPressed: () {
              //     if (Get.currentRoute != Routes.settingsRoute) {
              //       Get.offAllNamed(Routes.settingsRoute);
              //     }
              //   },
              // ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    // int topFlex = 4;
    // int bottomFlex = 11;
    // int totalFlex = topFlex + bottomFlex;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: showAppBar
          ? AppBar(
              elevation: elevation,
              backgroundColor: UIDataColors.commonColor,
              title: Text(appTitle),
              actions: <Widget>[
                appBarSearchShow != false ? appBarSearch : SizedBox(),
                actionFirstIcon != false
                    ? IconButton(
                        onPressed: actionFirstIconCallBack,
                        icon: Icon(
                          actionFirstIcon,
                          color: Colors.white,
                        ),
                      )
                    : SizedBox(),
                actionSecondIcon != false
                    ? IconButton(
                        onPressed: actionSecondIconCallBack,
                        icon: Icon(
                          actionSecondIcon,
                          color: Colors.white,
                        ),
                      )
                    : SizedBox(),
              ],
            )
          : null,
      drawer: showDrawer ? CommonDrawer() : null,
      body: OrientationBuilder(
        builder: (context, orientation) {
          // print('width : ${ (MediaQuery.of(context).size.width.ceil()).toDouble()}');
          // print('keyboard: ${MediaQuery.of(context).viewInsets.bottom}');
          return SafeArea(
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: 0.85,
              ),
              child: Container(
                  decoration: BoxDecoration(
                    color: backGroundColor ?? Colors.white,
                  ),
                  width: (MediaQuery.of(context).size.width.ceil()).toDouble(),
                  height:
                      (MediaQuery.of(context).size.height.ceil()).toDouble(),
                  child: bodyData),
            ),
          );
        },
      ),
      floatingActionButton: showFAB
          ? CustomFloat(
              builder: null,
              icon: floatingIcon,
              qrCallback: qrCallback,
            )
          : null,
      floatingActionButtonLocation: centerDocked
          ? FloatingActionButtonLocation.centerDocked
          : FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: showBottomNav ? myBottomBar() : null,
    );
  }
}
