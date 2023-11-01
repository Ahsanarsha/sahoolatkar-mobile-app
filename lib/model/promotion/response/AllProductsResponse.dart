import 'dart:convert';
AllProductsResponse allProductsResponseFromJson(String str) => AllProductsResponse.fromJson(json.decode(str));
String allProductsResponseToJson(AllProductsResponse data) => json.encode(data.toJson());
class AllProductsResponse {
  AllProductsResponse({
      String? status, 
      Prodcuts? prodcuts,}){
    _status = status;
    _prodcuts = prodcuts;
}

  AllProductsResponse.fromJson(dynamic json) {
    _status = json['Status'];
    _prodcuts = json['prodcuts'] != null ? Prodcuts.fromJson(json['prodcuts']) : null;
  }
  String? _status;
  Prodcuts? _prodcuts;

  String? get status => _status;
  Prodcuts? get prodcuts => _prodcuts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = _status;
    if (_prodcuts != null) {
      map['prodcuts'] = _prodcuts?.toJson();
    }
    return map;
  }

}

Prodcuts prodcutsFromJson(String str) => Prodcuts.fromJson(json.decode(str));
String prodcutsToJson(Prodcuts data) => json.encode(data.toJson());
class Prodcuts {
  Prodcuts({
      dynamic currentPage, 
      List<Data>? data, 
      String? firstPageUrl, 
      dynamic from, 
      dynamic lastPage, 
      String? lastPageUrl, 
      List<Links>? links, 
      String? nextPageUrl, 
      String? path, 
      dynamic perPage, 
      String? prevPageUrl, 
      dynamic to, 
      dynamic total,}){
    _currentPage = currentPage;
    _data = data;
    _firstPageUrl = firstPageUrl;
    _from = from;
    _lastPage = lastPage;
    _lastPageUrl = lastPageUrl;
    _links = links;
    _nextPageUrl = nextPageUrl;
    _path = path;
    _perPage = perPage;
    _prevPageUrl = prevPageUrl;
    _to = to;
    _total = total;
}

  Prodcuts.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      _links = [];
      json['links'].forEach((v) {
        _links?.add(Links.fromJson(v));
      });
    }
    _nextPageUrl = json['next_page_url'];
    _path = json['path'];
    _perPage = json['per_page'];
    _prevPageUrl = json['prev_page_url'];
    _to = json['to'];
    _total = json['total'];
  }
  dynamic _currentPage;
  List<Data>? _data;
  String? _firstPageUrl;
  dynamic _from;
  dynamic _lastPage;
  String? _lastPageUrl;
  List<Links>? _links;
  String? _nextPageUrl;
  String? _path;
  dynamic _perPage;
  String? _prevPageUrl;
  dynamic _to;
  dynamic _total;

  dynamic get currentPage => _currentPage;
  List<Data>? get data => _data;
  String? get firstPageUrl => _firstPageUrl;
  dynamic get from => _from;
  dynamic get lastPage => _lastPage;
  String? get lastPageUrl => _lastPageUrl;
  List<Links>? get links => _links;
  String? get nextPageUrl => _nextPageUrl;
  String? get path => _path;
  dynamic get perPage => _perPage;
  String? get prevPageUrl => _prevPageUrl;
  dynamic get to => _to;
  dynamic get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = _firstPageUrl;
    map['from'] = _from;
    map['last_page'] = _lastPage;
    map['last_page_url'] = _lastPageUrl;
    if (_links != null) {
      map['links'] = _links?.map((v) => v.toJson()).toList();
    }
    map['next_page_url'] = _nextPageUrl;
    map['path'] = _path;
    map['per_page'] = _perPage;
    map['prev_page_url'] = _prevPageUrl;
    map['to'] = _to;
    map['total'] = _total;
    return map;
  }

}

Links linksFromJson(String str) => Links.fromJson(json.decode(str));
String linksToJson(Links data) => json.encode(data.toJson());
class Links {
  Links({
      String? url, 
      String? label, 
      bool? active,}){
    _url = url;
    _label = label;
    _active = active;
}

  Links.fromJson(dynamic json) {
    _url = json['url'];
    _label = json['label'];
    _active = json['active'];
  }
  String? _url;
  String? _label;
  bool? _active;

  String? get url => _url;
  String? get label => _label;
  bool? get active => _active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['label'] = _label;
    map['active'] = _active;
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
      dynamic departmentStatus, 
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
  dynamic _departmentStatus;
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
  dynamic get departmentStatus => _departmentStatus;
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