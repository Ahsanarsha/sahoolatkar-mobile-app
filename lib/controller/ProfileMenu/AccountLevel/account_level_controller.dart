import 'dart:convert';

import 'package:get/get.dart';
import 'package:saholatkar/Repositories/AccountLevel/account_level_repo.dart';
import 'package:saholatkar/model/accountLevel/account_level.dart';
import 'package:saholatkar/model/accountLevel/AccountModel.dart';

class AccountLevelController extends GetxController {
  bool isVerified = false;
  AccountModel model  =AccountModel();
  final apiClient = AccountLevelRepo();
  AccountLevelData accountLevelData = AccountLevelData.fromJson({});
  @override
  void onInit() {
    getAccountLevelData();
    super.onInit();
  }




  Future<dynamic> getAccountLevelData() async {
    await apiClient.getAccountLevelData().then((response) async {
      print('>>><<<<');
      print(jsonEncode(response));

        model = AccountModel.fromJson(response);
      print(model);
        if(response["error"] == "Some information is missing"){
          isVerified = false;
        }else if(response["success"] == "Account is verrified"){
          isVerified = true;
        }
        update();

    });
    update();
  }
}
