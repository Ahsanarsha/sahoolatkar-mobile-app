import 'dart:convert';
SearchModelResponse searchModelResponseFromJson(String str) => SearchModelResponse.fromJson(json.decode(str));
String searchModelResponseToJson(SearchModelResponse data) => json.encode(data.toJson());
class SearchModelResponse {
  SearchModelResponse({
      String? status, 
      List<Data>? data,}){
    _status = status;
    _data = data;
}

  SearchModelResponse.fromJson(dynamic json) {
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
      String? code, 
      String? department, 
      String? catType, 
      dynamic catTypeImage, 
      String? category, 
      String? subCategory, 
      String? salePrice, 
      String? vendorDetail, 
      dynamic brandImage, 
      dynamic productImage, 
      dynamic mrpPrice, 
      dynamic color, 
      String? departmentStatus, 
      dynamic isFreatured, 
      dynamic description, 
      dynamic quantity, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _code = code;
    _department = department;
    _catType = catType;
    _catTypeImage = catTypeImage;
    _category = category;
    _subCategory = subCategory;
    _salePrice = salePrice;
    _vendorDetail = vendorDetail;
    _brandImage = brandImage;
    _productImage = productImage;
    _mrpPrice = mrpPrice;
    _color = color;
    _departmentStatus = departmentStatus;
    _isFreatured = isFreatured;
    _description = description;
    _quantity = quantity;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
    _department = json['department'];
    _catType = json['cat_type'];
    _catTypeImage = json['cat_type_image'];
    _category = json['category'];
    _subCategory = json['subCategory'];
    _salePrice = json['salePrice'];
    _vendorDetail = json['vendorDetail'];
    _brandImage = json['brand_image'];
    _productImage = json['product_image'];
    _mrpPrice = json['mrp_price'];
    _color = json['color'];
    _departmentStatus = json['department_status'];
    _isFreatured = json['is_freatured'];
    _description = json['description'];
    _quantity = json['quantity'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  dynamic _id;
  String? _name;
  String? _code;
  String? _department;
  String? _catType;
  dynamic _catTypeImage;
  String? _category;
  String? _subCategory;
  String? _salePrice;
  String? _vendorDetail;
  dynamic _brandImage;
  dynamic _productImage;
  dynamic _mrpPrice;
  dynamic _color;
  String? _departmentStatus;
  dynamic _isFreatured;
  dynamic _description;
  dynamic _quantity;
  String? _createdAt;
  String? _updatedAt;

  dynamic get id => _id;
  String? get name => _name;
  String? get code => _code;
  String? get department => _department;
  String? get catType => _catType;
  dynamic get catTypeImage => _catTypeImage;
  String? get category => _category;
  String? get subCategory => _subCategory;
  String? get salePrice => _salePrice;
  String? get vendorDetail => _vendorDetail;
  dynamic get brandImage => _brandImage;
  dynamic get productImage => _productImage;
  dynamic get mrpPrice => _mrpPrice;
  dynamic get color => _color;
  String? get departmentStatus => _departmentStatus;
  dynamic get isFreatured => _isFreatured;
  dynamic get description => _description;
  dynamic get quantity => _quantity;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['code'] = _code;
    map['department'] = _department;
    map['cat_type'] = _catType;
    map['cat_type_image'] = _catTypeImage;
    map['category'] = _category;
    map['subCategory'] = _subCategory;
    map['salePrice'] = _salePrice;
    map['vendorDetail'] = _vendorDetail;
    map['brand_image'] = _brandImage;
    map['product_image'] = _productImage;
    map['mrp_price'] = _mrpPrice;
    map['color'] = _color;
    map['department_status'] = _departmentStatus;
    map['is_freatured'] = _isFreatured;
    map['description'] = _description;
    map['quantity'] = _quantity;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}