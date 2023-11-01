import 'dart:convert';
FeaturedProducts featuredProductsFromJson(String str) => FeaturedProducts.fromJson(json.decode(str));
String featuredProductsToJson(FeaturedProducts data) => json.encode(data.toJson());
class FeaturedProducts {
  FeaturedProducts({
      String? status, 
      List<Data>? data,}){
    _status = status;
    _data = data;
}

  FeaturedProducts.fromJson(dynamic json) {
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
      String? code, 
      String? department, 
      String? type, 
      String? category, 
      String? subCategory, 
      String? salePrice, 
      String? vendorDetail, 
      String? brandImage, 
      String? productImage, 
      String? mrpPrice, 
      String? color, 
      String? departmentStatus, 
      dynamic isFreatured,
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _code = code;
    _department = department;
    _type = type;
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
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
    _department = json['department'];
    _type = json['type'];
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
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  String? _code;
  String? _department;
  String? _type;
  String? _category;
  String? _subCategory;
  String? _salePrice;
  String? _vendorDetail;
  String? _brandImage;
  String? _productImage;
  String? _mrpPrice;
  String? _color;
  String? _departmentStatus;
  dynamic _isFreatured;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get name => _name;
  String? get code => _code;
  String? get department => _department;
  String? get type => _type;
  String? get category => _category;
  String? get subCategory => _subCategory;
  String? get salePrice => _salePrice;
  String? get vendorDetail => _vendorDetail;
  String? get brandImage => _brandImage;
  String? get productImage => _productImage;
  String? get mrpPrice => _mrpPrice;
  String? get color => _color;
  String? get departmentStatus => _departmentStatus;
  dynamic get isFreatured => _isFreatured;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['code'] = _code;
    map['department'] = _department;
    map['type'] = _type;
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
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}