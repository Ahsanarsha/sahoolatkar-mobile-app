import 'package:flutter/material.dart';
import 'package:saholatkar/view/profile/components/TwoFactorAuthentication/email_auth_screen.dart';
import 'package:saholatkar/view/profile/components/TwoFactorAuthentication/mobile_auth_screen.dart';
import 'package:saholatkar/view/profile/components/list_tile_cell.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';

class TwoFactorAuthenticationScreen extends StatelessWidget {
  const TwoFactorAuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.2,
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const BackNavigatorWithoutText()),
          backgroundColor: Colors.white,
          title: const Text(
            "Two Factor Authentication",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Card(
                  elevation: 5,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      ListTileCell(
                          iconLink: "assets/svg_icons/mobile.svg",
                          title: "Authenticate your Phone Number",
                          isLastTile: false,
                          ontapFunction: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                       MobileAuthScreen()),
                            );
                          }),
                      ListTileCell(
                          iconLink: "assets/svg_icons/auth_mail.svg",
                          title: "Authenticate your Email Address",
                          isLastTile: true,
                          ontapFunction: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EmailAuthScreen()),
                            );
                          }),
                    ],
                  )),
            ),
          ],
        ));
  }
}
