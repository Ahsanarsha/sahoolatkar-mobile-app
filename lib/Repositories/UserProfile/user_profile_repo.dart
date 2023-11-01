import 'dart:async';

import 'package:saholatkar/services/base_client.dart';

class UserProfileRepo {
  final apiClient = BaseClient();

  Future<dynamic> getProfile() async {
    // return await apiClient.getProfile();
  }
  Future<dynamic> getUserProfile(String id) async {
    return await apiClient.getUserProfile(id);
  }

  Future<dynamic> updateProfile(dynamic profileModel) async {
    return await apiClient.updateProfile(profileModel);
  }

  Future<dynamic> changePassword(dynamic changePasswordModel) async {
    return await apiClient.changePassword(changePasswordModel);
  }
  Future<dynamic> getTransactions(String id) async {
    return await apiClient.getTransactions(id);
  }
}







//commit