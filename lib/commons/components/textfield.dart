
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
     InputField({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
    
   String? Function(String?)? validator ,
    TextEditingController? controller

  }) : super(key: key);
  final String labelText;
  final Icon prefixIcon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            labelText: labelText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
      ),
    );
  }
}
