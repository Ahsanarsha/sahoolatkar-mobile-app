import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/controller/ProfileMenu/AccountLevel/education_controller.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/model/accountLevel/account_level.dart';
import 'package:saholatkar/utility/validate.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';
import 'package:saholatkar/widgets/custome_button_without_bold.dart';

import '../../controller/ProfileMenu/AccountLevel/account_level_controller.dart';
import '../../helper/BlocUserProfile.dart';

class EducationScreen extends StatefulWidget {
  final EducationData education;
  const EducationScreen({Key? key, required this.education}) : super(key: key);

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  final _educationFormKey = GlobalKey<FormState>();
  final EducationController educationController = Get.find();
  AccountLevelController controller = Get.find<AccountLevelController>();
  String initialString = '';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {

        educationController.initFormData(widget.education);
        if(controller.model.records!=null && controller.model.records!.isNotEmpty ) {
          if(controller.model.records![0].education!=null){
            initialString = controller.model.records![0].education
                .toString()
                .replaceAll("{", "")
                .replaceAll("}", "");
            print(initialString);
            educationController.schoolController.text = initialString
                .substring(
                    initialString.indexOf(': ') + 1, initialString.indexOf(','))
                .trim();
            educationController.schoolYearController.text =
                initialString.substring(initialString.indexOf('year:') + 6,
                    initialString.indexOf(', degree:'));
            educationController.degreeController.text = initialString.substring(
                initialString.indexOf('degree:') + 8,
                initialString.indexOf(', degreeYear:'));
            educationController.degreeYearController.text = initialString
                .substring(initialString.indexOf('degreeYear:') + 12);
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
          "Education",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Form(
            key: _educationFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                fieldTitle(title: "School"),
                const SizedBox(height: 10),
                Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    controller: educationController.schoolController,
                    onSaved: (value) {},
                    validator: (value) =>
                        validateField(value: value!, fieldName: "School"),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s]*$')),
                    ],
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
                fieldTitle(title: "School Year"),
                const SizedBox(height: 10),
                Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    controller: educationController.schoolYearController,
                    onSaved: (value) {},
                    validator: (value) =>
                        validateField(value: value!, fieldName: "School Year"),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      LengthLimitingTextInputFormatter(4),
                    ],
                    keyboardType: TextInputType.number,
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
                fieldTitle(title: "Degree"),
                const SizedBox(height: 10),
                Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    controller: educationController.degreeController,
                    onSaved: (value) {},
                    validator: (value) =>
                        validateField(value: value!, fieldName: "Degree"),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s]*$')),
                    ],
                    keyboardType: TextInputType.text,
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
                fieldTitle(title: "Degree Year"),
                const SizedBox(height: 10),
                Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    controller: educationController.degreeYearController,
                    onSaved: (value) {},
                    validator: (value) =>
                        validateField(value: value!, fieldName: "Degree Year"),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      LengthLimitingTextInputFormatter(4),
                    ],
                    keyboardType: TextInputType.number,
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
                const SizedBox(height: 30),
                widget.education.id != 0
                    ? CustomButtonWithoutBold(
                        textColor: Colors.white,
                        textValue: "Update",
                        buttonColor: HexColor("1BCB5D"),
                        onPressed: () async {
                          if (_educationFormKey.currentState!.validate()) {
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
                            await educationController.addEducation(
                                educationController.schoolController.text,
                                educationController.schoolYearController.text,
                                educationController.degreeController.text,
                                educationController.degreeYearController.text,
                                blocUserProfile.viewModelUser.data![0].id.toString(),
                              context
                            );
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
                  textValue: widget.education.id != 0 ? "Next" : "Add",
                  buttonColor: HexColor("1BCB5D"),
                  onPressed: () async {
                    if (widget.education.id != 0) {
                    } else {
                      if (_educationFormKey.currentState!.validate()) {
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

                        await educationController.addEducation(
                          educationController.schoolController.text,
                          educationController.schoolYearController.text,
                          educationController.degreeController.text,
                          educationController.degreeYearController.text,
                            blocUserProfile.viewModelUser.data![0].id.toString(),context
                        );
                        Get.back();
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
