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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (wishItemList != null) {
      data['data'] = wishItemList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
