class FaqModel {
  String? status;
  List<Faqs>? faqs;

  FaqModel({this.status, this.faqs});

  FaqModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    if (json['faqs'] != null) {
      faqs = <Faqs>[];
      json['faqs'].forEach((v) {
        faqs!.add(Faqs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    if (faqs != null) {
      data['faqs'] = faqs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Faqs {
  int? id;
  String? question;
  String? answer;
  dynamic status;
  String? createdAt;
  String? updatedAt;

  Faqs(
      {this.id,
        this.question,
        this.answer,
        this.status,
        this.createdAt,
        this.updatedAt});

  Faqs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['answer'] = answer;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}