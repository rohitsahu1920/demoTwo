import 'package:demo/res/methods.dart';
import 'package:demo/screens/grid_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DashboardController extends GetxController {
  var color = Colors.amber.obs;

  setColor(MaterialColor value) {
    color.value = value;
  }

  var valueOfM = 0.obs;

  setMValue(String value) {
    valueOfM.value = int.parse(value);
  }

  var valueOfN = 0.obs;

  setNValue(String value) {
    valueOfN.value = int.parse(value);
  }

  late List<String> gridName = <String>[].obs;

  TextEditingController m = TextEditingController();
  TextEditingController n = TextEditingController();
  TextEditingController search = TextEditingController();

  void nextScreen() {
    gridName.clear();

    log("Value of m and m :: ${m.text} and ${n.text}");

    setMValue(m.text);
    setNValue(n.text);

    int total = int.parse(m.text) * int.parse(n.text);
    log("Total :: $total");

    for (int a = 65; a < total + 65; a++) {
      gridName.add(String.fromCharCode(a));
    }
    log("List Name :: $gridName");
    Get.to(() => const GridScreen());
  }

  void searchMethod() {
    log("Under search method");
    log("Search value ${search.text}");

    int total = int.parse(m.text) * int.parse(n.text);
    for (int a = 65; a < total + 65; a++) {
      gridName.add(String.fromCharCode(a));
    }

    GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: valueOfN.value,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: valueOfN.value * valueOfM.value,
        itemBuilder: (BuildContext context, int index) {
          log("Building ${search.text == gridName[index]}");
          return Card(
            color: search.text == gridName[index] ? Colors.green : Colors.amber,
            child: Center(child: Text(gridName[index])),
          );
        });

    for (var element in gridName) {
      if (element == search.text) {
        color.value = Colors.green;
      }
    }
  }
}
