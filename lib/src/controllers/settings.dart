import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:docapp/src/services/settings.dart';

class SettingsController extends GetxController {
  // Make SettingsService a private variable so it is not used directly.
  final SettingsService _settingsService = Get.find<SettingsService>();

  // Make ThemeMode a private variable so it is not updated directly without
  // also persisting the changes with the SettingsService.
  late ThemeMode themeMode;
  bool? status;

  // Allow Widgets to read the user's preferred ThemeMode.
  ThemeMode get themeMode1 => themeMode;

  @override
  Future<void> onInit() async {
    themeMode = _settingsService.getThemeMode;
    print(themeMode);
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  /// Load the user's settings from the SettingsService. It may load from a
  /// local database or the internet. The controller only knows it can load the
  /// settings from the service.
  Future<void> loadSettings() async {
    await _settingsService.loadSettings();
    themeMode = _settingsService.getThemeMode;

    print("this is statsu+ $status");
  }

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    // Persist the changes to a local database or the internet using the
    // SettingService.
    await _settingsService.updateThemeMode(newThemeMode);
    print("###########@@@@@@${newThemeMode}");
  }

  Color lightPrimaryColor = Color.fromARGB(255, 255, 255, 255);
  Color darkPrimaryColor = Color.fromARGB(255, 0, 0, 0);

  static ThemeData lightTheme = ThemeData(
    
      progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.black),
      primaryColor: ThemeData.light().scaffoldBackgroundColor,
      colorScheme: ColorScheme.light().copyWith(
        primary: settingsController.lightPrimaryColor,
      ));

  static ThemeData darkTheme = ThemeData(
      progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.white),
      primaryColor: ThemeData.dark().scaffoldBackgroundColor,
      inputDecorationTheme: InputDecorationTheme(),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(backgroundColor: Colors.amber),
      colorScheme: ColorScheme.dark().copyWith(
        primary: settingsController.darkPrimaryColor,
      ));
}

SettingsController settingsController = SettingsController();
