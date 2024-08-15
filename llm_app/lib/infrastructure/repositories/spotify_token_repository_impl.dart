import 'package:dartz/dartz.dart';
import 'package:llm_app/core/base/model/base_error.dart';
import 'package:llm_app/domain/repositories/spotify_token_repository.dart';
import 'package:llm_app/infrastructure/data_sources/auth/remote_spotify_token_data_source.dart';

class SpotifyTokenRepositoryImpl implements SpotifyTokenRepository {
  SpotifyTokenRepositoryImpl(this._remoteSpotifyTokenDataSource);

  final RemoteSpotifyTokenDataSource _remoteSpotifyTokenDataSource;
  @override
  Future<Either<BaseError, String>> getToken() async {
    final result = await _remoteSpotifyTokenDataSource.getToken();
    return result;
  }
}
