import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/controller/Authentication/authentication_controller.dart';
import 'package:saholatkar/view/Authentication/login_screen.dart';
import 'package:saholatkar/widgets/authentication_title.dart';
import 'package:saholatkar/widgets/back_navigator.dart';
import 'package:saholatkar/widgets/custome_primary_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utility/validate.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  void _toggleObscured_password() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  void _toggleObscuredconfirmpassword() {
    setState(() {
      _obscured_tow = !_obscured_tow;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  bool _obscured_tow = true;
  bool _obscured = false;
  final textFieldFocusNode = FocusNode();
  final Uri _url = Uri.parse('https://flutter.dev');
  void _launchUrl() async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                child: GetBuilder<AuthenticationController>(
                  // specify type as Controller
                  init:
                      AuthenticationController(), // intialize with the Controller
                  builder: (loginController) => Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const BackNavigator()),
                        const Center(
                            child: Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: AuthenticationTitle(title: "Sign Up"),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(top: 53.0),
                          child: SvgPicture.asset("assets/svg_icons/login.svg",
                              width: 122,
                              height: 122,
                              semanticsLabel: 'Sign Up'),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                                padding: EdgeInsets.all(15.91),
                                child: SvgPicture.asset(
                                    "assets/svg_icons/email.svg",
                                    // width: 11.91, height: 16.91,
                                    semanticsLabel: 'email')),
                            Flexible(
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: loginController.emailController,
                                validator: (value) => validateEmail(value),
                                decoration: const InputDecoration(
                                  hintText: "Email ID",
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  //  OutlineInputBorder(
                                  //   borderRadius: BorderRadius.circular(10),
                                  //   borderSide:
                                  //   const BorderSide(
                                  //     width: 0,
                                  //     style: BorderStyle.solid,
                                  //   ),
                                  // ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(15.91),
                                child: SvgPicture.asset(
                                    "assets/svg_icons/user.svg",
                                    // width: 11.91, height: 16.91,
                                    semanticsLabel: 'full name')),
                            Flexible(
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: loginController.fullNameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Full Name';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintText: "Full name",
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
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
                              child: TextFormField(
                                controller: loginController.phoneController,
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
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(15.91),
                                child: SvgPicture.asset(
                                    "assets/svg_icons/password.svg",
                                    semanticsLabel: 'password')),
                            Flexible(
                              child: TextFormField(
                                obscureText: _obscured,
                                keyboardType: TextInputType.visiblePassword,
                                controller: loginController.passwordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Password';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  suffixIcon: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                    child: GestureDetector(
                                      onTap: _toggleObscured_password,
                                      child: Icon(
                                        _obscured
                                            ? Icons.visibility_off_rounded
                                            : Icons.visibility_rounded,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                  hintText: "Password",
                                  border: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(15.91),
                                child: SvgPicture.asset(
                                    "assets/svg_icons/password.svg",
                                    semanticsLabel: 'password')),
                            Flexible(
                              child: TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                controller:
                                    loginController.confirmedPasswordController,
                                obscureText: _obscured_tow,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Password';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  suffixIcon: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                    child: GestureDetector(
                                      onTap: _toggleObscuredconfirmpassword,
                                      child: Icon(
                                        _obscured_tow
                                            ? Icons.visibility_off_rounded
                                            : Icons.visibility_rounded,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                  hintText: "Confirm Password",
                                  border: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: RichText(
                            text: TextSpan(
                              text: 'By signing up, you’re agree to our ',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: formTextColor,
                                  fontSize: 15,
                                ),
                              ),
                              children: [
                                TextSpan(
                                  text: 'Terms & Conditions',
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      color: loginTextColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      _launchUrl();
                                    },
                                ),
                                TextSpan(
                                    text: ' and ',
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        color: formTextColor,
                                        fontSize: 15,
                                      ),
                                    )),
                                TextSpan(
                                  text: 'privacy Policy',
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      color: loginTextColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      _launchUrl();
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (dialogContext) {
                                      return Center(
                                          child: SpinKitFadingCircle(
                                        color: loginButtonColor,
                                        size: 50,
                                      ));
                                    });
                                await loginController.register();
                                // Get.back();
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => const BottemNavigationScreen()),
                                // );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(' field is Empty')),
                                );
                              }
                              //kamal
                            },
                            child: CustomPrimaryButton(
                              buttonColor: HexColor("DB0A0A"),
                              textValue: 'Sign Up',
                              textColor: Colors.white,
                            )),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: RichText(
                            text: TextSpan(
                              text: 'Joined us before ? ',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: formTextColor,
                                  fontSize: 15,
                                ),
                              ),
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen()),
                                      );
                                    },
                                  text: 'Login',
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      color: loginTextColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        )));
  }
}
