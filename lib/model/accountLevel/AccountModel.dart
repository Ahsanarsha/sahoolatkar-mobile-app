import 'dart:convert';
AccountModel accountModelFromJson(String str) => AccountModel.fromJson(json.decode(str));
String accountModelToJson(AccountModel data) => json.encode(data.toJson());
class AccountModel {
  AccountModel({
      String? success, 
      List<Records>? records,}){
    _success = success;
    _records = records;
}

  AccountModel.fromJson(dynamic json) {
    _success = json['success'];
    if (json['records'] != null) {
      _records = [];
      json['records'].forEach((v) {
        _records?.add(Records.fromJson(v));
      });
    }
  }
  String? _success;
  List<Records>? _records;

  String? get success => _success;
  List<Records>? get records => _records;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_records != null) {
      map['records'] = _records?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Records recordsFromJson(String str) => Records.fromJson(json.decode(str));
String recordsToJson(Records data) => json.encode(data.toJson());
class Records {
  Records({
      int? id, 
      String? userId, 
      String? personalInfo, 
      String? education, 
      String? bank, 
      String? utilitybill, 
      String? drivingLicense, 
      String? livePhoto, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _personalInfo = personalInfo;
    _education = education;
    _bank = bank;
    _utilitybill = utilitybill;
    _drivingLicense = drivingLicense;
    _livePhoto = livePhoto;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Records.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _personalInfo = json['personal_info'];
    _education = json['education'];
    _bank = json['bank'];
    _utilitybill = json['utilitybill'];
    _drivingLicense = json['driving_license'];
    _livePhoto = json['live_photo'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _userId;
  String? _personalInfo;
  String? _education;
  String? _bank;
  String? _utilitybill;
  String? _drivingLicense;
  String? _livePhoto;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get userId => _userId;
  String? get personalInfo => _personalInfo;
  String? get education => _education;
  String? get bank => _bank;
  String? get utilitybill => _utilitybill;
  String? get drivingLicense => _drivingLicense;
  String? get livePhoto => _livePhoto;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['personal_info'] = _personalInfo;
    map['education'] = _education;
    map['bank'] = _bank;
    map['utilitybill'] = _utilitybill;
    map['driving_license'] = _drivingLicense;
    map['live_photo'] = _livePhoto;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}