import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saholatkar/const/theme.dart';

class AuthenticationTitle extends StatelessWidget {
  const AuthenticationTitle({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: GoogleFonts.roboto(
          textStyle: heading2,
        ));
  }
}
