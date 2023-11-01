import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saholatkar/const/theme.dart';

class WhatsappButton extends StatelessWidget {
  final Color buttonColor;
  final String textValue;
  final Color textColor;

  // ignore: use_key_in_widget_constructors
  const WhatsappButton({
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
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Row(
                children: [
                  SvgPicture.asset(
                      "assets/svg_icons/product_details/whatsapp.svg",
                      width: 17.91,
                      height: 17.91,
                      semanticsLabel: 'more'),
                  const SizedBox(width: 5),
                  Text(
                    textValue,
                    style: GoogleFonts.roboto(textStyle: heading8)
                        .copyWith(color: textColor, fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
