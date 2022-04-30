import 'package:demo/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App {
  static App instance = App();

  bool _devMode = false;

  bool get devMode => _devMode;

  startApp({
    required bool devMode,
  }) async {
    _devMode = devMode;
    WidgetsFlutterBinding.ensureInitialized();
    runApp(
      const GetMaterialApp(
        locale: Locale('en', 'US'),
        fallbackLocale: Locale('en', 'US'),
        home: SplashScreen(),
      ),
    );
  }
}
