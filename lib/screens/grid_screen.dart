import 'package:flutter/material.dart';

import '../controllers/dashboard_controller.dart';
import 'package:get/get.dart';

class GridScreen extends StatelessWidget {
  GridScreen({Key? key}) : super(key: key);

  final DashboardController _dashboardController =
      Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _dashboardController.valueOfN.value,
        ),
        itemCount: _dashboardController.valueOfN.value * _dashboardController.valueOfM.value,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.amber,
            child: Center(child: Text(_dashboardController.gridName[index])),
          );
        });
  }
}
