//@dart=3.0
import 'package:dartz/dartz.dart';
import 'package:llm_app/core/base/model/base_error.dart';
import 'package:llm_app/domain/entitties/spotify_token.dart';
import 'package:llm_app/domain/repositories/spotify_sign_repository.dart';
import 'package:llm_app/infrastructure/data_sources/auth/local_auth_data_source.dart';
import 'package:llm_app/infrastructure/data_sources/auth/remote_spotify_auth_data_source.dart';

class SpotifyAuthRepositoryImpl implements SpotifyAuthRepository {
  SpotifyAuthRepositoryImpl(
      this._remoteSpotifyAuthDataSource, this._localAuthDataSource);
  final RemoteSpotifyAuthDataSource _remoteSpotifyAuthDataSource;
  final LocalAuthDataSource _localAuthDataSource;
  @override
  Future<Either<BaseError, void>> authenticate(String code) async {
    final result = await _remoteSpotifyAuthDataSource.auth(code);
    final data = result.foldRight<({String token, SpotifyToken spotifyToken})?>(
        null, (r, previous) => r);
    if (data == null) return result;
    await _localAuthDataSource.changeToken(
        data.spotifyToken.accessToken, data.spotifyToken.refreshToken);

    return result;
  }

  @override
  Future<Either<BaseError, SpotifyToken>> refreshToken() async {
    final refreshToken = _localAuthDataSource.getRefreshToken();
    if (refreshToken == null || refreshToken.isEmpty) {
      return left(BaseError(
        0,
      ));
    }

    final result = await _remoteSpotifyAuthDataSource.refresh(refreshToken);
    return result.map((data) {
      _localAuthDataSource.changeToken(data.accessToken, data.refreshToken);
      return data;
    });
  }

  @override
  String? getToken() => _localAuthDataSource.getToken();

  @override
  Future<void> logout() {
    return _localAuthDataSource.deleteToken();
  }
}
