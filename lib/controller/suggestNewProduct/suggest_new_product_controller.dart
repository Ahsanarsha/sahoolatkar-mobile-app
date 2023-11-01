import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saholatkar/Repositories/profileMenu/profile_menu_repo.dart';

class SuggestNewProductController extends GetxController {
  bool isLoading = false;

  final productNameController = TextEditingController();
  final sizeController = TextEditingController();
  final priceController = TextEditingController();

  final apiClient = ProfileMenuRepo();

  Future<void> suggestNewProduct(
      String productName, String productSize, String productPrice) async {
    final updateModel = {
      "name": productName,
      "size": productSize,
      "price": productPrice
    };
  
    await apiClient.suggestNewProduct(updateModel).then((response) {
      if (response != null) {
        var result = json.decode(response);
        var success = result["Status"];
        var message = result["message"];
        if (success == 'Success') {
          // Get.back() to hide loading indicator dialouge
          Get.back();
          Get.snackbar("Message", 'Suggestion sent');
          priceController.clear();
          sizeController.clear();
          productNameController.clear();
        } else {
          Get.back();
          Get.snackbar("Message", message.toString());
        }
      }
    });
  }

  onEmpty() {}

  @override
  void dispose() {
    productNameController.dispose();
    sizeController.dispose();
    priceController.dispose();

    super.dispose();
  }
}
