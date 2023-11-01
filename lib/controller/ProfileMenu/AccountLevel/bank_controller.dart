import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saholatkar/Repositories/AccountLevel/account_level_repo.dart';
import 'package:saholatkar/model/accountLevel/account_level.dart';
import 'package:saholatkar/model/accountLevel/bank.dart';

class BankController extends GetxController {
  bool isLoading = false;

  final bankNameController = TextEditingController();
  final accountNoController = TextEditingController();

  final apiClient = AccountLevelRepo();

  @override
  void onInit() {
    // getProfile();
    super.onInit();
  }

  Future<void> addBankDetail(String name, String bankAccount,String id) async {

    final bankModel =  {
      "name":  name,
      "account-no":  bankAccount,
    };

    var newMode = {
      "bank" : bankModel.toString(),
      "user_id": id.toString()
    };

    await apiClient.addBankDetail(newMode).then((response) {
      if (response != null) {
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

  Future<void> updateBankDetail(String bankName, String bankAccount,
      {required String id}) async {
    final bankModel = Bank(bankName: bankName, accountNumber: bankAccount);
    print(bankModel);
    await apiClient.updateBankDetail(bankModel, id).then((response) {
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

  initFormData(BankData bank) {
    bankNameController.text = bank.bankName ?? "";
    accountNoController.text = bank.accountNumber ?? "";

    update();
  }

  onEmpty() {}

  @override
  void dispose() {
    bankNameController.dispose();
    accountNoController.dispose();

    super.dispose();
  }
}
