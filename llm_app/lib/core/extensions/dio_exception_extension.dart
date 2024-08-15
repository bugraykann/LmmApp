import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:llm_app/core/base/model/base_error.dart';

extension DioExceptionExtension on DioException {
  Either<BaseError, T> toEitherBaseError<T>() =>
      left<BaseError, T>(BaseError.dioException(this));
}
