import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/controller/Authentication/authentication_controller.dart';
import 'package:saholatkar/helper/BlocUserProfile.dart';
import 'package:saholatkar/model/userProfile/user_profile.dart';
import 'package:saholatkar/utility/validate.dart';
import 'package:saholatkar/view/profile/components/TwoFactorAuthentication/verify_email_auth_screen.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';
import 'package:saholatkar/widgets/custome_button_without_bold.dart';

class EmailAuthScreen extends StatefulWidget {
  EmailAuthScreen({Key? key}) : super(key: key);

  @override
  State<EmailAuthScreen> createState() => _EmailAuthScreenState();
}

class _EmailAuthScreenState extends State<EmailAuthScreen> {
  final _bankFormKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    emailController.text = blocUserProfile.viewModelUser.data![0].email.toString();
    super.initState();
  }
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
          child: Form(
            key: _bankFormKey,
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
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Text(
                            "Enter your Email ID",
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
                                      "assets/svg_icons/email.svg",
                                      // width: 11.91, height: 16.91,
                                      semanticsLabel: 'email')),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: AbsorbPointer(
                                    absorbing: true,
                                    child: TextFormField(
                                      controller: emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) => validateEmail(value),
                                      decoration: const InputDecoration(
                                        hintText: "Email",
                                        border: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
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
                                  .sendOtp(emailController.text.toString()).then((value) => {
                                Navigator.pop(context),
                                   Get.to(()=> VerifyEmailAuthScreen(mail: emailController.text.toString(),))

                               });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
