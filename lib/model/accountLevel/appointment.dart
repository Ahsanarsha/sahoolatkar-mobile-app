import 'dart:convert';

Appointment appointmentFromJson(String str) =>
    Appointment.fromJson(json.decode(str));
String appointmentToJson(Appointment data) => json.encode(data.toJson());

class Appointment {
  Appointment({
    String? name,
    String? email,
    String? mobile,
    String? address,
  }) {
    _name = name;
    _email = email;
    _mobile = mobile;
    _address = address;
  }

  Appointment.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _mobile = json['mobile'];
    _address = json['address'];
  }
  String? _name;
  String? _email;
  String? _mobile;
  String? _address;

  String? get name => _name;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['address'] = _address;
    return map;
  }
}
