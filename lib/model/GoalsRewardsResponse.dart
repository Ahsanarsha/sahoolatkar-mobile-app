import 'dart:convert';
GoalsRewardsResponse goalsRewardsResponseFromJson(String str) => GoalsRewardsResponse.fromJson(json.decode(str));
String goalsRewardsResponseToJson(GoalsRewardsResponse data) => json.encode(data.toJson());
class GoalsRewardsResponse {
  GoalsRewardsResponse({
      String? status, 
      List<Data>? data,}){
    _status = status;
    _data = data;
}

  GoalsRewardsResponse.fromJson(dynamic json) {
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
      String? title, 
      String? cashRange, 
      String? points, 
      dynamic status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _title = title;
    _cashRange = cashRange;
    _points = points;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _cashRange = json['cash_range'];
    _points = json['points'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  dynamic _id;
  String? _title;
  String? _cashRange;
  String? _points;
  dynamic _status;
  String? _createdAt;
  String? _updatedAt;

  dynamic get id => _id;
  String? get title => _title;
  String? get cashRange => _cashRange;
  String? get points => _points;
  dynamic get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['cash_range'] = _cashRange;
    map['points'] = _points;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}