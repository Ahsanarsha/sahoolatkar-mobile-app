import 'dart:convert';
GetFromCartModel getFromCartModelFromJson(String str) => GetFromCartModel.fromJson(json.decode(str));
String getFromCartModelToJson(GetFromCartModel data) => json.encode(data.toJson());
class GetFromCartModel {
  GetFromCartModel({
      String? status, 
      List<Cart>? cart,}){
    _status = status;
    _cart = cart;
}

  GetFromCartModel.fromJson(dynamic json) {
    _status = json['Status'];
    if (json['cart'] != null) {
      _cart = [];
      json['cart'].forEach((v) {
        _cart?.add(Cart.fromJson(v));
      });
    }
  }
  String? _status;
  List<Cart>? _cart;

  String? get status => _status;
  List<Cart>? get cart => _cart;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = _status;
    if (_cart != null) {
      map['cart'] = _cart?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));
String cartToJson(Cart data) => json.encode(data.toJson());
class Cart {
  Cart({
      dynamic id, 
      String? productId, 
      dynamic orderId, 
      String? userId, 
      String? price, 
      String? status, 
      String? quantity, 
      String? amount, 
      String? createdAt, 
      String? updatedAt, 
      Product? product,}){
    _id = id;
    _productId = productId;
    _orderId = orderId;
    _userId = userId;
    _price = price;
    _status = status;
    _quantity = quantity;
    _amount = amount;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _product = product;
}

  set quantity(String? value) {
    _quantity = value;
  }

  Cart.fromJson(dynamic json) {
    _id = json['id'];
    _productId = json['product_id'];
    _orderId = json['order_id'];
    _userId = json['user_id'];
    _price = json['price'];
    _status = json['status'];
    _quantity = json['quantity'];
    _amount = json['amount'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _product = json['product'] != null ? Product.fromJson(json['product']) : null;
  }
  dynamic _id;
  String? _productId;
  dynamic _orderId;
  String? _userId;
  String? _price;
  String? _status;
  String? _quantity;
  String? _amount;
  String? _createdAt;
  String? _updatedAt;
  Product? _product;

  dynamic get id => _id;
  String? get productId => _productId;
  dynamic get orderId => _orderId;
  String? get userId => _userId;
  String? get price => _price;
  String? get status => _status;
  String? get quantity => _quantity;
  String? get amount => _amount;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Product? get product => _product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_id'] = _productId;
    map['order_id'] = _orderId;
    map['user_id'] = _userId;
    map['price'] = _price;
    map['status'] = _status;
    map['quantity'] = _quantity;
    map['amount'] = _amount;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    return map;
  }

}

Product productFromJson(String str) => Product.fromJson(json.decode(str));
String productToJson(Product data) => json.encode(data.toJson());
class Product {
  Product({
      dynamic id, 
      String? name, 
      String? categoryId, 
      String? code, 
      String? department, 
      String? catType, 
      String? parentCategory, 
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
      String? isFreatured, 
      dynamic description, 
      String? quantity, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _categoryId = categoryId;
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
}

  Product.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _categoryId = json['category_id'];
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
  }
  dynamic _id;
  String? _name;
  String? _categoryId;

  set quantity(String? value) {
    _quantity = value;
  }

  String? _code;
  String? _department;
  String? _catType;
  String? _parentCategory;
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
  String? _isFreatured;
  dynamic _description;
  String? _quantity;
  String? _createdAt;
  String? _updatedAt;

  dynamic get id => _id;
  String? get name => _name;
  String? get categoryId => _categoryId;
  String? get code => _code;
  String? get department => _department;
  String? get catType => _catType;
  String? get parentCategory => _parentCategory;
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
  String? get isFreatured => _isFreatured;
  dynamic get description => _description;

  String? get quantity => _quantity;

  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['category_id'] = _categoryId;
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
    return map;
  }

}