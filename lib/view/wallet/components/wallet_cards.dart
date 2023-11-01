import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/const/theme.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        elevation: 7,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cards",
                style: GoogleFonts.roboto(textStyle: productTitle)
                    .copyWith(color: formTextColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  SvgPicture.asset("assets/svg_icons/home_screen/grey_card.svg",
                      width: 19.91, height: 19.91, semanticsLabel: ''),
                  const SizedBox(width: 30),
                  Flexible(
                    child: Text(
                      "Add a card to enjoy a seamless payments exprience",
                      style: GoogleFonts.roboto()
                          .copyWith(color: HexColor("414141"), fontSize: 14),
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Add Card",
                style: GoogleFonts.roboto(textStyle: productTitle)
                    .copyWith(color: HexColor("1BCB5D")),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
