import 'dart:convert';

StroreLocator stroreLocatorFromJson(String str) =>
    StroreLocator.fromJson(json.decode(str));
String stroreLocatorToJson(StroreLocator data) => json.encode(data.toJson());

class StroreLocator {
  StroreLocator({
    bool? success,
    List<StoreLocatorData>? data,
  }) {
    _success = success;
    _data = data;
  }

  StroreLocator.fromJson(dynamic json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(StoreLocatorData.fromJson(v));
      });
    }
  }
  bool? _success;
  List<StoreLocatorData>? _data;

  bool? get success => _success;
  List<StoreLocatorData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }

    return map;
  }
}

StoreLocatorData dataFromJson(String str) =>
    StoreLocatorData.fromJson(json.decode(str));
String dataToJson(StoreLocatorData data) => json.encode(data.toJson());

class StoreLocatorData {
  StoreLocatorData({
    int? id,
    String? name,
    String? photo,
    String? catId,
    String? location,
    String? latitude,
    String? longitude,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _photo = photo;
    _catId = catId;
    _location = location;
    _latitude = latitude;
    _longitude = longitude;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  StoreLocatorData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _photo = json['photo'];
    _catId = json['cat_id'] ?? "";
    _location = json['location'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  String? _photo;
  String? _catId;
  String? _location;
  String? _latitude;
  String? _longitude;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get name => _name;
  String? get photo => _photo;
  String? get catId => _catId;
  String? get location => _location;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['photo'] = _photo;
    map['cat_id'] = _catId;
    map['location'] = _location;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
