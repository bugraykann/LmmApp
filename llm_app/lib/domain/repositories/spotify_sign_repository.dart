import 'package:dartz/dartz.dart';
import 'package:llm_app/core/base/model/base_error.dart';
import 'package:llm_app/domain/entitties/spotify_token.dart';

abstract interface class SpotifyAuthRepository {
  Future<Either<BaseError, void>> authenticate(String code);
  Future<Either<BaseError, SpotifyToken>> refreshToken();
  Future<void> logout();
  String? getToken();
}
