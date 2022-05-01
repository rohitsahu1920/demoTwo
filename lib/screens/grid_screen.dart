import 'dart:async';

import 'package:demo/res/methods.dart';
import 'package:flutter/material.dart';
import '../controllers/dashboard_controller.dart';
import 'package:get/get.dart';
import '../widgets/app_primary_button.dart';
import '../widgets/app_text_field.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({Key? key}) : super(key: key);

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {

  final DashboardController _dashboardController =
  Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SizedBox(
            height: double.infinity,
            child: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: 100,
                          child: AppTextField(
                            hintText: "Search",
                            controller: _dashboardController.search,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter a valid Number!';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      AppPrimaryButton(
                        text: "Search",
                        onPressed: () {
                          gridBuilder(context);
                          log("Under Search");
                          log("Under Search ${_dashboardController.search.text}");
                          _dashboardController.searchMethod();
                          setState(() {

                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                gridBuilder(context),
              ],
            ),
          ),
        ));
  }

  Widget gridBuilder(BuildContext context) {
    return Obx(
          () => GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _dashboardController.valueOfN.value,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _dashboardController.valueOfN.value *
              _dashboardController.valueOfM.value,
          itemBuilder: (BuildContext context, int index) {
            log("Building ${_dashboardController.search.text == _dashboardController.gridName[index]}");
            return Card(
              color: _dashboardController.search.text ==
                  _dashboardController.gridName[index]
                  ? Colors.green
                  : Colors.amber,
              child: Center(child: Text(_dashboardController.gridName[index])),
            );
          }),
    );
  }
}

