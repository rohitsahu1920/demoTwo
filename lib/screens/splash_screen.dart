import 'dart:async';

import 'package:demo/screens/dashborad_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../mixins/after_layout.dart';
import '../res/images.dart';


const Duration splashDuration = Duration(seconds: 3);

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with AfterLayoutMixin<SplashScreen>{

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    _startApp();
  }

  _startApp() {
    return Timer(splashDuration, () async {
        Get.offAll(() => DashboardScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage(Assets.logo),
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}

