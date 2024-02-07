import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pillset/commons/utils/colors.dart';

bool isLoading = false;

final spinkit = SpinKitCircle(
  color: green, // Set the color of the spinner
);

void showLoadingDialog(BuildContext context) {
  if (!isLoading) {
    isLoading = true;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => Center(child: spinkit),
    );
  }
}

void hideLoadingDialog(BuildContext context) {
  if (isLoading) {
    isLoading = false;
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}
