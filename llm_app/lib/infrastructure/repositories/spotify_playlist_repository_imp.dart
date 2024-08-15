import 'package:dartz/dartz.dart';
import 'package:llm_app/core/base/model/base_error.dart';
import 'package:llm_app/domain/entitties/playlist.dart';
import 'package:llm_app/domain/repositories/playlist_repository.dart';
import 'package:llm_app/infrastructure/data_sources/playlist/remote_playlist_data_source.dart';

class SpotifyPlayListRepositoryImpl implements SpotifyPlaylistRepository {
  SpotifyPlayListRepositoryImpl(this._remoteSpotifyPlayListDataSource);
  final RemoteSpotifyPlayListDataSource _remoteSpotifyPlayListDataSource;

  @override
  Future<Either<BaseError, SimplePlaylist>> getPlaylist(
      String playlistId) async {
    final result =
        await _remoteSpotifyPlayListDataSource.getPlaylist(playlistId);
    return result;
  }
}
