import 'dart:convert';

Education educationFromJson(String str) => Education.fromJson(json.decode(str));
String educationToJson(Education data) => json.encode(data.toJson());

class Education {
  Education({
    String? school,
    String? schoolYear,
    String? degree,
    String? degreeYear,
  }) {
    _school = school;
    _schoolYear = schoolYear;
    _degree = degree;
    _degreeYear = degreeYear;
  }

  Education.fromJson(dynamic json) {
    _school = json['school'];
    _schoolYear = json['school_year'];
    _degree = json['degree'];
    _degreeYear = json['degree_year'];
  }
  String? _school;
  String? _schoolYear;
  String? _degree;
  String? _degreeYear;

  String? get school => _school;
  String? get schoolYear => _schoolYear;
  String? get degree => _degree;
  String? get degreeYear => _degreeYear;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['school'] = _school;
    map['school_year'] = _schoolYear;
    map['degree'] = _degree;
    map['degree_year'] = _degreeYear;
    return map;
  }
}
