import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RemoveButton extends StatelessWidget {
  final VoidCallback onPressed;
   RemoveButton({Key? key,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
        child: SvgPicture.asset("assets/svg_icons/product_details/remove.svg",
        width: 17.91, height: 17.91, semanticsLabel: 'more'));
  }
}

class AddButton extends StatelessWidget {
   AddButton({Key? key,required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: SvgPicture.asset("assets/svg_icons/product_details/add.svg",
        width: 17.91, height: 17.91, semanticsLabel: 'more'));
  }
}
