import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saholatkar/Repositories/add_to_cart_repository/add_to_cart_repository.dart';
import 'package:saholatkar/model/GetFromCartModel.dart';
import 'package:saholatkar/model/product_model/ProductDetailsResponse.dart';
import 'package:saholatkar/model/product_model/Product_Model.dart';

class AddToCartController extends GetxController{
  final apiClient = AddToCartRepository();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController addressOneController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  GetFromCartModel getFromCartModel = GetFromCartModel();
  bool isLoading =false;
  int cartItem = 0;

  addToCart(ShopItemModel model) async {
    var response = await apiClient.addToCart(model: model);
    if (response != null) {
      print(response);
      var result = json.decode(response);
      var status = result["success"];
      if (status == "Product Added to Cart Successfully") {
        Get.snackbar("Message",status.toString());
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
  getCart() async {
    isLoading = true;
    update();
    var response = await apiClient.getFromCart();
    if (response != null) {

      var result = json.decode(response);
      var status = result["Status"];
      if (status == "Success") {
        // Get.snackbar("Message",status.toString());
        getFromCartModel = GetFromCartModel.fromJson(result);
        cartItem = getFromCartModel.cart!.length;
        isLoading = false;
        update();
      } else {
        Get.snackbar("Message",result['error'].toString());

      }
    } else if (response == null) {
      debugPrint("Response is null");

    } else {
      debugPrint("Don't know what happened");

    }
  }
  decrement(int index){
    int q =   int.parse(getFromCartModel.cart![index].quantity.toString());
    if(q>1) {
      q--;
    }
    getFromCartModel.cart![index].quantity =q.toString();
    update();

  }
  increment(int index){
    int pQ = int.parse(getFromCartModel.cart![index].product!.quantity.toString());
    print(pQ);
    int q =   int.parse(getFromCartModel.cart![index].quantity.toString());
    if(!(pQ ==q) ) {
      q++;
      getFromCartModel.cart![index].quantity = q.toString();
    }
    update();

  }
}
