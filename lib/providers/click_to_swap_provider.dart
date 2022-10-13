import 'package:flutter/material.dart';

class Clicked extends ValueNotifier<bool> {
  Clicked._sharedInference() : super(true);
  static final Clicked _shared = Clicked._sharedInference();
  factory Clicked() => _shared;
  bool get clicked => value;
  void isClicked(bool clicked) {
    value = clicked;
    notifyListeners();
  }
}