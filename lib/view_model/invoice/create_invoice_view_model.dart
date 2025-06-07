import 'dart:developer';

import 'package:crafty_bay/model/payment/payment_method_list.dart';
import 'package:crafty_bay/view_model/auth/auth_view_model.dart';
import 'package:get/get.dart';

import '../../data/network/network_caller.dart';
import '../../data/api/api_urls.dart';

class CreateInvoiceViewModel extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  PaymentMethodList _paymentMethodList = PaymentMethodList();

  PaymentMethodList get paymentMethodList => _paymentMethodList;

  Future<bool> createInvoice() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.invoiceCreate);
    log(AuthViewModel.token.toString());
    _inProgress = false;
    if (response.isSuccess) {
      _paymentMethodList = PaymentMethodList.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }

}
