import 'dart:convert';
HotCategoryModel hotCategoryModelFromJson(String str) => HotCategoryModel.fromJson(json.decode(str));
String hotCategoryModelToJson(HotCategoryModel data) => json.encode(data.toJson());
class HotCategoryModel {
  HotCategoryModel({
      String? status, 
      List<Data>? data,}){
    _status = status;
    _data = data;
}

  HotCategoryModel.fromJson(dynamic json) {
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
      String? name, 
      dynamic photo, 
      dynamic isHot, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _photo = photo;
    _isHot = isHot;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _photo = json['photo'];
    _isHot = json['is_hot'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  dynamic _id;
  String? _name;
  dynamic _photo;
  dynamic _isHot;
  String? _createdAt;
  String? _updatedAt;

  dynamic get id => _id;
  String? get name => _name;
  dynamic get photo => _photo;
  dynamic get isHot => _isHot;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['photo'] = _photo;
    map['is_hot'] = _isHot;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}