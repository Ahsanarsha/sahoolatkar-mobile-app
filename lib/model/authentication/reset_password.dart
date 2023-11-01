import 'dart:convert';

ResetPassword resetPasswordFromJson(String str) =>
    ResetPassword.fromJson(json.decode(str));
String resetPasswordToJson(ResetPassword data) => json.encode(data.toJson());

class ResetPassword {
  ResetPassword({
    String? email,
    String? token,
    String? password,
    String? passwordconfirmation,
  }) {
    _email = email;
    _password = password;
    _passwordconfirmation = passwordconfirmation;
  }

  ResetPassword.fromJson(dynamic json) {
    _email = json['email'];

    _password = json['password'];
    _passwordconfirmation = json['password_confirmation'];
  }
  String? _email;

  String? _password;
  String? _passwordconfirmation;

  String? get email => _email;

  String? get password => _password;
  String? get passwordconfirmation => _passwordconfirmation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;

    map['password'] = _password;
    map['password_confirmation'] = _passwordconfirmation;
    return map;
  }
}
