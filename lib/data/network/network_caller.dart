import 'dart:convert';
import 'dart:developer';

import 'package:crafty_bay/view_model/auth/auth_view_model.dart';
import 'package:http/http.dart';
import '../../model/response/response_data.dart';

class NetworkCaller {
  Future<ResponseData> getRequest(String url, {String? token}) async {
    
    final Response response = await get(Uri.parse(url), headers: {
      "token": (token ?? AuthViewModel.token).toString(),
      'Content-type': 'application/json'
    });
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      final decodeResponse = jsonDecode(response.body);
      if (decodeResponse['status'] == 'success') {
        return ResponseData(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodeResponse,
        );
      } else {
        return ResponseData(
          isSuccess: false,
          statusCode: response.statusCode,
          responseData: decodeResponse,
          errorMessage: decodeResponse['data'] ?? 'Something went wrong!',
        );
      }
    } else if (response.statusCode == 401) {
      AuthViewModel.clearAuthData();
      AuthViewModel.goToLogin();
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: '',
      );
    } else {
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: '',
      );
    }
  }

  Future<ResponseData> postRequest(String url,
      {Map<String, dynamic>? body, String? token}) async {
    log(url);
    log(body.toString());
    final Response response =
        await post(Uri.parse(url), body: jsonEncode(body), headers: {
      "token": (token ?? AuthViewModel.token).toString(),
      'Content-type': 'application/json'
    });
    log(response.statusCode.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      final decodeResponse = jsonDecode(response.body);
      if (decodeResponse['msg'] == 'success') {
        return ResponseData(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodeResponse,
        );
      } else {
        return ResponseData(
            isSuccess: false,
            statusCode: response.statusCode,
            responseData: decodeResponse,
            errorMessage: decodeResponse['data'] ?? 'Something went wrong!');
      }
    } else if (response.statusCode == 401) {
      AuthViewModel.clearAuthData();
      AuthViewModel.goToLogin();
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: '',
      );
    } else {
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: '',
      );
    }
  }
}
