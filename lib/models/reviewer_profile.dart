// ignore_for_file: prefer_collection_literals

class ReviewerProfile {
  int? id;
  String? cusName;

  ReviewerProfile({this.id, this.cusName});

  ReviewerProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cusName = json['cus_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['cus_name'] = cusName;
    return data;
  }
}
