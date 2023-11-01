import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saholatkar/Controller/ProfileMenu/AccountLevel/appointment_controller.dart';
import 'package:saholatkar/const/theme.dart';
import 'package:saholatkar/model/accountLevel/account_level.dart';
import 'package:saholatkar/utility/validate.dart';
import 'package:saholatkar/widgets/back_navigator_without_text.dart';
import 'package:saholatkar/widgets/custome_button_without_bold.dart';

class AppointmentScreen extends StatefulWidget {
  final AppointmentData appointment;
  const AppointmentScreen({Key? key, required this.appointment})
      : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final AppointmentController appointmentController = Get.find();
  final _appointmentFormKey = GlobalKey<FormState>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        appointmentController.initFormData(widget.appointment);
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
          "Appointment",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child:
              //  GetBuilder<AppointmentController>(
              //   init: AppointmentController(),
              //   builder: (appointmentController) =>

              Form(
            key: _appointmentFormKey,
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
                    controller: appointmentController.fullnameController,
                    validator: (value) =>
                        validateField(value: value!, fieldName: "Full Name"),
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
                    controller: appointmentController.emailController,
                    onSaved: (value) {},
                    validator: (value) =>
                        validateField(value: value!, fieldName: "Email ID"),
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
                    controller: appointmentController.phoneController,
                    onSaved: (value) {},
                    validator: (value) =>
                        validateField(value: value!, fieldName: "Mobile"),
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
                    controller: appointmentController.addressController,
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
                const SizedBox(height: 30),
                widget.appointment.id != 0
                    ? CustomButtonWithoutBold(
                        textColor: Colors.white,
                        textValue: "Update",
                        buttonColor: HexColor("1BCB5D"),
                        onPressed: () async {
                          if (_appointmentFormKey.currentState!.validate()) {
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

                            await appointmentController.updateAppointment(
                                appointmentController.fullnameController.text,
                                appointmentController.emailController.text,
                                appointmentController.phoneController.text,
                                appointmentController.addressController.text,
                                id: widget.appointment.id.toString());
                            // Get.back();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please fill all fields')),
                            );
                          }
                        },
                      )
                    : Container(),
                const SizedBox(height: 30),
                CustomButtonWithoutBold(
                  textColor: Colors.white,
                  textValue: widget.appointment.id != 0 ? "Next" : "Add",
                  buttonColor: HexColor("1BCB5D"),
                  onPressed: () async {
                    if (widget.appointment.id != 0) {
                      //  Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) =>
                      //                    PersonalScreen()),
                      //         );
                    } else {
                      if (_appointmentFormKey.currentState!.validate()) {
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

                        await appointmentController.addAppointment(
                          appointmentController.fullnameController.text,
                          appointmentController.emailController.text,
                          appointmentController.phoneController.text,
                          appointmentController.addressController.text,
                        );
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
      // )
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
