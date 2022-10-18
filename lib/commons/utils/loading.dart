import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

bool isLoading = false;

final spinkit = SpinKitCircle(
  itemBuilder: (BuildContext context, int index) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
    );
  },
);

void isLoadingDialogue(BuildContext context) {
  if (isLoading == false) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => Center(
              child: spinkit,
            ));
  }
}
