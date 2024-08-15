import 'package:dartz/dartz.dart';
import 'package:llm_app/core/base/model/base_error.dart';

abstract interface class SpotifyTokenRepository {
  Future<Either<BaseError, String>> getToken();
}
