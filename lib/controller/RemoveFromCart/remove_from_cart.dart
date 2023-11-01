

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saholatkar/Repositories/add_to_cart_repository/add_to_cart_repository.dart';

class RemoveFromCartController extends GetxController{
  final apiClient = AddToCartRepository();

  removeFromCart(int id) async {
    var response = await apiClient.removeFromCart(id: id);
    if (response != null) {
      print(response.body);
      var result = json.decode(response.body);
      var status = result["success"];
      print(status);
      if (status == "Product Removed From Cart Successfully") {
        // Get.snackbar("Message",response.toString());
        return true;
      } else {
        Get.snackbar("Message",result['error'].toString());
        return false;
      }
    } else if (response == null) {
      debugPrint("Response is null");
      return false;
    } else {
      debugPrint("Don't know what happened");
      return false;
    }
  }
}
