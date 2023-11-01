import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key, this.child, this.color, this.radius})
      : super(key: key);
  final Color? color;
  final Widget? child;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
          //  side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(radius!),
          side: BorderSide(color: Colors.grey[300]!)),
      elevation: 0.0,
      color: color,
      child: child,
    ));
  }
}
