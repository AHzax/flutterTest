import 'package:docapp/src/ui/widgets/common_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:docapp/src/controllers/settings.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      bodyData: bodyData(context),
      appTitle: 'Settings',
      showAppBar: true,
    );
  }

  Widget bodyData(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (_) {
        return SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                Container(
                  // height: 54.0,
                  width: Get.width,
                  padding:
                      const EdgeInsets.only(left: 26, top: 18, bottom: 14.0, right: 26),
                  // decoration: BoxDecoration(
                  //   // color: const Color(0xfff6f7ff).withOpacity(0.1),
                  // ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Theme',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                          // color: Color(0xff3e3f68),
                        ),
                      ),
                      const Spacer(),
                      DropdownButton<ThemeMode>(
                        // Read the selected themeMode from the controller
                        value: _.themeMode,
                        // Call the updateThemeMode method any time the user selects a theme.
                        onChanged: _.updateThemeMode,
                        items: const [
                          DropdownMenuItem(
                            value: ThemeMode.system,
                            child: Text('System Theme'),
                          ),
                          DropdownMenuItem(
                            value: ThemeMode.light,
                            child: Text('Light Theme'),
                          ),
                          DropdownMenuItem(
                            value: ThemeMode.dark,
                            child: Text('Dark Theme'),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
