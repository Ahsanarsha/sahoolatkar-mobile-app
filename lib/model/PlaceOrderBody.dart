import 'dart:convert';
PlaceOrderBody placeOrderBodyFromJson(String str) => PlaceOrderBody.fromJson(json.decode(str));
String placeOrderBodyToJson(PlaceOrderBody data) => json.encode(data.toJson());
class PlaceOrderBody {
  PlaceOrderBody({
      String? userrId, 
      DeliveryInfo? deliveryInfo, 
      OrderInfo? orderInfo,}){
    _userrId = userrId;
    _deliveryInfo = deliveryInfo;
    _orderInfo = orderInfo;
}

  PlaceOrderBody.fromJson(dynamic json) {
    _userrId = json['userr_id'];
    _deliveryInfo = json['deliveryInfo'] != null ? DeliveryInfo.fromJson(json['deliveryInfo']) : null;
    _orderInfo = json['orderInfo'] != null ? OrderInfo.fromJson(json['orderInfo']) : null;
  }
  String? _userrId;
  DeliveryInfo? _deliveryInfo;
  OrderInfo? _orderInfo;

  String? get userrId => _userrId;
  DeliveryInfo? get deliveryInfo => _deliveryInfo;
  OrderInfo? get orderInfo => _orderInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userr_id'] = _userrId;
    if (_deliveryInfo != null) {
      map['deliveryInfo'] = _deliveryInfo?.toJson();
    }
    if (_orderInfo != null) {
      map['orderInfo'] = _orderInfo?.toJson();
    }
    return map;
  }

}

OrderInfo orderInfoFromJson(String str) => OrderInfo.fromJson(json.decode(str));
String orderInfoToJson(OrderInfo data) => json.encode(data.toJson());
class OrderInfo {
  OrderInfo({
      List<ProductDetails>? productDetails, 
      String? total,}){
    _productDetails = productDetails;
    _total = total;
}

  OrderInfo.fromJson(dynamic json) {
    if (json['productDetails'] != null) {
      _productDetails = [];
      json['productDetails'].forEach((v) {
        _productDetails?.add(ProductDetails.fromJson(v));
      });
    }
    _total = json['total'];
  }
  List<ProductDetails>? _productDetails;
  String? _total;

  List<ProductDetails>? get productDetails => _productDetails;
  String? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_productDetails != null) {
      map['productDetails'] = _productDetails?.map((v) => v.toJson()).toList();
    }
    map['total'] = _total;
    return map;
  }

}

ProductDetails productDetailsFromJson(String str) => ProductDetails.fromJson(json.decode(str));
String productDetailsToJson(ProductDetails data) => json.encode(data.toJson());
class ProductDetails {
  ProductDetails({
      String? productId, 
      String? qty,}){
    _productId = productId;
    _qty = qty;
}

  ProductDetails.fromJson(dynamic json) {
    _productId = json['product_id'];
    _qty = json['qty'];
  }
  String? _productId;
  String? _qty;

  String? get productId => _productId;
  String? get qty => _qty;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = _productId;
    map['qty'] = _qty;
    return map;
  }

}

DeliveryInfo deliveryInfoFromJson(String str) => DeliveryInfo.fromJson(json.decode(str));
String deliveryInfoToJson(DeliveryInfo data) => json.encode(data.toJson());
class DeliveryInfo {
  DeliveryInfo({
      String? fullName, 
      String? email, 
      String? address, 
      String? addressOne, 
      String? country, 
      String? contact, 
      String? city, 
      String? zip, 
      String? state,}){
    _fullName = fullName;
    _email = email;
    _address = address;
    _addressOne = addressOne;
    _country = country;
    _contact = contact;
    _city = city;
    _zip = zip;
    _state = state;
}

  DeliveryInfo.fromJson(dynamic json) {
    _fullName = json['fullName'];
    _email = json['email'];
    _address = json['address'];
    _addressOne = json['addressOne'];
    _country = json['country'];
    _contact = json['contact'];
    _city = json['city'];
    _zip = json['zip'];
    _state = json['state'];
  }
  String? _fullName;
  String? _email;
  String? _address;
  String? _addressOne;
  String? _country;
  String? _contact;
  String? _city;
  String? _zip;
  String? _state;

  String? get fullName => _fullName;
  String? get email => _email;
  String? get address => _address;
  String? get addressOne => _addressOne;
  String? get country => _country;
  String? get contact => _contact;
  String? get city => _city;
  String? get zip => _zip;
  String? get state => _state;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullName'] = _fullName;
    map['email'] = _email;
    map['address'] = _address;
    map['addressOne'] = _addressOne;
    map['country'] = _country;
    map['contact'] = _contact;
    map['city'] = _city;
    map['zip'] = _zip;
    map['state'] = _state;
    return map;
  }

}