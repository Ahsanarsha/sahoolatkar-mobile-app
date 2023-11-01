import 'dart:convert';

import 'package:get/get.dart';
import 'package:saholatkar/Repositories/AccountLevel/account_level_repo.dart';

class DrivingLicenseController extends GetxController {
  bool isLoading = false;
  final apiClient = AccountLevelRepo();

  Future<void> uploadDrivingLicense({required String imageData}) async {
    print(imageData);

    await apiClient.uploadDrivingLicense(imageData).then((response) {
      if (response != null) {
        var result = json.decode(response);
        var success = result["success"];
        if (success.contains('Info Updated Successfuly')) {
          // Get.back() to hide loading indicator dialouge
          Get.back();
          Get.snackbar("Message", success.toString());
        } else {
          Get.back();
          Get.snackbar("Message", success.toString());
        }
      }
    });
  }

  Future<void> updateDrivingLicense(
      {required String imageData, required String id}) async {
    print(imageData);
    await apiClient.updateDrivingLicense(imageData, id).then((response) {
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
}
