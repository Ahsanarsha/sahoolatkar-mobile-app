import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saholatkar/Repositories/AccountLevel/account_level_repo.dart';
import 'package:saholatkar/model/accountLevel/account_level.dart';
import 'package:saholatkar/model/accountLevel/appointment.dart';
import 'package:saholatkar/model/userProfile/user_profile.dart';

class AppointmentController extends GetxController {
  bool isLoading = false;

  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final fullnameController = TextEditingController();
  final phoneController = TextEditingController();

  final apiClient = AccountLevelRepo();
  late ProfileData profileData;
  @override
  void onInit() {
    // getProfile();
    super.onInit();
  }

  // Future<dynamic> getProfile() async {
  //   isLoading = true;

  //   await apiClient.getProfile().then((response) async {
  //     if (response != null) {
  //       var data = userProfileFromJson(response);
  //       profileData = data.data!;
  //       isLoading = false;
  //       initFormData();
  //     }
  //   });
  // }

  Future<void> addAppointment(
      String name, String email, String mobile, String address) async {
    final appointmentModel =
        Appointment(name: name, email: email, mobile: mobile, address: address);
    print(appointmentModel);
    await apiClient.addAppointment(appointmentModel).then((response) {
      print(response);
      if (response != null) {
        var result = json.decode(response);
        var success = result["success"];
        var message = result["message"];
        if (success == true) {
          // Get.back() to hide loading indicator dialouge
          Get.back();
          Get.snackbar("Message", message[0].toString());
        } else {
          Get.back();
          Get.snackbar("Message", message[0].toString());
        }
      }
    });
  }

  Future<void> updateAppointment(
      String name, String email, String mobile, String address,
      {required String id}) async {
    final appointmentModel =
        Appointment(name: name, email: email, mobile: mobile, address: address);
    print(appointmentModel);
    await apiClient.updateAppointment(appointmentModel, id).then((response) {
      if (response != null) {
        var result = json.decode(response);
        var success = result["success"];
        var message = result["message"];
        if (success == true) {
          // Get.back() to hide loading indicator dialouge
          Get.back();
          Get.snackbar("Message", message[0].toString());
        } else {
          Get.back();
          Get.snackbar("Message", message[0].toString());
        }
      }
    });
  }

  initFormData(AppointmentData appointment) {
    emailController.text = appointment.email ?? "";
    fullnameController.text = appointment.name ?? "";
    phoneController.text = appointment.mobile ?? "";
    addressController.text = appointment.address ?? "";
    update();
  }

  onEmpty() {}

  @override
  void dispose() {
    fullnameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    phoneController.dispose();
    emailController.dispose();

    super.dispose();
  }
}
