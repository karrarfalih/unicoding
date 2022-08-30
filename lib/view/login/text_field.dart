import 'package:flutter/material.dart';
import 'package:unicoding/utilz/theme.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({Key? key, required this.hint, required this.controller, this.isSecure = false}) : super(key: key);
  final  String hint;
  final bool isSecure;


  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextField(
        controller: controller,
        obscureText: isSecure,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: hint,

          border: border(Colors.grey.withOpacity(0.6)),
          enabledBorder: border(Colors.grey.withOpacity(0.6)),
          focusedBorder: border(AppTheme.mainColor),
          errorBorder: border(Colors.red),
        ),
      ),
    );
  }
}


InputBorder border(Color color) => OutlineInputBorder(
  borderRadius: BorderRadius.circular(4),
  borderSide: BorderSide(color: color, width: 1)
);