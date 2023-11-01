import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/view/ProductDetails/components/product_ratings.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';
import 'package:saholatkar/widgets/custome_button_without_bold.dart';

class WriteReview extends StatelessWidget {
  const WriteReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const BackNavigatorWithoutText()),
          backgroundColor: Colors.white,
          title: const Text(
            "Write A Review",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 80.0,
                        width: 80.0,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          // margin: const EdgeInsets.symmetric(horizontal: 12),
                          border: Border.all(
                              color: formTextColor.withOpacity(0.15), width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          image: const DecorationImage(
                            image: AssetImage(
                                "assets/images/home_screen/oven_update.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Microwave Oven",
                        style: GoogleFonts.roboto(textStyle: productTitle)
                            .copyWith(color: HexColor("414141")),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "What's your rating?",
                          style: GoogleFonts.roboto(textStyle: productTitle)
                              .copyWith(color: HexColor("414141")),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        const ProductRatings(),
                        const SizedBox(height: 25),
                        Text(
                          "How can we improve?",
                          style: GoogleFonts.roboto(textStyle: productTitle)
                              .copyWith(color: HexColor("414141")),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        Container(
                          // height: 44,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextFormField(
                            // validator: (value) =>
                            //     validateField(value: value!, fieldName: "Full Name"),
                            onSaved: (value) {},
                            // keyboardType: TextInputType.number,
                            maxLines: 8,
                            decoration: InputDecoration(
                              hintText: 'Experience',
                              hintStyle: emailHint,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: textlightGrey,
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: textlightGrey,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        CustomButtonWithoutBold(
                          textColor: Colors.white,
                          textValue: "SUBMIT",
                          buttonColor: HexColor("1BCB5D"),
                          onPressed: () async {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
