import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:saholatkar/Repositories/PlaceOrder/place_order.dart';
import 'package:saholatkar/model/PlaceOrderBody.dart';

class PlaceOrderController extends GetxController{
  final apiClient = PlaceOrderRepo();
  bool isLoading = false;
  bool isSuccess = false;
  Future<dynamic> placeOrder(PlaceOrderBody body) async {

    await apiClient.placeOrder(body).then((response) async {
      isLoading = true;
      debugPrint(response.toString());
      if (response != null) {
        debugPrint(response.toString());
        var result = json.decode(response);
        var status = result["Status"];
        var message = result["message"];
        if (status == "Order Placed Successfully") {
          Get.snackbar("Message", status.toString());
          isSuccess = true;
        } else {
          isSuccess =  false;
          Get.back();
          Get.snackbar("Message", message.toString());
        }
      }
      else if(response == null){

        Get.snackbar("Message", 'Error placing order');
        debugPrint("Response is null");
        isSuccess =  false;
      }
      else{
        debugPrint("Don't know what happened");
        isSuccess =  false;
      }
    });
    isLoading = false;
    update();
  }
  Future<dynamic> emptyCart() async {

    await apiClient.emptyCart().then((response) async {
      isLoading = true;
      if (response != null) {
        debugPrint(response.toString());
        var result = json.decode(response);
        var status = result["Status"];
        var message = result["message"];
        if (status == "Cart is empty") {
          Get.snackbar("Message", status.toString());
          isSuccess = true;
        } else {
          isSuccess =  false;
          Get.back();
          Get.snackbar("Message", message.toString());
        }
      }
      else if(response == null){

        Get.snackbar("Message", 'Error placing order');
        debugPrint("Response is null");
        isSuccess =  false;
      }
      else{
        debugPrint("Don't know what happened");
        isSuccess =  false;
      }
    });
    isLoading = false;
    update();
  }
}