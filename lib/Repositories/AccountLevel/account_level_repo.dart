import 'dart:async';

import 'package:saholatkar/services/base_client.dart';

import '../../model/InstallmentRequestBody.dart';

class AccountLevelRepo {
  final apiClient = BaseClient();

  Future<dynamic> getAccountLevelData() async {
    return await apiClient.getAccountLevelData();
  }

  Future<dynamic> addAppointment(dynamic appointmentModel) async {
    return await apiClient.addAppointment(appointmentModel);
  }

  Future<dynamic> updateAppointment(dynamic appointmentModel, String id) async {
    return await apiClient.updateAppointment(appointmentModel, id);
  }

  Future<dynamic> addPersonal(dynamic personalModel) async {
    return await apiClient.addPersonal(personalModel);
  }

  Future<dynamic> updatePersonal(dynamic personalModel) async {
    return await apiClient.updatePersonal(personalModel);
  }

  Future<dynamic> addEducation(dynamic educationModel) async {
    return await apiClient.addEducation(educationModel);
  }

  Future<dynamic> updateEducation(dynamic educationModel, String id) async {
    return await apiClient.updateEducation(educationModel, id);
  }

  Future<dynamic> addBankDetail(dynamic bankModel) async {
    return await apiClient.addBankDetail(bankModel);
  }

  Future<dynamic> updateBankDetail(dynamic bankModel, String id) async {
    return await apiClient.updateBankDetail(bankModel, id);
  }

  Future<dynamic> uploadUtilityBill(String id,dynamic imageData) async {
    return await apiClient.uploadUtilityBill(id,imageData: imageData);
  }


  Future<dynamic> uploadDrivingLicense(dynamic imageData) async {
    return await apiClient.uploadDrivingLicense(imageData: imageData);
  }

  Future<dynamic> updateDrivingLicense(dynamic imageData, String id) async {
    return await apiClient.updateDrivingLicense(imageData: imageData, id: id);
  }

  Future<dynamic> uploadLivePhoto(dynamic imageData) async {
    return await apiClient.uploadLivePhoto(imageData: imageData);
  }

  Future<dynamic> updateLivePhoto(dynamic imageData, String id) async {
    return await apiClient.updateLivePhoto(imageData: imageData, id: id);
  }
  Future<dynamic> makeInstallmentRequest(InstallmentRequestBody body) async {
    return await apiClient.makeInstallmentRequest(body);
  }
}
