import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app_advanced/ui/pages/notification_screen.dart';

class ThemeServices {
  final GetStorage _box = GetStorage();
  final _key = 'isDarkMode';

  _saveThemeModeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  bool _getThemeModeFromBox() => _box.read(_key) ?? false;

  ThemeMode get theme =>
      _getThemeModeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(
        _getThemeModeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeModeToBox(!_getThemeModeFromBox());
    Get.to(NotificationScreen());
  }
}
