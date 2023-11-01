import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/view/profile/components/TwoFactorAuthentication/verify_mobile_auth_screen.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';
import 'package:saholatkar/widgets/custome_button_without_bold.dart';

import '../../../../controller/Authentication/authentication_controller.dart';

class MobileAuthScreen extends StatelessWidget {
   MobileAuthScreen({Key? key}) : super(key: key);
 final controller = TextEditingController();
   final _bankFormKey = GlobalKey<FormState>();
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Card(
                    elevation: 5,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Form(
                      key: _bankFormKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Text(
                            "Enter your phone number",
                            style: GoogleFonts.roboto(textStyle: productTitle)
                                .copyWith(color: HexColor("414141")),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(15.91),
                                  child: SvgPicture.asset(
                                      "assets/svg_icons/phone.svg",
                                      // width: 11.91, height: 16.91,
                                      semanticsLabel: 'mobile')),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: TextFormField(
                                    controller: controller,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter Mobile Number';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      hintText: "Mobile",
                                      border: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          CustomButtonWithoutBold(
                            textColor: Colors.white,
                            textValue: "NEXT",
                            buttonColor: loginButtonColor,
                            onPressed: () async {
                              if(_bankFormKey.currentState!.validate()) {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context, builder: (context){

                                  return Center(child: CircularProgressIndicator(color: loginButtonColor),);
                                });

                                AuthenticationController()
                                    .sendNoOtp(int.parse(controller.text.toString())).then((value) => {
                                  Navigator.pop(context),
                                Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder: (context) =>
                                VerifyMobileAuthScreen(no: int.parse(controller.text.toString()),)),
                                )

                                });

                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
