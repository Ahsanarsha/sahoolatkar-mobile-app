import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Repositories/PlaceOrder/place_order.dart';
import '../../model/merchant/BecomeMerchantBody.dart';

class MerchantController extends GetxController{
  final apiClient = PlaceOrderRepo();
  TextEditingController nameController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController businessAddressController = TextEditingController();
  TextEditingController natureController = TextEditingController();
  TextEditingController yearsController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController rentController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  String numberShop='';
  String shopType='';


  clearFields(){
  nameController.clear();
  cnicController.clear();
  phoneController.clear();
  emailController.clear();
  businessNameController.clear();
  businessAddressController.clear();
  natureController.clear();
  yearsController.clear();
  sizeController.clear();
  rentController.clear();
  addressController.clear();
  cityController.clear();
  update();
  }

  setShopType(String val){
    shopType = val;
    update();
  }
  setShopNumber(String val){
    numberShop = val;
    update();
  }
  makeRequest(BecomeMerchantBody body)async{
    await apiClient.requestForMerchant(body).then((response) {
      if (response != null) {
        var result = json.decode(response);
        var success = result["Status"];
        var message = result["message"];
        if (success == 'Success') {
          clearFields();
          Get.back();
          Get.snackbar("Message", 'Your request has been submitted');

        } else {
          Get.back();
          Get.snackbar("Message", message.toString());
        }
      }
    });
  }

}