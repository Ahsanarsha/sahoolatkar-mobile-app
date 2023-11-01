import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/const/theme.dart';

class ListTileCell extends StatelessWidget {
  final iconLink;
  final title;
  final isLastTile;
  final ontapFunction;
  const ListTileCell(
      {Key? key,
      required this.iconLink,
      required this.title,
      required this.isLastTile,
      required this.ontapFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ListTile(
            onTap: ontapFunction,
            dense: true,
            horizontalTitleGap: 5.0,
            contentPadding: EdgeInsets.zero,
            leading: SvgPicture.asset(iconLink,
                width: 17.91, height: 17.91, semanticsLabel: ''),
            title: Text(
              title,
              style: GoogleFonts.roboto()
                  .copyWith(color: HexColor("414141"), fontSize: 14),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 20),
          ),
        ),
        isLastTile
            ? Container()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Divider(
                  thickness: 1.0,
                  color: formTextColor.withOpacity(0.40),
                ),
              ),
      ],
    );
  }
}
