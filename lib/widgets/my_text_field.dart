import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {

  String? hintText, labelText;
  TextStyle? hintStyle, labelStyle;
  bool? field; InputBorder? border;
  Color? fillColor; TextEditingController? controller;
  TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        hintText: hintText,
        hintStyle: hintStyle,
        labelText: labelText,
        labelStyle: labelStyle,
        filled: field,
        fillColor: fillColor,
        border: border,
      ),
    );
  }

  MyTextField({
    this.hintText,
    this.labelText,
    this.hintStyle,
    this.labelStyle,
    this.field,
    this.border,
    this.fillColor,
    this.controller,
    this.keyboardType,
  });
}
