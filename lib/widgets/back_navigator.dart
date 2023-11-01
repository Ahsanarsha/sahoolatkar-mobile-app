import 'package:flutter/material.dart';

class BackNavigator extends StatelessWidget {
  const BackNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        Text(
          'Back',
          style: TextStyle(
              // color: const Color(0xff4F1E88),
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
