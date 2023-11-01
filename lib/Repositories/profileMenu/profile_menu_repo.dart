import 'dart:async';

import 'package:saholatkar/services/base_client.dart';

class ProfileMenuRepo {
  final apiClient = BaseClient();

  Future<dynamic> getStoreLocations() async {
    return await apiClient.getLocation();
  }

  Future<dynamic> suggestNewProduct(dynamic suggestProductModel) async {
    return await apiClient.suggestNewProduct(suggestProductModel);
  }

  // Future<dynamic> changePassword(dynamic changePasswordModel) async {
  //   return await apiClient.changePassword(changePasswordModel);
  // }
}
