import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saholatkar/Repositories/AccountLevel/account_level_repo.dart';
import 'package:saholatkar/model/accountLevel/account_level.dart';
import 'package:saholatkar/model/accountLevel/education.dart';
import 'package:saholatkar/model/userProfile/user_profile.dart';

class EducationController extends GetxController {
  bool isLoading = false;

  final schoolController = TextEditingController();
  final schoolYearController = TextEditingController();
  final degreeController = TextEditingController();
  final degreeYearController = TextEditingController();

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

  Future<void> addEducation(String school, String schoolYear, String degree,
      String degreeYear,String id,BuildContext context) async {
    var model =
    {
      "school":  school,
      "year":  schoolYear,
      "degree":degree,
      "degreeYear":degreeYear
    };

    var newMode = {
      "education" : model.toString(),
      "user_id": id.toString()
    };


    await apiClient.addEducation(newMode).then((response) {
      print(response);
      if (response != null) {
        var result = json.decode(response);
        var success = result["success"].toString();
        if (success.contains('Info Updated Successfuly')) {
          print('object');
          Get.back();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(success)));
          Get.snackbar("Message", 'Data added successfully');
        } else {
          Get.back();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error adding data')));
          Get.snackbar("Message", 'Error adding data');
        }
      }
    });
  }

  Future<void> updateEducation(
      String school, String schoolYear, String degree, String degreeYear,
      {required String id}) async {
    final educationModel = Education(
        school: school,
        schoolYear: schoolYear,
        degree: degree,
        degreeYear: degreeYear);

    await apiClient.updateEducation(educationModel, id).then((response) {
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

  initFormData(EducationData education) {
    schoolController.text = education.school ?? "";
    schoolYearController.text = education.schoolYear ?? "";
    degreeController.text = education.degree ?? "";
    degreeYearController.text = education.degreeYear ?? "";
    update();
  }

  onEmpty() {}

  @override
  void dispose() {
    schoolController.dispose();
    schoolYearController.dispose();
    degreeController.dispose();
    degreeYearController.dispose();

    super.dispose();
  }
}
