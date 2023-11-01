import 'dart:convert';

import 'package:get/get.dart';
import 'package:saholatkar/Repositories/AccountLevel/account_level_repo.dart';

class LivePhotoController extends GetxController {
  bool isLoading = false;
  final apiClient = AccountLevelRepo();

  Future<void> uploadLivePhoto({required String imageData}) async {
    print(imageData);
    await apiClient.uploadLivePhoto(imageData).then((response) {
      print('asdasdas${response}');
      if (response != null) {
        var result = json.decode(response);
        var success = result["success"];
        var message = result["message"];
        if (success == true) {
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

  Future<void> updateLivePhoto(
      {required String imageData, required String id}) async {
    print(imageData);
    await apiClient.updateLivePhoto(imageData, id).then((response) {
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
