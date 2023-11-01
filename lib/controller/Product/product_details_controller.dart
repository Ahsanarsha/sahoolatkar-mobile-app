import 'dart:convert';

import 'package:get/get.dart';

import '../../Repositories/PlaceOrder/place_order.dart';
import '../../model/product_model/InstallmentResponse.dart';
import '../../model/product_model/ProductDetailsResponse.dart';

class ProductDetailsController extends GetxController{
  bool isLoading = false;
  final apiClient = PlaceOrderRepo();

  ProductDetailsResponse productDetailsResponse = ProductDetailsResponse();
  InstallmentResponse installmentResponse = InstallmentResponse();

  Future<void> getProductDetails(
      String id) async {

    await apiClient.getOrderDetails(id).then((response) {
      isLoading = true;
      if (response != null) {

        var result = json.decode(response);
        var success = result["Status"];
        var message = result["message"];
        if (success == 'Success') {
          isLoading = false;
          productDetailsResponse = ProductDetailsResponse.fromJson(json.decode(response));
          //
          // Get.back();
        } else {
          isLoading = false;
          Get.back();
          Get.snackbar("Message", message.toString());
        }
      }
      update();
    });
  }
  Future<void> getInstallmentPlans(
      String id) async {
    print('in installment');
    await apiClient.getInstallment(id).then((response) {
      print(response);
      if (response != null) {
        print('Instalment plans $response');
        var result = json.decode(response);
        var success = result["Status"];
        var message = result["message"];
        if (success == 'Success') {

          installmentResponse = InstallmentResponse.fromJson(json.decode(response));
        } else {

          Get.snackbar("Message", message.toString());
        }
      }
      update();
    });
  }

  Future<void> setFavourite(
      int id) async {

    await apiClient.setFav(id).then((response) {
      print(response.body);
      if (response != null) {
        var result = json.decode(response.body);
        var success = result["Status"];
        if (success == 'Product Added To Wishlist Successfully') {
          Get.snackbar("Message", success.toString());
        } else {

          Get.snackbar("Message", 'Something Went Wrong');
        }
      }
      update();
    });
  }
  Future<void> removeFavourite(
      int id) async {

    await apiClient.removeFav(id).then((response) {
      if (response != null) {
        print('Instalment plans ${response.body}');
        var result = json.decode(response.body);
        var success = result["message"];
        if (success == 'Product removed from Wishlist.') {
          Get.snackbar("Message", success.toString());
        } else {

          Get.snackbar("Message", 'Something Went Wrong');
        }
      }
      update();
    });
  }
}