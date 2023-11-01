import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/controller/UserProfile/user_profile.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';
import 'package:saholatkar/widgets/custome_button_without_bold.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  final userController = Get.find<UserProfileController>();
  final _changePasswordFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const BackNavigatorWithoutText()),
        backgroundColor: Colors.white,
        title: const Text(
          "Change Password",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: GetBuilder<UserProfileController>(
            init: UserProfileController(),
            builder: (userController) => Form(
              key: _changePasswordFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 40),
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(15.91),
                                child: SvgPicture.asset(
                                    "assets/svg_icons/password.svg",
                                    semanticsLabel: '')),
                            Flexible(
                              child: TextFormField(
                                controller: userController.passwordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Current Password field required';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  suffixIcon: Icon(Icons.remove_red_eye),
                                  hintText: "Current Password",
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
                                    semanticsLabel: '')),
                            Flexible(
                              child: TextFormField(
                                controller:
                                    userController.newPasswordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'New Password field required';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  suffixIcon: Icon(Icons.remove_red_eye),
                                  hintText: "New Password",
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
                                    semanticsLabel: '')),
                            Flexible(
                              child: TextFormField(
                                controller:
                                    userController.confirmedPasswordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Re-Enter Password field required';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  suffixIcon: Icon(Icons.remove_red_eye),
                                  hintText: "Re-Enter New Password",
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: CustomButtonWithoutBold(
                            textColor: Colors.white,
                            textValue: "Change Password",
                            buttonColor: loginButtonColor,
                            onPressed: () async {
                              if (_changePasswordFormKey.currentState!
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

                                await userController.changePassword(
                                    currentPassword:
                                        userController.passwordController.text,
                                    newPassword: userController
                                        .newPasswordController.text,
                                    confirmedPassword: userController
                                        .confirmedPasswordController.text);
                                // Get.back();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Please fill all fields')),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
