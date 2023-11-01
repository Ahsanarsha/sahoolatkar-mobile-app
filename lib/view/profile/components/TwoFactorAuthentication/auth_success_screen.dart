import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/controller/Trasnlation/translation_controller.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';
import 'package:saholatkar/widgets/custom_big_header.dart';

import 'email_auth_screen.dart';

class AuthSuccessScreen extends StatelessWidget {
   AuthSuccessScreen({Key? key, required this.successMessage})
      : super(key: key);
  final String successMessage;
  final ct = Get.put(TranslationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.2,
          leading: GestureDetector(
              onTap: () {
                Get.off(()=>EmailAuthScreen());
              },
              child: const BackNavigatorWithoutText()),
          backgroundColor: Colors.white,
          title: const Text(
            "Two Factor Authentication",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 2,
                height: MediaQuery.of(context).size.height - 100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Card(
                    elevation: 5,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        CustomeBigHeader(
                            title: "Congratulations!", color: loginButtonColor),
                        const SizedBox(height: 10),
                        Text(
                          successMessage,
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: formTextColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        // const SizedBox(height: 12),

                        // CustomButtonWithoutBold(
                        //   textColor: Colors.white,
                        //   textValue: "NEXT",
                        //   buttonColor: loginButtonColor,
                        //   onPressed: () async {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) =>
                        //               VerifyMobileAuthScreen()),
                        //     );
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
