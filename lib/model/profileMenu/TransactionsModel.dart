import 'dart:convert';
TransactionsModel transactionsModelFromJson(String str) => TransactionsModel.fromJson(json.decode(str));
String transactionsModelToJson(TransactionsModel data) => json.encode(data.toJson());
class TransactionsModel {
  TransactionsModel({
      String? status, 
      List<Transactions>? transactions,}){
    _status = status;
    _transactions = transactions;
}

  TransactionsModel.fromJson(dynamic json) {
    _status = json['Status'];
    if (json['transactions'] != null) {
      _transactions = [];
      json['transactions'].forEach((v) {
        _transactions?.add(Transactions.fromJson(v));
      });
    }
  }
  String? _status;
  List<Transactions>? _transactions;

  String? get status => _status;
  List<Transactions>? get transactions => _transactions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = _status;
    if (_transactions != null) {
      map['transactions'] = _transactions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Transactions transactionsFromJson(String str) => Transactions.fromJson(json.decode(str));
String transactionsToJson(Transactions data) => json.encode(data.toJson());
class Transactions {
  Transactions({
      String? createdAt, 
      dynamic totalAmount,}){
    _createdAt = createdAt;
    _totalAmount = totalAmount;
}

  Transactions.fromJson(dynamic json) {
    _createdAt = json['created_at'];
    _totalAmount = json['total_amount'];
  }
  String? _createdAt;
  dynamic _totalAmount;

  String? get createdAt => _createdAt;
  dynamic get totalAmount => _totalAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['created_at'] = _createdAt;
    map['total_amount'] = _totalAmount;
    return map;
  }

}