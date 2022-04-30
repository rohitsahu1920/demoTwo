import 'dart:developer' as d;

import '../app.dart';

void log(Object object) {
  if (App.instance.devMode) d.log("APP LOG :: $object");
}

bool isFormValid(key) {
  final form = key.currentState;
  if (form.validate()) {
    form.save();
    return true;
  }
  return false;
}
