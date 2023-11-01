import 'dart:convert';

AccountLevel accountLevelFromJson(String str) =>
    AccountLevel.fromJson(json.decode(str));
String accountLevelToJson(AccountLevel data) => json.encode(data.toJson());

class AccountLevel {
  AccountLevel({
    bool? success,
    AccountLevelData? data,
    List<String>? message,
  }) {
    _success = success;
    _data = data;
    _message = message;
  }

  AccountLevel.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null
        ? AccountLevelData.fromJson(json['data'])
        : AccountLevelData.fromJson({});
    _message = json['message'] != null ? json['message'].cast<String>() : [];
  }
  bool? _success;
  AccountLevelData? _data;
  List<String>? _message;

  bool? get success => _success;
  AccountLevelData? get data => _data;
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

AccountLevelData dataFromJson(String str) =>
    AccountLevelData.fromJson(json.decode(str));
String dataToJson(AccountLevelData data) => json.encode(data.toJson());

class AccountLevelData {
  AccountLevelData({
    AppointmentData? appointment,
    PersonalData? personal,
    EducationData? education,
    BankData? bank,
    Utilitybill? utilitybill,
    DrivingLicense? drivingLicense,
    LivePhoto? livePhoto,
    // dynamic biometric,
  }) {
    _appointment = appointment;
    _personal = personal;
    _education = education;
    _bank = bank;
    _utilitybill = utilitybill;
    _drivingLicense = drivingLicense;
    _livePhoto = livePhoto;
    // _biometric = biometric;
  }

  AccountLevelData.fromJson(dynamic json) {
    _appointment = json['appointment'] != null
        ? AppointmentData.fromJson(json['appointment'])
        : AppointmentData.fromJson({});
    _personal = json['personal'] != null
        ? PersonalData.fromJson(json['personal'])
        : PersonalData.fromJson({});
    _education = json['education'] != null
        ? EducationData.fromJson(json['education'])
        : EducationData.fromJson({});
    _bank = json['bank'] != null
        ? BankData.fromJson(json['bank'])
        : BankData.fromJson({});
    _utilitybill = json['utilitybill'] != null
        ? Utilitybill.fromJson(json['utilitybill'])
        : Utilitybill.fromJson({});
    _drivingLicense = json['drivingLicense'] != null
        ? DrivingLicense.fromJson(json['drivingLicense'])
        : DrivingLicense.fromJson({});
    _livePhoto = json['livePhoto'] != null
        ? LivePhoto.fromJson(json['livePhoto'])
        : LivePhoto.fromJson({});
    ;
    // _biometric = json['biometric'];
  }
  AppointmentData? _appointment;
  PersonalData? _personal;
  EducationData? _education;
  BankData? _bank;
  Utilitybill? _utilitybill;
  DrivingLicense? _drivingLicense;
  LivePhoto? _livePhoto;
  // dynamic _biometric;

  AppointmentData? get appointment => _appointment;
  PersonalData? get personal => _personal;
  EducationData? get education => _education;
  BankData? get bank => _bank;
  Utilitybill? get utilitybill => _utilitybill;
  DrivingLicense? get drivingLicense => _drivingLicense;
  LivePhoto? get livePhoto => _livePhoto;
  // dynamic get biometric => _biometric;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_appointment != null) {
      map['appointment'] = _appointment?.toJson();
    }
    if (_personal != null) {
      map['personal'] = _personal?.toJson();
    }
    if (_education != null) {
      map['education'] = _education?.toJson();
    }
    if (_bank != null) {
      map['bank'] = _bank?.toJson();
    }
    if (_utilitybill != null) {
      map['utilitybill'] = _utilitybill?.toJson();
    }
    if (_drivingLicense != null) {
      map['drivingLicense'] = _drivingLicense?.toJson();
    }
    if (_livePhoto != null) {
      map['livePhoto'] = _livePhoto?.toJson();
    }
    // map['biometric'] = _biometric;
    return map;
  }
}

LivePhoto livePhotoFromJson(String str) => LivePhoto.fromJson(json.decode(str));
String livePhotoToJson(LivePhoto data) => json.encode(data.toJson());

