import 'dart:convert';
GetUserModel getUserModelFromJson(String str) => GetUserModel.fromJson(json.decode(str));
String getUserModelToJson(GetUserModel data) => json.encode(data.toJson());
class GetUserModel {
  GetUserModel({
      List<Data>? data,}){
    _data = data;
}

  GetUserModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? _data;

  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      String? name, 
      String? email, 
      dynamic mobile, 
      dynamic userType,
      dynamic mailOtp, 
      dynamic phoneOtp, 
      dynamic emailVerifiedAt, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _email = email;
    _mobile = mobile;
    _userType = userType;
    _mailOtp = mailOtp;
    _phoneOtp = phoneOtp;
    _emailVerifiedAt = emailVerifiedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _mobile = json['mobile'];
    _userType = json['user_type'];
    _mailOtp = json['mail_otp'];
    _phoneOtp = json['phone_otp'];
    _emailVerifiedAt = json['email_verified_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  String? _email;
  dynamic _mobile;
  dynamic _userType;
  dynamic _mailOtp;
  dynamic _phoneOtp;
  dynamic _emailVerifiedAt;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get name => _name;
  String? get email => _email;
  dynamic get mobile => _mobile;
  dynamic get userType => _userType;
  dynamic get mailOtp => _mailOtp;
  dynamic get phoneOtp => _phoneOtp;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['user_type'] = _userType;
    map['mail_otp'] = _mailOtp;
    map['phone_otp'] = _phoneOtp;
    map['email_verified_at'] = _emailVerifiedAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}