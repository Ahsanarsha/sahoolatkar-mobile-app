import 'package:flutter/material.dart';
import 'package:saholatkar/view/HelpAndSupport/webview.dart';
import 'package:saholatkar/view/profile/components/list_tile_cell.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';


class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const BackNavigatorWithoutText()),
        backgroundColor: Colors.white,
        title: const Text(
          "Help And Support",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Card(
                  elevation: 5,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      ListTileCell(
                          iconLink:
                              "assets/svg_icons/profile/terms_condition.svg",
                          title: "Terms & Conditions",
                          isLastTile: false,
                          ontapFunction: () {
                            Navigator.of(context).
                            push(MaterialPageRoute(builder: (BuildContext contet)
                            => WebViewScreen(url:'https://staging.sahoolatkar.com/terms-conditions',)));
                          }),
                      ListTileCell(
                          iconLink: "assets/svg_icons/profile/sharia.svg",
                          title: "Privacy Policy",
                          isLastTile: false,
                          ontapFunction: () {
                            Navigator.of(context).
                            push(MaterialPageRoute(builder: (BuildContext contet)
                            => WebViewScreen(url:'https://staging.sahoolatkar.com/mobile-privacy-policy',)));
                          }),
                      ListTileCell(
                          iconLink: "assets/svg_icons/profile/faq.svg",
                          title: "Return & Cancellation Policy",
                          isLastTile: true,
                          ontapFunction: () {
                            Navigator.of(context).
                            push(MaterialPageRoute(builder: (BuildContext contet)
                            => WebViewScreen(url:'https://staging.sahoolatkar.com/return-policy',)));
                          }),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
