import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saholatkar/Repositories/AccountLevel/account_level_repo.dart';
import 'package:saholatkar/model/accountLevel/account_level.dart';
import 'package:saholatkar/model/accountLevel/appointment.dart';
import 'package:saholatkar/model/userProfile/user_profile.dart';

class PersonalController extends GetxController {
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

  Future<void> addPersonal(
      String name, String email, String mobile, String address) async {
    final appointmentModel =
        Appointment(name: name, email: email, mobile: mobile, address: address);
    print(appointmentModel);
    await apiClient.addPersonal(appointmentModel).then((response) {
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

  Future<void> updateMyPersonal(
      String name, String email, String mobile, String address,BuildContext context,
      {required String id}) async {
    var model =
    {
      "fullname":  name,
      "email":  email,
      "phone":mobile,
      "address": address,
    };

    var newMode = {
      "personal_infromation" : model.toString(),
      "user_id": id.toString()
    };

    await apiClient.updatePersonal(newMode).then((response) {
      if (response != null) {
        var result = json.decode(response);
        var success = result["success"];
        if (success.contains('Info Updated Successfuly')) {
          // Get.back() to hide loading indicator dialouge
          Get.back();
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(success.toString())));


        } else {
          Get.back();
          Get.snackbar("Message", success.toString());


        }
      }
    });
  }

  initFormData(PersonalData personal) {
    emailController.text = personal.email ?? "";
    fullnameController.text = personal.name ?? "";
    phoneController.text = personal.mobile ?? "";
    addressController.text = personal.address ?? "";
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
