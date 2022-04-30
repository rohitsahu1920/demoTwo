import 'package:demo/controllers/dashboard_controller.dart';
import 'package:demo/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/images.dart';
import '../res/methods.dart';
import '../widgets/app_primary_button.dart';
import '../widgets/appbar_without_back.dart';

class DashboardScreen extends StatelessWidget {

  final DashboardController _dashboardController =
      Get.put(DashboardController());
  final _formKey = GlobalKey<FormState>();

  DashboardScreen({Key? key}) : super(key: key);
  _nextScreen() async {

    log("Under Method");

    if (!isFormValid(_formKey)) return;

    log("${!isFormValid(_formKey)}");

    _dashboardController.nextScreen();


  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarWithoutBack(
          title: "Demo",
          textStyle: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            inherit: false,
          ),
          actions: [],
        ),
        body: Container(
          color: Colors.white,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: const [
                      Center(
                        child: Image(
                          image: AssetImage(Assets.logo),
                          fit: BoxFit.contain,
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ],
                  ),
                ),
                //const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppTextField(
                        hintText: "Enter value of M",
                        controller: _dashboardController.m,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a valid Number!';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppTextField(
                        hintText: "Enter value of N",
                        controller: _dashboardController.n,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a valid Number!';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: AppPrimaryButton(
                          text: "Next Screen",
                          onPressed: _nextScreen,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
