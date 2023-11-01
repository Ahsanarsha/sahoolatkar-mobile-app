import 'dart:convert';

Bank bankFromJson(String str) => Bank.fromJson(json.decode(str));
String bankToJson(Bank data) => json.encode(data.toJson());

class Bank {
  Bank({
    String? bankName,
    String? accountNumber,
  }) {
    _bankName = bankName;
    _accountNumber = accountNumber;
  }

  Bank.fromJson(dynamic json) {
    _bankName = json['bank_name'];
    _accountNumber = json['account_number'];
  }
  String? _bankName;
  String? _accountNumber;

  String? get bankName => _bankName;
  String? get accountNumber => _accountNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bank_name'] = _bankName;
    map['account_number'] = _accountNumber;
    return map;
  }
}
