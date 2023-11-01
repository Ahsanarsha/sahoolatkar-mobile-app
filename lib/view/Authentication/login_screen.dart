import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/controller/Authentication/authentication_controller.dart';
import 'package:saholatkar/view/Authentication/forget_password.dart';
import 'package:saholatkar/view/Authentication/signup_screen.dart';
import 'package:saholatkar/widgets/authentication_title.dart';
import 'package:saholatkar/widgets/custome_border_button.dart';
import 'package:saholatkar/widgets/custome_primary_button.dart';

import '../../utility/validate.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  bool _obscured = true;
  final textFieldFocusNode = FocusNode();
  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: GetBuilder<AuthenticationController>(
          // specify type as Controller
          init: AuthenticationController(), // intialize with the Controller

          builder: (loginController) => Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Center(
                    child: Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: AuthenticationTitle(title: "Login"),
                )),
                Padding(
                  padding: const EdgeInsets.only(top: 53.0),
                  child: SvgPicture.asset("assets/svg_icons/login.svg",
                      width: 122, height: 122, semanticsLabel: 'Login'),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(15.91),
                        child: SvgPicture.asset("assets/svg_icons/email.svg",
                            // width: 11.91, height: 16.91,
                            semanticsLabel: 'email')),
                    Flexible(
                      child: TextFormField(
                        controller: loginController.loginEmailController,
                        validator: (value) => validateEmail(value),
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                          loginController.email = value.toString();
                        },
                        decoration: const InputDecoration(
                          hintText: "Email ID",
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
                        child: SvgPicture.asset("assets/svg_icons/password.svg",
                            semanticsLabel: 'password')),
                    Flexible(
                      child: TextFormField(
                        controller: loginController.loginPasswordController,
                        obscureText: _obscured,
                        focusNode: textFieldFocusNode,
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Password field required';
                        //   }
                        //   return null;
                        // },
                        onSaved: (value) {
                          loginController.password = value.toString();
                        },
                        decoration: InputDecoration(
                          // filled: true,

                          suffixIcon: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                            child: GestureDetector(
                              onTap: _toggleObscured,
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ForgetPasswordScreen()),
                        );
                      },
                      child: Text("Forgot Password?",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: loginTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () async {
                    if(validateEmail(loginController.loginEmailController.text) == 'Enter a valid email address'){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Enter a valid email address')),
                      );
                    }else
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

                      await loginController.login(
                          loginController.loginEmailController.text,
                          loginController.loginPasswordController.text);
                      // Get.back();

                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please fill all fields')),
                      );
                    }
                    //kamal
                  },
                  child: CustomPrimaryButton(
                    buttonColor: HexColor("DB0A0A"),
                    textValue: 'Login',
                    textColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child:
                            Divider(thickness: 0.7, color: loginButtonColor)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "OR",
                        style: TextStyle(
                            color: formTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Flexible(
                        child:
                            Divider(thickness: 0.7, color: loginButtonColor)),
                  ],
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()),
                    );
                  },
                  child: CustomeBorderButton(
                    borderColor: loginButtonColor,
                    textColor: loginButtonColor,
                    textValue: 'Sign Up',
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ))),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Privacy policy",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: loginButtonColor,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "|",
                style: TextStyle(
                    color: loginButtonColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text("Terms & conditions",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: loginButtonColor,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
