import 'package:flutter/material.dart';
import 'package:pillset/commons/utils/colors.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      required this.labelText,
      required this.prefixIcon,
      this.controller,
      required this.obscureText,
      this.keyboardType,
      this.validator})
      : super(key: key);
  final TextInputType? keyboardType;
  final bool obscureText;
  final String labelText;
  final Icon prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      height: 65,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        cursorColor: green,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            prefixIconColor: green,
            isDense: true,
            labelText: labelText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
      ),
    );
  }
}
