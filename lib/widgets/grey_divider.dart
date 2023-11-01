import 'package:flutter/material.dart';
import 'package:saholatkar/const/theme.dart';

class GreyDivider extends StatelessWidget {
  const GreyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Divider(
        thickness: 1.0,
        color: formTextColor.withOpacity(0.40),
      ),
    );
  }
}
