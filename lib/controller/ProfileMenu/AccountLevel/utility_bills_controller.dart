import 'dart:convert';

import 'package:get/get.dart';
import 'package:saholatkar/Repositories/AccountLevel/account_level_repo.dart';
import 'package:saholatkar/helper/BlocUserProfile.dart';

class UtilityBillsController extends GetxController {
  bool isLoading = false;
  final apiClient = AccountLevelRepo();

  Future<void> uploadUtilityBill({required String imageData}) async {
    String id = blocUserProfile.viewModelUser.data![0].id.toString();

    await apiClient.uploadUtilityBill(id,imageData).then((response) {
      print(response);
      if (response != null) {
        print('Image Response back $response');
        var result = json.decode(response);
        var success = result["success"];
        var message = result["message"];
        if (success.contains('Info Updated Successfuly')) {
          // Get.back() to hide loading indicator dialouge
          Get.back();
          Get.snackbar("Message", success.toString());
        } else {
          Get.back();
          Get.snackbar("Message", message.toString());
        }
      }
    });
  }

}
