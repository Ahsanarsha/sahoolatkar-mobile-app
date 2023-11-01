import 'dart:convert';
InstallmentResponse installmentResponseFromJson(String str) => InstallmentResponse.fromJson(json.decode(str));
String installmentResponseToJson(InstallmentResponse data) => json.encode(data.toJson());
class InstallmentResponse {
  InstallmentResponse({
      String? status, 
      Data? data,}){
    _status = status;
    _data = data;
}

  InstallmentResponse.fromJson(dynamic json) {
    _status = json['Status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  Data? _data;

  String? get status => _status;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      List<Result>? result, 
      dynamic targetUrl, 
      bool? success, 
      dynamic error, 
      bool? unAuthorizedRequest, 
      bool? abp,}){
    _result = result;
    _targetUrl = targetUrl;
    _success = success;
    _error = error;
    _unAuthorizedRequest = unAuthorizedRequest;
    _abp = abp;
}

  Data.fromJson(dynamic json) {
    if (json['result'] != null) {
      _result = [];
      json['result'].forEach((v) {
        _result?.add(Result.fromJson(v));
      });
    }
    _targetUrl = json['targetUrl'];
    _success = json['success'];
    _error = json['error'];
    _unAuthorizedRequest = json['unAuthorizedRequest'];
    _abp = json['__abp'];
  }
  List<Result>? _result;
  dynamic _targetUrl;
  bool? _success;
  dynamic _error;
  bool? _unAuthorizedRequest;
  bool? _abp;

  List<Result>? get result => _result;
  dynamic get targetUrl => _targetUrl;
  bool? get success => _success;
  dynamic get error => _error;
  bool? get unAuthorizedRequest => _unAuthorizedRequest;
  bool? get abp => _abp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_result != null) {
      map['result'] = _result?.map((v) => v.toJson()).toList();
    }
    map['targetUrl'] = _targetUrl;
    map['success'] = _success;
    map['error'] = _error;
    map['unAuthorizedRequest'] = _unAuthorizedRequest;
    map['__abp'] = _abp;
    return map;
  }

}

Result resultFromJson(String str) => Result.fromJson(json.decode(str));
String resultToJson(Result data) => json.encode(data.toJson());
class Result {
  Result({
      int? installmentPlanDetailId, 
      int? installmentPrice, 
      int? advance, 
      int? duration,
      String? monthlyinstallment,}){
    _installmentPlanDetailId = installmentPlanDetailId;
    _installmentPrice = installmentPrice;
    _advance = advance;
    _duration = duration;
    _monthlyinstallment = monthlyinstallment;
}

  Result.fromJson(dynamic json) {
    _installmentPlanDetailId = json['installmentPlanDetailId'];
    _installmentPrice = json['installmentPrice'];
    _advance = json['advance'];
    _duration = int.tryParse(json['duration']);
    _monthlyinstallment = json['monthlyinstallment'];
  }
  int? _installmentPlanDetailId;
  int? _installmentPrice;
  int? _advance;
  int? _duration;
  String? _monthlyinstallment;

  int? get installmentPlanDetailId => _installmentPlanDetailId;
  int? get installmentPrice => _installmentPrice;
  int? get advance => _advance;
  int? get duration => _duration;
  String? get monthlyinstallment => _monthlyinstallment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['installmentPlanDetailId'] = _installmentPlanDetailId;
    map['installmentPrice'] = _installmentPrice;
    map['advance'] = _advance;
    map['duration'] = _duration;
    map['monthlyinstallment'] = _monthlyinstallment;
    return map;
  }

}