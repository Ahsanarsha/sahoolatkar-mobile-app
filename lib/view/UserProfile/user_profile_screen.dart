import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/controller/UserProfile/user_profile.dart';
import 'package:saholatkar/utility/validate.dart';
import 'package:saholatkar/view/Authentication/change_password.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';
import 'package:saholatkar/widgets/custome_primary_button.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  var userController = Get.find<UserProfileController>();

  // Defining the focus node
  late FocusNode focusName;
  late FocusNode focusPhone;
  late FocusNode focusEmail;
  late FocusNode focusGender;

  final _userProfileFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    focusName = FocusNode();
    focusPhone = FocusNode();
    focusEmail = FocusNode();
    focusGender = FocusNode();

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {},
    );
  }

  @override
  void dispose() {
    focusName.dispose();
    focusPhone.dispose();
    focusEmail.dispose();
    focusGender.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // elevation: 0.0,
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const BackNavigatorWithoutText()),
          backgroundColor: Colors.white,
          title: const Text(
            "Profile",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: GetBuilder<UserProfileController>(
              builder: (userController) => Form(
                key: _userProfileFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Profile",
                            style: GoogleFonts.roboto(textStyle: heading8)
                                .copyWith(
                                    color: HexColor("414141"),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          GestureDetector(
                            onTap: () {
                              userController.checkIsEdit();

                              if (userController.isEditMode == true) {
                                FocusScope.of(context).unfocus();
                              }
                              if (userController.isEditMode == false) {
                                focusName.requestFocus();
                              }
                            },
                            child: SizedBox(
                              child: Text(
                                userController.isEditMode == true
                                    ? "Edit"
                                    : "Cancel",
                                style: GoogleFonts.roboto(textStyle: heading8)
                                    .copyWith(
                                        color: loginButtonColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.0),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(13.91),
                            child: SvgPicture.asset("assets/svg_icons/user.svg",
                                width: 17.91,
                                height: 17.91,
                                semanticsLabel: 'email')),
                        Flexible(
                          child: TextFormField(
                            readOnly: userController.isEditMode,
                            controller: userController.fullnameController,
                            focusNode: focusName,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Full Name field required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: "Full Name",
                                hintText: "",
                                labelStyle: TextStyle(color: formTextColor),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always),
                            onFieldSubmitted: (value) {
                              focusPhone.requestFocus();
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(13.91),
                            child: SvgPicture.asset(
                                "assets/svg_icons/phone.svg",
                                width: 17.91,
                                height: 17.91,
                                semanticsLabel: '')),
                        Flexible(
                          child: TextFormField(
                            readOnly: userController.isEditMode,
                            controller: userController.phoneController,
                            focusNode: focusPhone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Mobile Number field required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Mobile Number",
                              hintText: "",
                              labelStyle: TextStyle(color: formTextColor),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                            ),
                            onFieldSubmitted: (value) {
                              focusEmail.requestFocus();
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(13.91),
                            child: SvgPicture.asset(
                                "assets/svg_icons/email.svg",
                                width: 17.91,
                                height: 17.91,
                                semanticsLabel: '')),
                        Flexible(
                          child: TextFormField(
                            readOnly: userController.isEditMode,
                            controller: userController.emailController,
                            focusNode: focusEmail,
                            validator: (value) => validateEmail(value),
                            decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "",
                              labelStyle: TextStyle(color: formTextColor),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                            ),
                            onFieldSubmitted: (value) {
                              focusGender.requestFocus();
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.91),
                            child: SvgPicture.asset(
                                "assets/svg_icons/gender.svg",
                                width: 17.91,
                                height: 17.91,
                                semanticsLabel: '')),
                        Flexible(
                          child: TextFormField(
                            readOnly: true,
                            focusNode: focusGender,
                            decoration: InputDecoration(
                              labelText: "Gender",
                              hintText: "Male",
                              labelStyle: TextStyle(color: formTextColor),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangePasswordScreen()),
                        );
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/svg_icons/password.svg",
                              width: 17.91, height: 17.91, semanticsLabel: ''),
                          const SizedBox(width: 10),
                          Text(
                            "Change Password",
                            style: GoogleFonts.roboto(textStyle: productTitle)
                                .copyWith(color: HexColor("414141")),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    userController.isEditMode
                        ? Container()
                        : GestureDetector(
                            onTap: () async {
                              if (_userProfileFormKey.currentState!
                                  .validate()) {
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

                                await userController.updateProfile(
                                    userController.fullnameController.text,
                                    userController.emailController.text,
                                    userController.phoneController.text);
                                // Get.back();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Please fill all fields')),
                                );
                              }
                            },
                            child: CustomPrimaryButton(
                              buttonColor: HexColor("DB0A0A"),
                              textValue: 'Update',
                              textColor: Colors.white,
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget fieldTitle({required String title}) => Text(
        title,
        style: GoogleFonts.roboto(textStyle: productTitle)
            .copyWith(color: HexColor("414141"), fontSize: 14),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
}
