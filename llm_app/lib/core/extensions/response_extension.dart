import 'dart:core';
import 'dart:io';
import 'package:dio/dio.dart';

extension ResponseExtension on Response? {
  bool get isSuccess => this?.statusCode == HttpStatus.ok;
  bool get isBodySuccess =>
      this?.data is Map ? this?.data['success'] as bool? ?? true : true;
}
