import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class DropDownShop extends StatefulWidget {
  DropDownShop(
      {Key? key,
      this.hintName,
      this.fontSize,
      this.isExpanded,
      this.locations,
      this.onChange})
      : super(key: key);

  String? hintName;
  Function(dynamic)? onChange;
  double? fontSize;
  bool? isExpanded = false;
  List<dynamic>? locations = [];

  @override
  _DropDownShopState createState() => _DropDownShopState();
}

class _DropDownShopState extends State<DropDownShop> {
  // Option 2
  String? _selectedLocation; // Option 2
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      iconSize: 22,
      decoration: const InputDecoration(
        enabledBorder: InputBorder.none,
        border: InputBorder.none,
        iconColor: Colors.black,
        focusedBorder: InputBorder.none,
        // enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),

      hint: Text(
        widget.hintName!,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(color: Colors.black38, fontSize: widget.fontSize),
        ),
      ),

      // Not necessary for Option 1
      value: _selectedLocation,
      onChanged: widget.onChange,
      isExpanded: widget.isExpanded!,
      items: widget.locations!.map((location) {
        return DropdownMenuItem(
          child: Text(location.title),
          value: location,
        );
      }).toList(),
    );
  }
}
