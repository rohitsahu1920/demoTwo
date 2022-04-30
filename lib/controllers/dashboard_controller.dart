import 'package:demo/res/methods.dart';
import 'package:demo/screens/grid_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DashboardController extends GetxController{


  var valueOfM = 0.obs;
  setMValue(String value){
    valueOfM.value = int.parse(value);
  }

  var valueOfN = 0.obs;
  setNValue(String value){
    valueOfN.value = int.parse(value);
  }

  late List<String> gridName = [];

  TextEditingController m = TextEditingController();
  TextEditingController n = TextEditingController();


  void nextScreen(){

    gridName.clear();

    log("Value of m and m :: ${m.text} and ${n.text}");

    setMValue(m.text);
    setNValue(n.text);

    int total = int.parse(m.text) * int.parse(n.text);
    log("Total :: $total");

    for(int a =65; a < total+65; a++){
      gridName.add(String.fromCharCode(a));
    }
    log("List Name :: $gridName");
   Get.to(() => GridScreen());
  }
}