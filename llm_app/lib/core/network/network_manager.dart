import 'package:dio/dio.dart' hide LogInterceptor;
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

import '../config/env.dart';
import 'interceptors/log_interceptor.dart';

class NetworkManager with DioMixin {
  static NetworkManager? _instance;
  static NetworkManager get instance =>
      _instance ?? (_instance = NetworkManager._init());

  NetworkManager._init() {
    options = BaseOptions(baseUrl: Env.baseUrl, headers: Env.baseHeader);

    if (!kIsWeb) {
      httpClientAdapter =
          IOHttpClientAdapter(validateCertificate: (cert, host, port) => true);
    }
    interceptors.add(LogInterceptor());
  }
}
