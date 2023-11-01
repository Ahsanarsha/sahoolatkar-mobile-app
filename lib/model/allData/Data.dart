class Data {
  Data({
      this.id, 
      this.name, 
      this.photo, 
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  dynamic photo;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['photo'] = photo;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}