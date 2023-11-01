class OrdersHistoryDataModel {
  String? status;
  List<OrdersData>? data;

  OrdersHistoryDataModel({this.status, this.data});

  OrdersHistoryDataModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    if (json['data'] != null) {
      data = <OrdersData>[];
      json['data'].forEach((v) {
        data!.add(OrdersData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrdersData {
  int? id;
  String? userId;
  String? productId;
  String? quantity;
  String? totalAmount;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<Products>? products;

  OrdersData(
      {this.id,
        this.userId,
        this.productId,
        this.quantity,
        this.totalAmount,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.products});

  OrdersData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    totalAmount = json['total_amount'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add( Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['quantity'] =quantity;
    data['total_amount'] = totalAmount;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? code;
  String? department;
  String? catType;
  dynamic catTypeImage;
  String? category;
  String? subCategory;
  String? salePrice;
  String? vendorDetail;
  dynamic brandImage;
  dynamic productImage;
  dynamic mrpPrice;
  dynamic color;
  dynamic departmentStatus;
  String? isFreatured;
  dynamic description;
  String? quantity;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Products(
      {this.id,
        this.name,
        this.code,
        this.department,
        this.catType,
        this.catTypeImage,
        this.category,
        this.subCategory,
        this.salePrice,
        this.vendorDetail,
        this.brandImage,
        this.productImage,
        this.mrpPrice,
        this.color,
        this.departmentStatus,
        this.isFreatured,
        this.description,
        this.quantity,
        this.createdAt,
        this.updatedAt,
        this.pivot});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    department = json['department'];
    catType = json['cat_type'];
    catTypeImage = json['cat_type_image'];
    category = json['category'];
    subCategory = json['subCategory'];
    salePrice = json['salePrice'];
    vendorDetail = json['vendorDetail'];
    brandImage = json['brand_image'];
    productImage = json['product_image'];
    mrpPrice = json['mrp_price'];
    color = json['color'];
    departmentStatus = json['department_status'];
    isFreatured = json['is_freatured'];
    description = json['description'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['department'] = department;
    data['cat_type'] = catType;
    data['cat_type_image'] = catTypeImage;
    data['category'] = category;
    data['subCategory'] = subCategory;
    data['salePrice'] = salePrice;
    data['vendorDetail'] = vendorDetail;
    data['brand_image'] = brandImage;
    data['product_image'] = productImage;
    data['mrp_price'] = mrpPrice;
    data['color'] = color;
    data['department_status'] = departmentStatus;
    data['is_freatured'] = isFreatured;
    data['description'] = description;
    data['quantity'] = quantity;
    data['created_at'] =createdAt;
    data['updated_at'] = updatedAt;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  String? ordersId;
  String? productId;

  Pivot({this.ordersId, this.productId});

  Pivot.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['orders_id'] =ordersId;
    data['product_id'] = productId;
    return data;
  }
}