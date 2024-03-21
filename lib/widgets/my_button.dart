import 'package:flutter/material.dart';
import '../helpers/constants.dart';

class MyButton extends StatelessWidget {
  Widget Text;
  VoidCallback onPressed;
  Color? bgColor;



  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text,
      style: ElevatedButton.styleFrom(
          fixedSize: Size(300, 48), backgroundColor: bgColor),
    );
  }

  MyButton({
    required this.Text,
    required this.onPressed,
    this.bgColor = MyColors.redColor,
  });
}
