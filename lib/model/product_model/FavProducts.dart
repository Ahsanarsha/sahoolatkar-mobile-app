import 'dart:convert';
FavProducts favProductsFromJson(String str) => FavProducts.fromJson(json.decode(str));
String favProductsToJson(FavProducts data) => json.encode(data.toJson());
class FavProducts {
  FavProducts({
      String? status, 
      List<Favourite>? favourite,}){
    _status = status;
    _favourite = favourite;
}

  FavProducts.fromJson(dynamic json) {
    _status = json['Status'];
    if (json['Favourite'] != null) {
      _favourite = [];
      json['Favourite'].forEach((v) {
        _favourite?.add(Favourite.fromJson(v));
      });
    }
  }
  String? _status;
  List<Favourite>? _favourite;

  String? get status => _status;
  List<Favourite>? get favourite => _favourite;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = _status;
    if (_favourite != null) {
      map['Favourite'] = _favourite?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Favourite favouriteFromJson(String str) => Favourite.fromJson(json.decode(str));
String favouriteToJson(Favourite data) => json.encode(data.toJson());
class Favourite {
  Favourite({
      dynamic id, 
      dynamic productId, 
      dynamic userId, 
      String? createdAt, 
      String? updatedAt, 
      List<Products>? products,}){
    _id = id;
    _productId = productId;
    _userId = userId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _products = products;
}

  Favourite.fromJson(dynamic json) {
    _id = json['id'];
    _productId = json['product_id'];
    _userId = json['user_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }
  dynamic _id;
  dynamic _productId;
  dynamic _userId;
  String? _createdAt;
  String? _updatedAt;
  List<Products>? _products;

  dynamic get id => _id;
  dynamic get productId => _productId;
  dynamic get userId => _userId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<Products>? get products => _products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_id'] = _productId;
    map['user_id'] = _userId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Products productsFromJson(String str) => Products.fromJson(json.decode(str));
String productsToJson(Products data) => json.encode(data.toJson());
class Products {
  Products({
      dynamic id, 
      String? name, 
      String? code, 
      String? department, 
      String? catType, 
      dynamic parentCategory, 
      dynamic catTypeImage, 
      String? category, 
      String? subCategory, 
      String? salePrice, 
      String? vendorDetail, 
      dynamic brandImage, 
      dynamic productImage, 
      dynamic mrpPrice, 
      dynamic color, 
      dynamic departmentStatus, 
      dynamic isFreatured, 
      dynamic description, 
      dynamic quantity, 
      String? createdAt, 
      String? updatedAt, 
      Pivot? pivot,}){
    _id = id;
    _name = name;
    _code = code;
    _department = department;
    _catType = catType;
    _parentCategory = parentCategory;
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
    _pivot = pivot;
}

  Products.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
    _department = json['department'];
    _catType = json['cat_type'];
    _parentCategory = json['parent_category'];
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
    _pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }
  dynamic _id;
  String? _name;
  String? _code;
  String? _department;
  String? _catType;
  dynamic _parentCategory;
  dynamic _catTypeImage;
  String? _category;
  String? _subCategory;
  String? _salePrice;
  String? _vendorDetail;
  dynamic _brandImage;
  dynamic _productImage;
  dynamic _mrpPrice;
  dynamic _color;
  dynamic _departmentStatus;
  dynamic _isFreatured;
  dynamic _description;
  dynamic _quantity;
  String? _createdAt;
  String? _updatedAt;
  Pivot? _pivot;

  dynamic get id => _id;
  String? get name => _name;
  String? get code => _code;
  String? get department => _department;
  String? get catType => _catType;
  dynamic get parentCategory => _parentCategory;
  dynamic get catTypeImage => _catTypeImage;
  String? get category => _category;
  String? get subCategory => _subCategory;
  String? get salePrice => _salePrice;
  String? get vendorDetail => _vendorDetail;
  dynamic get brandImage => _brandImage;
  dynamic get productImage => _productImage;
  dynamic get mrpPrice => _mrpPrice;
  dynamic get color => _color;
  dynamic get departmentStatus => _departmentStatus;
  dynamic get isFreatured => _isFreatured;
  dynamic get description => _description;
  dynamic get quantity => _quantity;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Pivot? get pivot => _pivot;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['code'] = _code;
    map['department'] = _department;
    map['cat_type'] = _catType;
    map['parent_category'] = _parentCategory;
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
    if (_pivot != null) {
      map['pivot'] = _pivot?.toJson();
    }
    return map;
  }

}

Pivot pivotFromJson(String str) => Pivot.fromJson(json.decode(str));
String pivotToJson(Pivot data) => json.encode(data.toJson());
class Pivot {
  Pivot({
      dynamic id, 
      dynamic productId,}){
    _id = id;
    _productId = productId;
}

  Pivot.fromJson(dynamic json) {
    _id = json['id'];
    _productId = json['product_id'];
  }
  dynamic _id;
  dynamic _productId;

  dynamic get id => _id;
  dynamic get productId => _productId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_id'] = _productId;
    return map;
  }

}