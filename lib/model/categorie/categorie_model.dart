// ignore_for_file: prefer_typing_uninitialized_variables

class CategoriesModel {
  int? code;
  String? status;
  String? msg;
  Data? data;

  CategoriesModel({this.code, this.status, this.msg, this.data});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }


}

class Data {
  List<CategoryData>? categorieData;
  int? total;
  var firstPage;
  var previous;
  int? next;
  int? lastPage;

  Data(
      {this.categorieData,
      this.total,
      this.firstPage,
      this.previous,
      this.next,
      this.lastPage});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      categorieData = <CategoryData>[];
      json['results'].forEach((v) {
        categorieData!.add(CategoryData.fromJson(v));
      });
    }
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }

 
}

class CategoryData {
  String? sId;
  String? title;
  String? slug;
  String? description;
  String? icon;
  var parent;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CategoryData(
      {this.sId,
      this.title,
      this.slug,
      this.description,
      this.icon,
      this.parent,
      this.createdAt,
      this.updatedAt,
      this.iV});

  CategoryData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    icon = json['icon'];
    parent = json['parent'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

 
}
