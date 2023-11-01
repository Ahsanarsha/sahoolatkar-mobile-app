import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/controller/ProfileMenu/AccountLevel/personal_controller.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/helper/BlocUserProfile.dart';
import 'package:saholatkar/model/accountLevel/account_level.dart';
import 'package:saholatkar/utility/validate.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';
import 'package:saholatkar/widgets/custome_button_without_bold.dart';

import '../../controller/ProfileMenu/AccountLevel/account_level_controller.dart';

class PersonalScreen extends StatefulWidget {
  final PersonalData personal;
  const PersonalScreen({Key? key, required this.personal}) : super(key: key);

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  final _personalFormKey = GlobalKey<FormState>();
  PersonalController personalController = Get.put(PersonalController());
  AccountLevelController controller = Get.find<AccountLevelController>();
  String initialString = '';
  String name = '';
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        personalController.initFormData(widget.personal);
        print(controller.model.records);
        if(controller.model.records!=null && controller.model.records!.isNotEmpty ) {
          if(controller.model.records![0].personalInfo!=null) {
            initialString = controller.model.records![0].personalInfo
                .toString()
                .replaceAll("{", "")
                .replaceAll("}", "");

            name = initialString
                .substring(
                    initialString.indexOf(': ') + 1, initialString.indexOf(','))
                .trim();
            personalController.fullnameController.text = name;
            personalController.emailController.text = initialString.substring(
                initialString.indexOf('email: ') + 7,
                initialString.indexOf(', phone:'));
            personalController.phoneController.text = initialString.substring(
                initialString.indexOf('phone: ') + 7,
                initialString.indexOf(', address:'));
            personalController.addressController.text =
                initialString.substring(initialString.indexOf('address:') + 9);
            print(
                initialString.substring(initialString.indexOf('address:') + 9));
          }
        }
      },
    );
    super.initState();
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
          "Personal",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Form(
            key: _personalFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                fieldTitle(title: "Full Name"),
                const SizedBox(height: 10),
                Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    controller: personalController.fullnameController,
                    validator: (value) =>
                        validateField(value: value!, fieldName: "Full Name"),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s]*$')),
                    ],
                    keyboardType: TextInputType.text,
                    onSaved: (value) {},
                    decoration: InputDecoration(
                      hintText: '',
                      hintStyle: emailHint,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: textlightGrey,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: textlightGrey,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                fieldTitle(title: "Email ID"),
                const SizedBox(height: 10),
                Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    controller: personalController.emailController,
                    onSaved: (value) {},
                    validator: (value) => validateEmail(value),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: '',
                      hintStyle: emailHint,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: textlightGrey,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: textlightGrey,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                fieldTitle(title: "Mobile"),
                const SizedBox(height: 10),
                Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    controller: personalController.phoneController,
                    onSaved: (value) {},
                    validator: (value) =>
                        validateField(value: value!, fieldName: "Mobile"),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[+|0-9]')),
                      LengthLimitingTextInputFormatter(13),
                    ],
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: '',
                      hintStyle: emailHint,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: textlightGrey,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: textlightGrey,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                fieldTitle(title: "Address"),
                const SizedBox(height: 10),
                Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    controller: personalController.addressController,
                    onSaved: (value) {},
                    validator: (value) =>
                        validateField(value: value!, fieldName: "Address"),
                    decoration: InputDecoration(
                      hintText: '',
                      hintStyle: emailHint,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: textlightGrey,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: textlightGrey,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                widget.personal.id != 0
                    ? CustomButtonWithoutBold(
                        textColor: Colors.white,
                        textValue: "Update",
                        buttonColor: HexColor("1BCB5D"),
                        onPressed: () async {
                          if (_personalFormKey.currentState!.validate()) {
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
                            var model =
                            {
                              "fullname":  personalController.fullnameController.text,
                              "email":   personalController.emailController.text,
                              "phone": personalController.phoneController.text,
                              "address": personalController.addressController.text,
                            };


                            await personalController.updateMyPersonal(
                                personalController.fullnameController.text,
                                personalController.emailController.text,
                                personalController.phoneController.text,
                                personalController.addressController.text,
                                context,
                                id: blocUserProfile.viewModelUser.data![0].id.toString());
                            Get.back();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please fill all fields')),
                            );
                          }
                        },
                      )
                    : Container(),
                const SizedBox(height: 10),
                CustomButtonWithoutBold(
                  textColor: Colors.white,
                  textValue: widget.personal.id != 0 ? "Next" : "Add",
                  buttonColor: HexColor("1BCB5D"),
                  onPressed: () async {
                    if (widget.personal.id != 0) {
                    } else {
                      if (_personalFormKey.currentState!.validate()) {
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


                        await personalController.updateMyPersonal(
                            personalController.fullnameController.text,
                            personalController.emailController.text,
                            personalController.phoneController.text,
                            personalController.addressController.text,
                            context,
                            id: blocUserProfile.viewModelUser.data![0].id.toString());
                        // Get.back();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Please fill all fields')),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget fieldTitle({required String title}) => Text(
        title,
        style: GoogleFonts.roboto(textStyle: productTitle)
            .copyWith(color: HexColor("414141")),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
}
