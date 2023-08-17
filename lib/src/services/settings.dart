import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsService extends GetxService with ChangeNotifier {
  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> themeMode() async => ThemeMode.system;

  // Make ThemeMode a private variable so it is not updated directly without
  // also persisting the changes with the SettingsService.
  late ThemeMode _themeMode;

  // Allow Widgets to read the user's preferred ThemeMode.
  ThemeMode get getThemeMode => _themeMode;

  Future<SettingsService> init() async {
    await loadSettings();
    return this;
  }

  /// Load the user's settings from the SettingsService. It may load from a
  /// local database or the internet. The controller only knows it can load the
  /// settings from the service.
  Future<void> loadSettings() async {
    _themeMode = await themeMode();

    // Important! Inform listeners a change has occurred.
    notifyListeners();
  }

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    // Do not perform any work if new and old ThemeMode are identical
    if (newThemeMode == _themeMode) return;

    // Otherwise, store the new ThemeMode in memory
    _themeMode = newThemeMode;
    themeMode1.value = newThemeMode;

    // Important! Inform listeners a change has occurred.
    notifyListeners();
  }

  var themeMode1 = ThemeMode.light.obs;

  void changeThemeMode(ThemeMode newMode) {
    themeMode1.value = newMode;
    print(" themeMode.value ${themeMode1.value}");
  }

  // Color lightPrimaryColor = Color.fromARGB(255, 225, 225, 225);
  // Color darkPrimaryColor = Color.fromARGB(255, 53, 53, 53);

  // static ThemeData lightTheme = ThemeData(
  //     primaryColor: ThemeData.light().scaffoldBackgroundColor,
  //     colorScheme: ColorScheme.light().copyWith(
  //       primary: Colors.black12,
  //     ));

  // static ThemeData darkTheme = ThemeData(
  //     primaryColor: ThemeData.dark().scaffoldBackgroundColor,
  //     colorScheme: ColorScheme.dark().copyWith(
  //       primary: Colors.amber,
  //     ));
}
