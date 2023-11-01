import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saholatkar/const/fonts.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/controller/Trasnlation/translation_controller.dart';

class CustomeBigHeader extends StatelessWidget {
  CustomeBigHeader({Key? key, required this.title, required this.color})
      : super(key: key);
  final TranslationController _translationController =
      Get.find<TranslationController>();
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: GoogleFonts.roboto(
          color: color,
          textStyle: heading3,
        ).copyWith(
            fontFamily: _translationController.selectedLanguage.value == "ur"
                ? formUrduFont
                : null));
  }
}
