import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));
String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  Register({
    String? name,
    String? email,
    String? password,
    String? passwordConfirmation,
    String? mobile,

  }) {
    _name = name;
    _email = email;
    _password = password;
    _passwordConfirmation = passwordConfirmation;
    _mobile = mobile;

  }

  Register.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
    _passwordConfirmation = json['password_confirmation'];
    _mobile = json['mobile'];
  }
  String? _name;
  String? _email;
  String? _password;
  String? _passwordConfirmation;
  String? _mobile;

  String? get name => _name;
  String? get email => _email;
  String? get password => _password;
  String? get passwordConfirmation => _passwordConfirmation;
  String? get mobile => _mobile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['password'] = _password;
    map['password_confirmation'] = _passwordConfirmation;
    map['mobile'] = _mobile;
    return map;
  }
}
