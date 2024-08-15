import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BaseError {
  final int statusCode;
  final String message;
  final dynamic data;

  BaseError(this.statusCode, [String? message, this.data])
      : message = message ?? 'Unknown';

  @override
  String toString() => message;

  BaseError.statusCode(int code)
      : statusCode = code,
        message = 'Unknown',
        data = null;

  BaseError.dioException(DioException exception)
      : statusCode = exception.response?.statusCode ?? HttpStatus.badRequest,
        message = exception.message ?? 'Unknown',
        data = exception.response?.data;

  String toLocalizedString(BuildContext context) =>
      message; //context.localization.somethingWentWrong;
}
