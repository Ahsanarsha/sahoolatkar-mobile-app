import 'dart:convert';
GoalPointsResponse goalPointsResponseFromJson(String str) => GoalPointsResponse.fromJson(json.decode(str));
String goalPointsResponseToJson(GoalPointsResponse data) => json.encode(data.toJson());
class GoalPointsResponse {
  GoalPointsResponse({
      String? status, 
      List<Data>? data,}){
    _status = status;
    _data = data;
}

  GoalPointsResponse.fromJson(dynamic json) {
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
      dynamic creditPoints,}){
    _creditPoints = creditPoints;
}

  Data.fromJson(dynamic json) {
    _creditPoints = json['credit_points'];
  }
  dynamic _creditPoints;

  dynamic get creditPoints => _creditPoints;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['credit_points'] = _creditPoints;
    return map;
  }

}