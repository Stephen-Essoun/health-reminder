import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      required this.labelText,
      required this.prefixIcon,
      this.controller,
      this.validator})
      : super(key: key);
  final String labelText;
  final Icon prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            labelText: labelText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
      ),
    );
  }
}
