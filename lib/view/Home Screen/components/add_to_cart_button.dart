import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key? key,
    required this.textValue,
    required this.textColor,
    required this.borderColor,
    required this.iconColor,
    required this.iconPath,
    required this.buttonHight,
    required this.buttonColor,
    required this.onPressed
  }) : super(key: key);

  final String textValue;
  final String iconPath;
  final Color textColor;
  final Color borderColor;
  final Color iconColor;
  final double buttonHight;
  final Color buttonColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(


        borderRadius: BorderRadius.circular(14.0),
        elevation: 0,
        child:InkWell(
          onTap: onPressed,
        child: Container(
          height: buttonHight,
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(7.0),
              border: Border.all(color: borderColor, width: 1)),
          child: Material(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textValue,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: textColor,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Image.asset(iconPath, width: 18, height: 18, color: iconColor),
              ],
            ),
          ),
        )));
  }
}
