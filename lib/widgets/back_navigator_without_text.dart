import 'package:flutter/material.dart';

class BackNavigatorWithoutText extends StatelessWidget {
  const BackNavigatorWithoutText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.arrow_back_ios,
      color: Colors.black,
    );
  }
}
