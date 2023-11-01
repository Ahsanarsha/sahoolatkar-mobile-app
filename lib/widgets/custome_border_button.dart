import 'package:flutter/material.dart';
import 'package:saholatkar/const/theme.dart';

class CustomeBorderButton extends StatelessWidget {
  const CustomeBorderButton({
    Key? key,
    required this.textValue,
    required this.textColor,
    required this.borderColor,
  }) : super(key: key);

  final String textValue;
  final Color textColor;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.circular(14.0),
        elevation: 0,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: borderColor, width: 1)),
          child: Material(
            color: Colors.transparent,
            child: Center(
              child: Text(
                textValue,
                style: heading5.copyWith(color: textColor),
              ),
            ),
          ),
        ));
  }
}
