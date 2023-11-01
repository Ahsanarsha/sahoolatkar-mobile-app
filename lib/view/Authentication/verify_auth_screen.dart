import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pinput/pinput.dart';
import 'package:get/get.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/controller/Authentication/authentication_controller.dart';
import 'package:saholatkar/view/Authentication/login_screen.dart';
import 'package:saholatkar/view/profile/components/TwoFactorAuthentication/auth_success_screen.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';
import 'package:saholatkar/widgets/custome_button_without_bold.dart';

class VerifyAuthScreen extends StatelessWidget {
  VerifyAuthScreen({Key? key,required this.mail,required this.id}) : super(key: key);
  String mail = '';
  int id = -1;
  TextEditingController pinController = TextEditingController();

  String otp = '';

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
                height: MediaQuery
                    .of(context)
                    .size
                    .height - 100,
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
                        const SizedBox(height: 30),
                        Text(
                          "Enter the 4 digits code sent to your email address",
                          style: GoogleFonts.roboto(textStyle: productTitle)
                              .copyWith(color: HexColor("414141")),
                          // maxLines: 1,
                          // overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 1.5,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Pinput(
                                  defaultPinTheme: defaultPinTheme,
                                  controller: pinController,
                                  showCursor: true,
                                  autofocus: true,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('^[0-9]+|r'))
                                  ],
                                  onCompleted: (pin) {
                                    showDialog(
                                        barrierDismissible: false,
                                        context: context, builder: (context){
                                      return Center(child: CircularProgressIndicator(color: loginButtonColor),);
                                    });
                                    print(pin);
                                    AuthenticationController().verifyCode(
                                        int.parse(pin),context).then((value) => {
                                      Navigator.pop(context),
                                      Get.snackbar('Success', 'OTP Verified'),
                                      Get.offAll(() =>
                                      const LoginScreen())
                                    });

                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        CustomButtonWithoutBold(
                          textColor: Colors.white,
                          textValue: "VERIFY",
                          buttonColor: loginButtonColor,
                          onPressed: () async {
                            AuthenticationController().verifyCode( int.parse(pinController.text),context).then((value){
                              Get.snackbar('Success', 'OTP Verified');
                              Get.offAll(() =>
                              const LoginScreen());
                            });

                          },
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: RichText(
                            text: TextSpan(
                              text: 'Didn’t get the OTP?',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: formTextColor,
                                  fontSize: 15,
                                ),
                              ),
                              children: [
                                TextSpan(
                                  text: '  Resend',
                                  style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                    ),
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {

                                      AuthenticationController()
                                          .sendOtp(mail);
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                        AuthenticationController().isSending ? CircularProgressIndicator() : SizedBox()
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  final defaultPinTheme = const PinTheme(
    width: 40,
    height: 40,
    textStyle: TextStyle(
        fontSize: 18,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 1.0,
          )),
      // border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
      // borderRadius: BorderRadius.circular(0),
    ),
  );
}
