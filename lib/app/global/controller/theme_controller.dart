// // ignore_for_file: no_leading_underscores_for_local_identifiers
//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:json_theme/json_theme.dart';
// // https://gist.github.com/RodBr/37310335c6639f486bb3c8a628052405
// //https://medium.com/swlh/flutter-dynamic-themes-in-3-lines-c3b375f292e3
//
// class ThemeController extends GetxController {
//   @override
//   void onInit() async {
//     super.onInit();
//
//     await initThemeData();
//   }
//
//   static ThemeController get to => Get.find();
//
//   final theme = 'system'.obs;
//   final store = GetStorage();
//   late ThemeMode _themeMode;
//   ThemeMode get themeMode => _themeMode;
//   String get currentTheme => theme.value;
//
//   Rx<ThemeData> lightThemeData = ThemeData().obs;
//   Rx<ThemeData> darkThemeData = ThemeData().obs;
//
//   Future<void> initThemeData() async {
//     final lightThemeStr =
//     await rootBundle.loadString('assets/appainter_theme_coffee.json');
//     final lightThemeJson = jsonDecode(lightThemeStr);
//     final lightTheme = ThemeDecoder.decodeThemeData(lightThemeJson)!;
//
//     lightThemeData(lightTheme);
//
//     final blueThemeStr =
//     await rootBundle.loadString('assets/appainter_theme_pale_blue.json');
//     final blueThemeJson = jsonDecode(blueThemeStr);
//     final blueTheme = ThemeDecoder.decodeThemeData(blueThemeJson)!;
//
//     darkThemeData(blueTheme);
//
//     Get.changeTheme(lightTheme);
//
//     // storageㅇㅔ 저장된 테마 불러와서 적용시키기
//   }
//
//   Future<void> setThemeMode(String value) async {
//     theme(value);
//     _themeMode = getThemeModeFromString(value);
//     Get.changeThemeMode(_themeMode);
//     await store.write('theme', value);
//   }
//
//   ThemeMode getThemeModeFromString(String themeString) {
//     var _setThemeMode = ThemeMode.system;
//     if (themeString == 'light') {
//       _setThemeMode = ThemeMode.light;
//     }
//     if (themeString == 'dark') {
//       _setThemeMode = ThemeMode.dark;
//     }
//     return _setThemeMode;
//   }
//
//   void getThemeModeFromStore() async {
//     var _themeString = store.read('theme') ?? 'system';
//     await setThemeMode(_themeString);
//   }
//
//   bool get isDarkModeOn {
//     if (currentTheme == 'system') {
//       if (WidgetsBinding.instance.window.platformBrightness ==
//           Brightness.dark) {
//         return true;
//       }
//     }
//     if (currentTheme == 'dark') {
//       return true;
//     }
//     return false;
//   }
// }
