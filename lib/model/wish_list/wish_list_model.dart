import 'package:crafty_bay/model/wish_list/wish_item_data.dart';

class WishListModel {
  String? msg;
  List<WishItemData>? wishItemList;

  WishListModel({this.msg, this.wishItemList});

  WishListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      wishItemList = <WishItemData>[];
      json['data'].forEach((v) {
        wishItemList!.add(WishItemData.fromJson(v));
      });
    }
  }

  
}
