import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('${options.method} ${options.uri}', name: 'Request');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('${response.statusCode} : ${response.requestOptions.method} ${response.realUri}',
        name: 'Response');
    if (kDebugMode) log(response.data.toString());
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response == null) {
      log(err.toString(), name: 'Error');
    } else {
      log(
        "${err.response?.statusCode ?? '???'} : ${err.requestOptions.method} ${err.response?.realUri}\n ${err.response?.data.toString() ?? err.message}",
        name: 'Error',
      );
    }
    super.onError(err, handler);
  }
}
