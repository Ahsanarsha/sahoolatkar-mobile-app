import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/const/fonts.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/controller/Trasnlation/translation_controller.dart';

final TranslationController _translationController =
    Get.find<TranslationController>();

Widget formInfoText(String title) => Text(
      title,
      style: GoogleFonts.roboto().copyWith(
          color: HexColor("414141"),
          fontSize: 16,
          fontFamily: _translationController.selectedLanguage.value == "ur"
              ? formUrduFont
              : null),
      // maxLines: 1,
      // overflow: TextOverflow.ellipsis,
    );
Widget formFieldTitle({required String title, String color = "414141"}) => Text(
      title,
      style: GoogleFonts.roboto(textStyle: productTitle).copyWith(
          color: HexColor(color),
          fontFamily: _translationController.selectedLanguage.value == "ur"
              ? formUrduFont
              : null,
          letterSpacing: _translationController.selectedLanguage.value == "ur"
              ? 1.5
              : null),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );

Widget formThumbTitle({required String title, String color = "DB0A0A"}) => Text(
      title,
      style: GoogleFonts.roboto(textStyle: productTitle).copyWith(
          color: HexColor(color),
          fontFamily: _translationController.selectedLanguage.value == "ur"
              ? formUrduFont
              : null),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
