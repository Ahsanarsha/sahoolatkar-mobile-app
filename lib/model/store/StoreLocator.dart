import 'dart:convert';
StoreLocatorModel storeLocatorFromJson(String str) => StoreLocatorModel.fromJson(json.decode(str));
String storeLocatorToJson(StoreLocatorModel data) => json.encode(data.toJson());
class StoreLocatorModel {
  StoreLocatorModel({
      String? status, 
      List<Data>? data,}){
    _status = status;
    _data = data;
}

  StoreLocatorModel.fromJson(dynamic json) {
    _status = json['Status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _status;
  List<Data>? _data;

  String? get status => _status;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = _status;
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
      String? timing, 
      String? city, 
      dynamic street, 
      String? phone, 
      String? description, 
      String? location, 
      String? latitude, 
      String? longitude, 
      dynamic status,
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _timing = timing;
    _city = city;
    _street = street;
    _phone = phone;
    _description = description;
    _location = location;
    _latitude = latitude;
    _longitude = longitude;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _timing = json['timing'];
    _city = json['city'];
    _street = json['street'];
    _phone = json['phone'];
    _description = json['description'];
    _location = json['location'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  String? _timing;
  String? _city;
  dynamic _street;
  String? _phone;
  String? _description;
  String? _location;
  String? _latitude;
  String? _longitude;
  dynamic _status;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get name => _name;
  String? get timing => _timing;
  String? get city => _city;
  dynamic get street => _street;
  String? get phone => _phone;
  String? get description => _description;
  String? get location => _location;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  dynamic get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['timing'] = _timing;
    map['city'] = _city;
    map['street'] = _street;
    map['phone'] = _phone;
    map['description'] = _description;
    map['location'] = _location;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}