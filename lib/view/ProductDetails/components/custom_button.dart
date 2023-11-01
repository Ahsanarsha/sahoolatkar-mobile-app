import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saholatkar/const/theme.dart';

class CustomButton extends StatelessWidget {
  final iconLink;
  const CustomButton({Key? key, required this.iconLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: formTextColor, width: 1)),
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: SvgPicture.asset(iconLink,
              width: 17.91, height: 17.91, semanticsLabel: 'more'),
        ),
      ),
    );
  }
}
class CustomButton2 extends StatelessWidget {
  final iconLink;
  const CustomButton2({Key? key, required this.iconLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: formTextColor, width: 1)),
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: Image.asset(iconLink,
              width: 17.91, height: 17.91),
        ),
      ),
    );
  }
}
