// ignore_for_file: prefer_typing_uninitialized_variables

class HomeSliderModel {
  int? code;
  String? status;
  String? msg;
  Data? data;

  HomeSliderModel({this.code, this.status, this.msg, this.data});

  HomeSliderModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<SliderData>? sliderData;
  int? total;
  var firstPage;
  var previous;
  var next;
  var lastPage;

  Data(
      {this.sliderData,
      this.total,
      this.firstPage,
      this.previous,
      this.next,
      this.lastPage});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      sliderData = <SliderData>[];
      json['results'].forEach((v) {
        sliderData!.add(SliderData.fromJson(v));
      });
    }
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }
}

class SliderData {
  String? sId;
  String? photoUrl;
  String? description;
  var product;
  String? brand;
  var category;
  String? createdAt;
  String? updatedAt;
  int? iV;

  SliderData(
      {this.sId,
      this.photoUrl,
      this.description,
      this.product,
      this.brand,
      this.category,
      this.createdAt,
      this.updatedAt,
      this.iV});

  SliderData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    photoUrl = json['photo_url'];
    description = json['description'];
    product = json['product'];
    brand = json['brand'];
    category = json['category'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}
