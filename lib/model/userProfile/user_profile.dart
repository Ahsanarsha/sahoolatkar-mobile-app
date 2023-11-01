import 'dart:convert';

/// success : true
/// data : {"id":7,"name":"Asif Faiz","email":"asiffaiz696@gmail.com","email_verified_at":null,"photo":null,"role":"user","mobile":null,"provider":null,"provider_id":"03085028887","status":"active","created_at":"2022-06-14T08:06:31.000000Z","updated_at":"2022-06-14T08:06:31.000000Z"}
/// message : ["User Password Update Successfully!"]

UserProfile userProfileFromJson(String str) =>
    UserProfile.fromJson(json.decode(str));
String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  UserProfile({
    bool? success,
    ProfileData? data,
    List<String>? message,
  }) {
    _success = success;
    _data = data;
    _message = message;
  }

  UserProfile.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null ? ProfileData.fromJson(json['data']) : null;
    _message = json['message'] != null ? json['message'].cast<String>() : [];
  }
  bool? _success;
  ProfileData? _data;
  List<String>? _message;

  bool? get success => _success;
  ProfileData? get data => _data;
  List<String>? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    return map;
  }
}

/// id : 7
/// name : "Asif Faiz"
/// email : "asiffaiz696@gmail.com"
/// email_verified_at : null
/// photo : null
/// role : "user"
/// mobile : null
/// provider : null
/// provider_id : "03085028887"
/// status : "active"
/// created_at : "2022-06-14T08:06:31.000000Z"
/// updated_at : "2022-06-14T08:06:31.000000Z"

ProfileData dataFromJson(String str) => ProfileData.fromJson(json.decode(str));
String dataToJson(ProfileData data) => json.encode(data.toJson());

class ProfileData {
  ProfileData({
    int? id,
    String? name,
    String? email,
    dynamic emailVerifiedAt,
    dynamic photo,
    String? role,
    dynamic mobile,
    dynamic provider,
    String? providerId,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _email = email;
    _emailVerifiedAt = emailVerifiedAt;
    _photo = photo;
    _role = role;
    _mobile = mobile;
    _provider = provider;
    _providerId = providerId;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  ProfileData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _photo = json['photo'];
    _role = json['role'];
    _mobile = json['mobile'];
    _provider = json['provider'];
    _providerId = json['provider_id'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  String? _email;
  dynamic _emailVerifiedAt;
  dynamic _photo;
  String? _role;
  dynamic _mobile;
  dynamic _provider;
  String? _providerId;
  String? _status;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get name => _name;
  String? get email => _email;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  dynamic get photo => _photo;
  String? get role => _role;
  dynamic get mobile => _mobile;
  dynamic get provider => _provider;
  String? get providerId => _providerId;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['email_verified_at'] = _emailVerifiedAt;
    map['photo'] = _photo;
    map['role'] = _role;
    map['mobile'] = _mobile;
    map['provider'] = _provider;
    map['provider_id'] = _providerId;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
