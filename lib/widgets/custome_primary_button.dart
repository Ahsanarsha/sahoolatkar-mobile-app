import 'package:flutter/material.dart';
import 'package:saholatkar/const/theme.dart';

class CustomPrimaryButton extends StatelessWidget {
  final Color buttonColor;
  final String textValue;
  final Color textColor;

  // ignore: use_key_in_widget_constructors
  const CustomPrimaryButton({
    required this.buttonColor,
    required this.textValue,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(14.0),
      elevation: 0,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: Text(
              textValue,
              style: heading5.copyWith(color: textColor),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
