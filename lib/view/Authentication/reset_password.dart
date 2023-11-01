import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pinput/pinput.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/controller/Authentication/authentication_controller.dart';
import 'package:saholatkar/widgets/authentication_title.dart';
import 'package:saholatkar/widgets/back_navigator.dart';
import 'package:saholatkar/widgets/custome_primary_button.dart';

import 'login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  String? email;
  ResetPasswordScreen({Key? key,this.email}) : super(key: key,);


  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController pinController = TextEditingController();
  final AuthenticationController authController = Get.find();
  final _resetFormKey = GlobalKey<FormState>();
  final textFieldFocusNode = FocusNode();
  final textFieldFocusNode2 = FocusNode();
  bool _obscured = true;
  bool _obscured2 = true;
  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
      false; // Prevents focus if tap on eye
    });
  }
  void _toggleObscured2() {
    setState(() {
      _obscured2 = !_obscured2;
      if (textFieldFocusNode2.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode2.canRequestFocus =
      false; // Prevents focus if tap on eye
    });
  }
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Future.delayed(const Duration(seconds: 1), () {
          showAlertDialog(context);
        });
      },
    );

    super.initState();
  }

  var inputpin = '';
  final defaultPinTheme = PinTheme(
    width: 35,
    height: 35,
    textStyle: const TextStyle(
        fontSize: 14,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(0),
    ),
  );

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
          onPrimary: Colors.black87,
          primary: Colors.white,
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.0, color: loginButtonColor),
              borderRadius: BorderRadius.circular(10.0))),
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.white,
        primary: loginButtonColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      child: const Text("verify"),
      onPressed: () {
        if (inputpin.isNotEmpty) {
          var myPin = int.parse(inputpin);
          authController.resetCode(widget.email.toString(),myPin);
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      actionsPadding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
      contentPadding: const EdgeInsets.only(bottom: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      title: Center(
          child: Text(
        "Verification",
        style: TextStyle(color: loginButtonColor),
      )),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 3),
            child: Divider(
              thickness: 1.0,
              color: formTextColor.withOpacity(0.40),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 12),
            child: Text("Enter the code sent to mail"),
          ),
          Pinput(
            defaultPinTheme: defaultPinTheme,
            length: 6,
            controller: pinController,
            showCursor: true,
            autofocus: true,
            validator: (s) {
              return s!.length == 6 ? null : 'Pin is uncomplete';
            },
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('^[0-9]+|r'))
            ],
            onCompleted: (pin) {
              setState(() {
                inputpin = pin;
              });
            },
          ),
        ],
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Form(
              key: _resetFormKey,
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
                    padding: EdgeInsets.only(top: 50.0),
                    child: AuthenticationTitle(title: "Reset Password"),
                  )),
                  const SizedBox(height: 40),
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
                          controller: authController.passwordController,
                          focusNode: textFieldFocusNode,
                          obscureText:_obscured,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password field required';
                            }
                            return null;
                          },
                          decoration:  InputDecoration(
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
                          controller:
                              authController.confirmedPasswordController,
                          focusNode: textFieldFocusNode2,
                          obscureText:_obscured2,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Confirm Password field required';
                            }
                            return null;
                          },
                          decoration:  InputDecoration(
                            suffixIcon: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                              child: GestureDetector(
                                onTap: _toggleObscured2,
                                child: Icon(
                                  _obscured2
                                      ? Icons.visibility_off_rounded
                                      : Icons.visibility_rounded,
                                  size: 24,
                                ),
                              ),
                            ),
                            hintText: "Confirm Password",
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () async {
                      if (_resetFormKey.currentState!.validate()) {
                        if(authController.passwordController.text == authController.confirmedPasswordController.text)

                        {showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (dialogContext) {
                            return Center(
                            child: SpinKitFadingCircle(
                            color: loginButtonColor,
                            size: 50,
                        ));
                        });
                        await authController.resetPassword(
                            widget.email,
                            authController.passwordController.text,
                            authController.confirmedPasswordController.text)
                            .then((value) {
                          Navigator.pop(context);
                          Get.snackbar(
                              "Message", "The password was successfully reset");
                          Get.off(() => const LoginScreen());
                        });
                      }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Password not matched')),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Please fill all fields')),
                        );
                      }
                    },
                    child: CustomPrimaryButton(
                      buttonColor: HexColor("DB0A0A"),
                      textValue: 'Submit',
                      textColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
