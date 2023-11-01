import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saholatkar/Repositories/UserProfile/user_profile_repo.dart';
import 'package:saholatkar/model/profileMenu/TransactionsModel.dart';
import 'package:saholatkar/model/userProfile/GetUserModel.dart';
import 'package:saholatkar/model/userProfile/user_profile.dart';

import '../../helper/BlocUserProfile.dart';
import '../../helper/prefs.dart';

class UserProfileController extends GetxController {
  bool isLoading = false;
  bool isEditMode = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final confirmedPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final fullnameController = TextEditingController();
  final phoneController = TextEditingController();
  TransactionsModel transactionsModel = TransactionsModel();
  GetUserModel userData = GetUserModel();
  var email = "";
  var password = "";
  final apiClient = UserProfileRepo();
  late ProfileData profileData;
  @override
  void onInit() {
    String userId = Prefs.get('userId');
    getTransaction(userId);
    getProfile();
    super.onInit();
  }

  void checkIsEdit() {
    if (isEditMode == true) {
      isEditMode = false;
      update();
    } else {
      isEditMode = true;
      update();
    }
  }

  Future<dynamic> getProfile() async {
    isLoading = true;

    await apiClient.getProfile().then((response) async {
      if (response != null) {
        var data = userProfileFromJson(response);
        profileData = data.data!;
        isLoading = false;
        initFormData();
      }
    });
  }
  Future<dynamic> getUserProfile() async {
    String id = Prefs.get('userId');
    await apiClient.getUserProfile(id).then((response) async {
      if (response != null) {
        Prefs.setString('userData', response.toString());
        await blocUserProfile.initProfile();
        userData = GetUserModel.fromJson(json.decode(response));
        print(jsonEncode(userData.data![0].name));
        update();
      }
    });
  }

  Future<void> updateProfile(String name, String email, String mobile) async {
    final updateModel = {"name": name, "email": email, "mobile": mobile};

    await apiClient.updateProfile(updateModel).then((response) {
      if (response != null) {
        var result = json.decode(response);
        var success = result["success"];
        var message = result["message"];
        if (success == true) {
          // Get.back() to hide loading indicator dialouge
          Get.back();
          Get.snackbar("Message", message[0].toString());
        } else {
          Get.snackbar("Message", message[0].toString());
        }
      }
    });
  }
  Future<void> getTransaction(String id) async {
    await apiClient.getTransactions(id).then((response) {
      if (response != null) {
        var result = json.decode(response);
        var success = result["Status"];
        var message = result["message"];
        if (success == 'Success') {
          transactionsModel = TransactionsModel.fromJson(json.decode(response));
          // Get.back() to hide loading indicator dialouge
          print(response.toString());
            update();
        } else {
          Get.snackbar("Message", message.toString());
        }
      }
    });
  }

  Future<void> changePassword(
      {required String currentPassword,
      required String newPassword,
      required String confirmedPassword}) async {
    final changePasswordModel = {
      "old_password": currentPassword,
      "new_password": newPassword,
      "password_confirmation": confirmedPassword
    };

    await apiClient.changePassword(changePasswordModel).then((response) {
      if (response != null) {
        var result = json.decode(response);
        var success = result["success"];
        var message = result["message"];
        if (success == true) {
          // Get.back() to hide loading indicator dialouge
          Get.back();
          Get.snackbar("Message", message[0].toString());
          onEmpty();
        } else {
          // Get.back() to hide loading indicator dialouge
          Get.back();
          Get.snackbar("Message", message[0].toString());
        }
      }
    });
  }

  initFormData() {
    emailController.text = profileData.email ?? "";
    fullnameController.text = profileData.name ?? "";
    phoneController.text = profileData.mobile ?? "";
    update();
  }

  onEmpty() {
    passwordController.clear();
    confirmedPasswordController.clear();

    newPasswordController.clear();
  }

  @override
  void dispose() {
    fullnameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    emailController.dispose();

    super.dispose();
  }
}
