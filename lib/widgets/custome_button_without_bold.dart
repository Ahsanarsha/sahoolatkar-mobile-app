import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saholatkar/const/theme.dart';

class CustomButtonWithoutBold extends StatelessWidget {
  final Color buttonColor;
  final String textValue;
  final Color textColor;
  final GestureTapCallback onPressed;
  // ignore: use_key_in_widget_constructors
  const CustomButtonWithoutBold({
    required this.buttonColor,
    required this.textValue,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      height: 40.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            primary: textColor,
            backgroundColor: buttonColor,
            textStyle: GoogleFonts.roboto(textStyle: heading8).copyWith(
                color: textColor, fontSize: 13, fontWeight: FontWeight.bold)),
        child: Text(
          textValue,
        ),
      ),
    );
  }
}
class CustomButtonWithoutBold2 extends StatelessWidget {
  final Color buttonColor;
  final String textValue;
  final Color textColor;
  final GestureTapCallback onPressed;
  // ignore: use_key_in_widget_constructors
  const CustomButtonWithoutBold2({
    required this.buttonColor,
    required this.textValue,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 40.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            primary: textColor,
            backgroundColor: buttonColor,
            textStyle: GoogleFonts.roboto(textStyle: heading8).copyWith(
                color: textColor, fontSize: 13, fontWeight: FontWeight.bold)),
        child: Text(
          textValue,
        ),
      ),
    );
  }
}
