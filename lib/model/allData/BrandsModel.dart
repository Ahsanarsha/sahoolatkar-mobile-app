/// Status : "Successs"
/// data : [{"id":1,"title":"KOH E NOOR","slug":null,"photo":"1675751047.jpeg","status":"active","created_at":"2023-01-31T07:46:12.000000Z","updated_at":"2023-02-07T06:24:07.000000Z"},{"id":2,"title":"PAKSON INTERNATIONAL","slug":null,"photo":"1675751140.png","status":"active","created_at":"2023-01-31T07:46:12.000000Z","updated_at":"2023-02-09T09:40:33.000000Z"},{"id":3,"title":"DAWLANCE","slug":null,"photo":"1675750927.png","status":"active","created_at":"2023-01-31T07:46:12.000000Z","updated_at":"2023-02-09T09:40:33.000000Z"},{"id":4,"title":"HAIER","slug":null,"photo":"1675750957.png","status":"active","created_at":"2023-01-31T07:46:12.000000Z","updated_at":"2023-02-07T06:22:37.000000Z"},{"id":5,"title":"PEL","slug":null,"photo":"1675750991.png","status":"active","created_at":"2023-01-31T07:46:13.000000Z","updated_at":"2023-02-09T09:40:33.000000Z"},{"id":7,"title":"TOYO","slug":null,"photo":"1675751176.png","status":"active","created_at":"2023-01-31T07:46:13.000000Z","updated_at":"2023-02-07T06:26:16.000000Z"},{"id":8,"title":"TCL","slug":null,"photo":"1675751191.png","status":"active","created_at":"2023-01-31T07:46:14.000000Z","updated_at":"2023-02-07T06:26:34.000000Z"},{"id":9,"title":"TOSHIBA","slug":null,"photo":"1675752319.png","status":"active","created_at":"2023-01-31T07:46:14.000000Z","updated_at":"2023-02-07T06:45:19.000000Z"},{"id":10,"title":"SAMSUNG","slug":null,"photo":"1675751212.png","status":"active","created_at":"2023-01-31T07:46:14.000000Z","updated_at":"2023-02-08T04:59:04.000000Z"},{"id":12,"title":"COMPSI","slug":null,"photo":null,"status":"active","created_at":"2023-01-31T07:46:14.000000Z","updated_at":"2023-02-09T09:40:33.000000Z"},{"id":13,"title":"JSF TECHNOLOGY","slug":null,"photo":"1675751306.png","status":"active","created_at":"2023-01-31T07:46:14.000000Z","updated_at":"2023-02-09T09:40:33.000000Z"},{"id":15,"title":"HUAWEI","slug":null,"photo":"1675751369.png","status":"active","created_at":"2023-01-31T07:46:15.000000Z","updated_at":"2023-02-07T06:29:29.000000Z"},{"id":16,"title":"VIVO","slug":null,"photo":"1675751405.png","status":"active","created_at":"2023-01-31T07:46:15.000000Z","updated_at":"2023-02-07T06:30:05.000000Z"},{"id":17,"title":"UNITED","slug":null,"photo":"1675751430.png","status":"active","created_at":"2023-01-31T07:46:15.000000Z","updated_at":"2023-02-07T06:30:30.000000Z"},{"id":18,"title":"HONDA","slug":null,"photo":"1675751447.png","status":"active","created_at":"2023-01-31T07:46:15.000000Z","updated_at":"2023-02-07T06:30:47.000000Z"},{"id":20,"title":"CITY TYRE","slug":null,"photo":"1675752840.jpeg","status":"active","created_at":"2023-01-31T07:46:15.000000Z","updated_at":"2023-02-07T06:54:00.000000Z"},{"id":21,"title":"KB TYRE","slug":null,"photo":"1675753338.jpeg","status":"active","created_at":"2023-01-31T07:46:15.000000Z","updated_at":"2023-02-07T07:02:18.000000Z"},{"id":22,"title":"MR. TYRE","slug":null,"photo":"1675751697.png","status":"active","created_at":"2023-01-31T07:46:15.000000Z","updated_at":"2023-02-07T06:34:57.000000Z"},{"id":29,"title":"Test Brand","slug":null,"photo":"1676446337.mp4","status":"active","created_at":"2023-02-15T07:32:17.000000Z","updated_at":"2023-02-15T07:32:17.000000Z"}]

class BrandsModel {
  BrandsModel({
      String? status, 
      List<Data>? data,}){
    _status = status;
    _data = data;
}

  BrandsModel.fromJson(dynamic json) {
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
BrandsModel copyWith({  String? status,
  List<Data>? data,
}) => BrandsModel(  status: status ?? _status,
  data: data ?? _data,
);
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

/// id : 1
/// title : "KOH E NOOR"
/// slug : null
/// photo : "1675751047.jpeg"
/// status : "active"
/// created_at : "2023-01-31T07:46:12.000000Z"
/// updated_at : "2023-02-07T06:24:07.000000Z"

class Data {
  Data({
      int? id, 
      String? title, 
      dynamic slug, 
      String? photo, 
      String? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _title = title;
    _slug = slug;
    _photo = photo;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _slug = json['slug'];
    _photo = json['photo'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _title;
  dynamic _slug;
  String? _photo;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  int? id,
  String? title,
  dynamic slug,
  String? photo,
  String? status,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  title: title ?? _title,
  slug: slug ?? _slug,
  photo: photo ?? _photo,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  String? get title => _title;
  dynamic get slug => _slug;
  String? get photo => _photo;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['slug'] = _slug;
    map['photo'] = _photo;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}