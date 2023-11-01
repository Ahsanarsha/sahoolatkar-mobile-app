import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/const/theme.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({Key? key}) : super(key: key);

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Welcome to Sahoolatkar!",
                      style: GoogleFonts.roboto(textStyle: productTitle)
                          .copyWith(color: HexColor("414141")),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "Today",
                      style: GoogleFonts.roboto(textStyle: productTitle)
                          .copyWith(color: formTextColor, fontSize: 14),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Welcome to Sahoolatkar! Use promocode 'tahnewn' to get 15% discount on your first purchase. Order now and get all your household essentials delivered in 45 minutes. Offer valid for 24 hours.",
                  style: GoogleFonts.roboto()
                      .copyWith(color: HexColor("414141"), fontSize: 14),
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 30,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 1.0, color: loginButtonColor),
                        shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1.0, color: loginButtonColor),
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      child: Text(
                        "Apply",
                        style: GoogleFonts.roboto()
                            .copyWith(color: loginButtonColor, fontSize: 13),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
