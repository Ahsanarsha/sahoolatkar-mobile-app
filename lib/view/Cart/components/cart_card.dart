import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/const/theme.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        elevation: 5,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        //    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12, right: 12, top: 2, bottom: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.clear,
                    size: 25,
                    color: formTextColor,
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: formTextColor.withOpacity(0.15), width: 2),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 30),
                      child: Center(
                        child: Container(
                          height: 90.0,
                          width: 90.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/home_screen/oven_update.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Microwave Oven",
                            style: GoogleFonts.roboto(textStyle: productTitle)
                                .copyWith(color: HexColor("414141")),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "SKU: DW-210 S",
                            style: GoogleFonts.roboto(textStyle: heading8)
                                .copyWith(color: formTextColor, fontSize: 12),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Rs 42,700 - Cash",
                            style: GoogleFonts.roboto(textStyle: heading8)
                                .copyWith(
                                    color: HexColor("7C7C7C"),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Rs 1,500 / month for 3 months",
                            style: GoogleFonts.roboto(textStyle: heading8)
                                .copyWith(
                                    color: loginButtonColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Rs 9,400",
                            style: GoogleFonts.roboto(textStyle: productTitle)
                                .copyWith(color: HexColor("414141")),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(width: 10),

                           // AddRemoveCell(
                           //    buttonHight: 30.0, horizontalPadding: 5.0)
                        ],
                      )
                    ],
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