class LivePhoto {
  LivePhoto({
    int? id,
    String? userId,
    String? photo,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _userId = userId;
    _photo = photo;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  LivePhoto.fromJson(dynamic json) {
    _id = json['id'] ?? 0;
    _userId = json['user_id'] ?? "";
    _photo = json['photo'] ?? "";
    _createdAt = json['created_at'] ?? "";
    _updatedAt = json['updated_at'] ?? "";
  }
  int? _id;
  String? _userId;
  String? _photo;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get userId => _userId;
  String? get photo => _photo;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['photo'] = _photo;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

DrivingLicense drivingLicenseFromJson(String str) =>
    DrivingLicense.fromJson(json.decode(str));
String drivingLicenseToJson(DrivingLicense data) => json.encode(data.toJson());

class DrivingLicense {
  DrivingLicense({
    int? id,
    String? userId,
    String? license,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _userId = userId;
    _license = license;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  DrivingLicense.fromJson(dynamic json) {
    _id = json['id'] ?? 0;
    _userId = json['user_id'] ?? "";
    _license = json['license'] ?? "";
    _createdAt = json['created_at'] ?? "";
    _updatedAt = json['updated_at'] ?? "";
  }
  int? _id;
  String? _userId;
  String? _license;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get userId => _userId;
  String? get license => _license;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['license'] = _license;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

Utilitybill utilitybillFromJson(String str) =>
    Utilitybill.fromJson(json.decode(str));
String utilitybillToJson(Utilitybill data) => json.encode(data.toJson());

class Utilitybill {
  Utilitybill({
    int? id,
    String? userId,
    String? bill,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _userId = userId;
    _bill = bill;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Utilitybill.fromJson(dynamic json) {
    _id = json['id'] ?? 0;
    _userId = json['user_id'] ?? "";
    _bill = json['bill'] ?? "";
    _createdAt = json['created_at'] ?? "";
    _updatedAt = json['updated_at'] ?? "";
  }
  int? _id;
  String? _userId;
  String? _bill;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get userId => _userId;
  String? get bill => _bill;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['bill'] = _bill;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

BankData bankFromJson(String str) => BankData.fromJson(json.decode(str));
String bankToJson(BankData data) => json.encode(data.toJson());

class BankData {
  BankData({
    int? id,
    String? userId,
    String? bankName,
    String? accountNumber,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _userId = userId;
    _bankName = bankName;
    _accountNumber = accountNumber;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  BankData.fromJson(dynamic json) {
    _id = json['id'] ?? 0;
    _userId = json['user_id'] ?? "";
    _bankName = json['bank_name'] ?? "";
    _accountNumber = json['account_number'] ?? "";
    _createdAt = json['created_at'] ?? "";
    _updatedAt = json['updated_at'] ?? "";
  }
  int? _id;
  String? _userId;
  String? _bankName;
  String? _accountNumber;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get userId => _userId;
  String? get bankName => _bankName;
  String? get accountNumber => _accountNumber;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['bank_name'] = _bankName;
    map['account_number'] = _accountNumber;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

EducationData educationFromJson(String str) =>
    EducationData.fromJson(json.decode(str));
String educationToJson(EducationData data) => json.encode(data.toJson());

class EducationData {
  EducationData({
    int? id,
    String? userId,
    String? school,
    String? schoolYear,
    String? degree,
    String? degreeYear,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _userId = userId;
    _school = school;
    _schoolYear = schoolYear;
    _degree = degree;
    _degreeYear = degreeYear;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  EducationData.fromJson(dynamic json) {
    _id = json['id'] ?? 0;
    _userId = json['user_id'] ?? "";
    _school = json['school'] ?? "";
    _schoolYear = json['school_year'] ?? "";
    _degree = json['degree'] ?? "";
    _degreeYear = json['degree_year'] ?? "";
    _createdAt = json['created_at'] ?? "";
    _updatedAt = json['updated_at'] ?? "";
  }
  int? _id;
  String? _userId;
  String? _school;
  String? _schoolYear;
  String? _degree;
  String? _degreeYear;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get userId => _userId;
  String? get school => _school;
  String? get schoolYear => _schoolYear;
  String? get degree => _degree;
  String? get degreeYear => _degreeYear;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['school'] = _school;
    map['school_year'] = _schoolYear;
    map['degree'] = _degree;
    map['degree_year'] = _degreeYear;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

PersonalData personalFromJson(String str) =>
    PersonalData.fromJson(json.decode(str));
String personalToJson(PersonalData data) => json.encode(data.toJson());

class PersonalData {
  Personal({
    int? id,
    String? userId,
    String? name,
    String? email,
    String? mobile,
    String? address,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _userId = userId;
    _name = name;
    _email = email;
    _mobile = mobile;
    _address = address;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  PersonalData.fromJson(dynamic json) {
    _id = json['id'] ?? 0;
    _userId = json['user_id'] ?? "";
    _name = json['name'] ?? "";
    _email = json['email'] ?? "";
    _mobile = json['mobile'] ?? "";
    _address = json['address'] ?? "";
    _createdAt = json['created_at'] ?? "";
    _updatedAt = json['updated_at'] ?? "";
  }
  int? _id;
  String? _userId;
  String? _name;
  String? _email;
  String? _mobile;
  String? _address;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get userId => _userId;
  String? get name => _name;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get address => _address;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['name'] = _name;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['address'] = _address;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

AppointmentData appointmentFromJson(String str) =>
    AppointmentData.fromJson(json.decode(str));
String appointmentToJson(AppointmentData data) => json.encode(data.toJson());

class AppointmentData {
  AppointmentData({
    int? id,
    String? userId,
    String? name,
    String? email,
    String? mobile,
    String? address,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _userId = userId;
    _name = name;
    _email = email;
    _mobile = mobile;
    _address = address;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  AppointmentData.fromJson(dynamic json) {
    _id = json['id'] ?? 0;
    _userId = json['user_id'] ?? "";
    _name = json['name'] ?? "";
    _email = json['email'] ?? "";
    _mobile = json['mobile'] ?? "";
    _address = json['address'] ?? "";
    _createdAt = json['created_at'] ?? "";
    _updatedAt = json['updated_at'] ?? "";
  }
  int? _id;
  String? _userId;
  String? _name;
  String? _email;
  String? _mobile;
  String? _address;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get userId => _userId;
  String? get name => _name;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get address => _address;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['name'] = _name;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['address'] = _address;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
