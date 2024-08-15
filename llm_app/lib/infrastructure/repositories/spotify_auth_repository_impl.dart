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
    await _localAuthDataSource.changeToken(data.spotifyToken.accessToken);

    return result;
  }

  @override
  String? getToken() => _localAuthDataSource.getToken();

  @override
  Future<void> logout() {
    return _localAuthDataSource.deleteToken();
  }
}
