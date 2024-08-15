import 'package:dartz/dartz.dart';
import 'package:llm_app/core/base/model/base_error.dart';

abstract interface class SpotifyAuthRepository {
  Future<Either<BaseError, void>> authenticate(String code);
  Future<void> logout();
  String? getToken();
}
