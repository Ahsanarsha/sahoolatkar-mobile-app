import 'dart:convert';
BannerModel bannerModelFromJson(String str) => BannerModel.fromJson(json.decode(str));
String bannerModelToJson(BannerModel data) => json.encode(data.toJson());
class BannerModel {
  BannerModel({
      String? status, 
      List<Data>? data,}){
    _status = status;
    _data = data;
}

  BannerModel.fromJson(dynamic json) {
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
      dynamic id, 
      String? banerImage, 
      dynamic status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _banerImage = banerImage;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _banerImage = json['baner_image'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  dynamic _id;
  String? _banerImage;
  dynamic _status;
  String? _createdAt;
  String? _updatedAt;

  dynamic get id => _id;
  String? get banerImage => _banerImage;
  dynamic get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['baner_image'] = _banerImage;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}