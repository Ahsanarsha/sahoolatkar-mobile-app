import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saholatkar/Repositories/Authentication/authentication_repo.dart';
import 'package:saholatkar/Repositories/faqs/faq_repository.dart';
import 'package:saholatkar/model/faq/faq_model.dart';

class FaqController extends GetxController{
  FaqModel model = FaqModel();
  final apiClient = FaqRepository();
 getFaqs() async {
    var result  = await apiClient.getFaqs();
    var response = json.decode(result.body);
    if (response != null) {
      var status = response["Status"];
      if (status == "Success") {
        model = FaqModel.fromJson(response);
      } else {
        print('Something went wrong');
        Get.back();
      }
    }
    else if(response == null){
      debugPrint("Response is null");
    }
    else{
      debugPrint("Don't know what happened");
    }
    update();
  }
}