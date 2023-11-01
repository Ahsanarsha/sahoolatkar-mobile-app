import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/const/theme.dart';

class WalletAmountCard extends StatelessWidget {
  const WalletAmountCard({Key? key}) : super(key: key);

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
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 20.0,
                    backgroundImage:
                        AssetImage('assets/images/home_screen/flag.png'),
                    backgroundColor: Color(0xff034089),
                  ),
                  const SizedBox(width: 30),
                  Text(
                    "Pakistan",
                    style: GoogleFonts.roboto(textStyle: productTitle)
                        .copyWith(color: formTextColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Rs 0",
                style: GoogleFonts.roboto(textStyle: productTitle)
                    .copyWith(color: HexColor("414141"), fontSize: 19),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Promotional credit",
                    style: GoogleFonts.roboto(textStyle: productTitle)
                        .copyWith(color: HexColor("414141"), fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Rs 0",
                    style: GoogleFonts.roboto(textStyle: productTitle)
                        .copyWith(color: HexColor("414141"), fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Divider(
                  thickness: 1.0,
                  color: formTextColor.withOpacity(0.40),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sahoolatkar credit",
                    style: GoogleFonts.roboto(textStyle: productTitle)
                        .copyWith(color: HexColor("414141"), fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Rs 0",
                    style: GoogleFonts.roboto(textStyle: productTitle)
                        .copyWith(color: HexColor("414141"), fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
