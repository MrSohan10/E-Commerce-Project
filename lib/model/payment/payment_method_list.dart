import 'package:crafty_bay/model/payment/payment_method_wrapper.dart';

class PaymentMethodList {
  String? msg;
  List<PaymentMethodWrapper>? data;

  PaymentMethodList({this.msg, this.data});

  PaymentMethodList.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <PaymentMethodWrapper>[];
      json['data'].forEach((v) {
        data!.add(PaymentMethodWrapper.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}




