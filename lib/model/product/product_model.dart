import 'package:crafty_bay/model/categorie/categorie_model.dart';

import '../brand/brand_data.dart';


class ProductModel {
  int? id;
  String? title;
  String? shortDes;
  String? price;
  int? discount;
  String? discountPrice;
  String? image;
  int? stock;
  int? star;
  String? remark;
  int? categoryId;
  int? brandId;
  String? createdAt;
  String? updatedAt;
  BrandData? brand;
  CategoriesModel? category;

  ProductModel(
      {this.id,
      this.title,
      this.shortDes,
      this.price,
      this.discount,
      this.discountPrice,
      this.image,
      this.stock,
      this.star,
      this.remark,
      this.categoryId,
      this.brandId,
      this.createdAt,
      this.updatedAt,
      this.brand,
      this.category});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDes = json['short_des'];
    price = json['price'];
    discount = json['discount'];
    discountPrice = json['discount_price'];
    image = json['image'];
    stock = json['stock'];
    star = json['star'];
    remark = json['remark'];
    categoryId = json['category_id'];
    brandId = json['brand_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    brand = json['brand'] != null ? BrandData.fromJson(json['brand']) : null;
    category = json['category'] != null
        ? CategoriesModel.fromJson(json['category'])
        : null;
  }

 
}
