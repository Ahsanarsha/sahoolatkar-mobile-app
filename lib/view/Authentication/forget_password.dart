import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/view/Authentication/login_screen.dart';
import 'package:saholatkar/widgets/authentication_title.dart';
import 'package:saholatkar/widgets/back_navigator.dart';
import 'package:saholatkar/widgets/custome_primary_button.dart';

import '../../controller/Authentication/authentication_controller.dart';
import '../../utility/validate.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  void _moveToScreen2(BuildContext context) =>
      Get.off(() => const LoginScreen());
  final _loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _moveToScreen2(context);
        return true;
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: GetBuilder<AuthenticationController>(
                  builder: (forgetController) => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {
                            _moveToScreen2(context);
                          },
                          child: const BackNavigator()),
                      const Center(
                          child: Padding(
                        padding: EdgeInsets.only(top: 50.0),
                        child: AuthenticationTitle(title: "Forgot Password"),
                      )),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                            'Don’t worry! It happens. Please enter the email address associated with your account.',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                color: formTextColor,
                                fontSize: 15,
                              ),
                            )),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(15.91),
                              child:
                                  SvgPicture.asset("assets/svg_icons/email.svg",
                                      // width: 11.91, height: 16.91,
                                      semanticsLabel: 'email')),
                          Flexible(
                            child: Form(
                              key: _loginFormKey,
                              child: TextFormField(
                                validator: (value) => validateEmail(value),
                                controller:
                                    forgetController.forgetEmailController,
                                decoration: const InputDecoration(
                                  hintText: "Email ID",
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      const SizedBox(height: 15),
                      InkWell(
                          onTap: () async {
                             if (_loginFormKey.currentState!.validate()) {
                            showDialog(
                                barrierDismissible: false,
                                barrierColor: Colors.transparent,
                                context: context,
                                builder: (dialogContext) {
                                  return Center(
                                      child: SpinKitFadingCircle(
                                    color: loginButtonColor,
                                    size: 50,
                                  ));
                                });
                            await forgetController.forgetpassword(
                                forgetController.forgetEmailController.text);
                             }
                          },
                          child: CustomPrimaryButton(
                            buttonColor: HexColor("DB0A0A"),
                            textValue: 'Submit',
                            textColor: Colors.white,
                          )),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            )),
          )),
    );
  }
}
