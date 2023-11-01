import 'package:flutter/material.dart';
import 'package:saholatkar/const/theme.dart';

class FormButton extends StatelessWidget {
  FormButton(
      {required this.onPressed,
      required this.buttonName,
      required this.sizePercentage});

  final GestureTapCallback onPressed;
  final String buttonName;
  final double sizePercentage;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / sizePercentage,
      padding: const EdgeInsets.all(5.0),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(loginButtonColor),
          //Background Color
          elevation: MaterialStateProperty.all(3),
          //Defines Elevation
          shadowColor: MaterialStateProperty.all(
            Colors.grey,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonName,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
