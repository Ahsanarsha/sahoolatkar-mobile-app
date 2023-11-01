import 'dart:convert';
BecomeMerchantBody becomeMerchantBodyFromJson(String str) => BecomeMerchantBody.fromJson(json.decode(str));
String becomeMerchantBodyToJson(BecomeMerchantBody data) => json.encode(data.toJson());
class BecomeMerchantBody {
  BecomeMerchantBody({
      String? userId, 
      PersonalInfo? personalInfo, 
      BusinessInfo? businessInfo, 
      BusinessMailing? businessMailing,}){
    _userId = userId;
    _personalInfo = personalInfo;
    _businessInfo = businessInfo;
    _businessMailing = businessMailing;
}

  BecomeMerchantBody.fromJson(dynamic json) {
    _userId = json['user_id'];
    _personalInfo = json['personalInfo'] != null ? PersonalInfo.fromJson(json['personalInfo']) : null;
    _businessInfo = json['businessInfo'] != null ? BusinessInfo.fromJson(json['businessInfo']) : null;
    _businessMailing = json['businessMailing'] != null ? BusinessMailing.fromJson(json['businessMailing']) : null;
  }
  String? _userId;
  PersonalInfo? _personalInfo;
  BusinessInfo? _businessInfo;
  BusinessMailing? _businessMailing;

  String? get userId => _userId;
  PersonalInfo? get personalInfo => _personalInfo;
  BusinessInfo? get businessInfo => _businessInfo;
  BusinessMailing? get businessMailing => _businessMailing;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    if (_personalInfo != null) {
      map['personalInfo'] = _personalInfo?.toJson();
    }
    if (_businessInfo != null) {
      map['businessInfo'] = _businessInfo?.toJson();
    }
    if (_businessMailing != null) {
      map['businessMailing'] = _businessMailing?.toJson();
    }
    return map;
  }

}

BusinessMailing businessMailingFromJson(String str) => BusinessMailing.fromJson(json.decode(str));
String businessMailingToJson(BusinessMailing data) => json.encode(data.toJson());
class BusinessMailing {
  BusinessMailing({
      String? address, 
      String? city,}){
    _address = address;
    _city = city;
}

  BusinessMailing.fromJson(dynamic json) {
    _address = json['address'];
    _city = json['city'];
  }
  String? _address;
  String? _city;

  String? get address => _address;
  String? get city => _city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = _address;
    map['city'] = _city;
    return map;
  }

}

BusinessInfo businessInfoFromJson(String str) => BusinessInfo.fromJson(json.decode(str));
String businessInfoToJson(BusinessInfo data) => json.encode(data.toJson());
class BusinessInfo {
  BusinessInfo({
      String? officialName, 
      String? bsusinessAddress, 
      String? nature, 
      String? bsusinessYears, 
      String? shopSize,
      String? shopNo,
      String? ownership, 
      String? monthlyRent,}){
    _officialName = officialName;
    _bsusinessAddress = bsusinessAddress;
    _nature = nature;
    _bsusinessYears = bsusinessYears;
    _shopSize = shopSize;
    _shopNo = shopNo;
    _ownership = ownership;
    _monthlyRent = monthlyRent;
}

  BusinessInfo.fromJson(dynamic json) {
    _officialName = json['officialName'];
    _bsusinessAddress = json['bsusinessAddress'];
    _nature = json['nature'];
    _bsusinessYears = json['bsusinessYears'];
    _shopSize = json['shopSize'];
    _shopNo = json['no_of_shop'];
    _ownership = json['ownership'];
    _monthlyRent = json['monthlyRent'];
  }
  String? _officialName;
  String? _bsusinessAddress;
  String? _nature;
  String? _bsusinessYears;
  String? _shopSize;
  String? _shopNo;
  String? _ownership;
  String? _monthlyRent;

  String? get officialName => _officialName;
  String? get bsusinessAddress => _bsusinessAddress;
  String? get nature => _nature;
  String? get bsusinessYears => _bsusinessYears;
  String? get shopSize => _shopSize;
  String? get ownership => _ownership;
  String? get monthlyRent => _monthlyRent;
  String? get shopNo => _shopNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['officialName'] = _officialName;
    map['bsusinessAddress'] = _bsusinessAddress;
    map['nature'] = _nature;
    map['bsusinessYears'] = _bsusinessYears;
    map['shopSize'] = _shopSize;
    map['no_of_shop'] = _shopNo;
    map['ownership'] = _ownership;
    map['monthlyRent'] = _monthlyRent;
    return map;
  }

}

PersonalInfo personalInfoFromJson(String str) => PersonalInfo.fromJson(json.decode(str));
String personalInfoToJson(PersonalInfo data) => json.encode(data.toJson());
class PersonalInfo {
  PersonalInfo({
      String? name, 
      String? cnic, 
      String? mobile, 
      String? email,}){
    _name = name;
    _cnic = cnic;
    _mobile = mobile;
    _email = email;
}

  PersonalInfo.fromJson(dynamic json) {
    _name = json['name'];
    _cnic = json['cnic'];
    _mobile = json['mobile'];
    _email = json['email'];
  }
  String? _name;
  String? _cnic;
  String? _mobile;
  String? _email;

  String? get name => _name;
  String? get cnic => _cnic;
  String? get mobile => _mobile;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['cnic'] = _cnic;
    map['mobile'] = _mobile;
    map['email'] = _email;
    return map;
  }

}