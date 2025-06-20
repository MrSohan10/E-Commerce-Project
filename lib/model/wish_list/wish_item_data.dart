import 'package:crafty_bay/model/product/product_model.dart';

class WishItemData {
  int? id;
  int? productId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  ProductModel? product;

  WishItemData(
      {this.id,
      this.productId,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.product});

  WishItemData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
        json['product'] != null ? ProductModel.fromJson(json['product']) : null;
  }

  
}
