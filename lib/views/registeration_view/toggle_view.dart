import 'package:flutter/material.dart';
import 'package:pillset/commons/utils/routes.dart';


class ToggleIt extends ValueNotifier<bool> {
  ToggleIt._sharedInference():super(false);
  static final ToggleIt _shared = ToggleIt._sharedInference();
factory ToggleIt( )=> _shared;

void togglefxn(bool answer) {
  value = answer;
  value == true?signInRoute:registerRoute;
   value =! value;
  notifyListeners();
}
}