import 'package:flutter/material.dart';

Future<void> showErrorDialog(BuildContext context, String text,
    [String? name]) {
  return showDialog(
    context: (context),
    builder: (_) => AlertDialog(
      title: Text(text),
      content: Text(text),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Ok'),
        )
      ],
    ),
  );
}