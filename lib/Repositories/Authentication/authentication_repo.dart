import 'dart:async';

import 'package:saholatkar/model/authentication/register.dart';
import 'package:saholatkar/model/authentication/reset_password.dart';
import 'package:saholatkar/services/base_client.dart';

class AuthenticationRepo {
  final apiClient = BaseClient();

  Future<dynamic> login(String email, String password) async {
    return await apiClient.login(email, password);
  }

  Future<dynamic> sendEmailCode(String email) async {
    return await apiClient.sendEmailCode(email);
  }
  Future<dynamic> sendNoCode(int email) async {
    return await apiClient.sendNoCode(email);
  }

  Future<dynamic> resetCode(String email,code) async {
    return await apiClient.resetCode(email,code);
  }
  Future<dynamic> verifyCode(code) async {
    return await apiClient.verifyCode(code);
  }Future<dynamic> verifyOtp(code,id) async {
    return await apiClient.verifyOtp(code,id);
  }

  Future<dynamic> resetPassword(ResetPassword resetDataModel) async {
    return await apiClient.resetPassword(resetDataModel);
  }

  Future<dynamic> register(Register register) async {
    return apiClient.register(register);
  }

  Future<dynamic> forgetpassword(String email) async {
    return await apiClient.forgetPassword(email);
  }

  Future<dynamic> getProfile() async {
    // return await apiClient.getProfile();
  }
  Future<dynamic> getBrands() async {
    return await apiClient.getBrands();
  }
}







//commit