import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
   const InputField({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
    String? Function(String?)? validator,
    this.controller
  }) : super(key: key);
  final String labelText;
  final Icon prefixIcon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            labelText: labelText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
      ),
    );
  }
}
