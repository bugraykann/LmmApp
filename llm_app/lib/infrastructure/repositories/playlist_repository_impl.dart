import 'package:dartz/dartz.dart';
import 'package:llm_app/core/base/model/base_error.dart';
import 'package:llm_app/domain/entitties/playlist.dart';
import 'package:llm_app/domain/repositories/playlist_repository.dart';
import 'package:llm_app/infrastructure/data_sources/playlist/remote_playlist_data_source.dart';

class PlaylistRepositoryImpl implements PlaylistRepository {
  PlaylistRepositoryImpl(this._remotePlaylistDataSource);
  final RemotePlaylistDataSource _remotePlaylistDataSource;

  @override
  Future<Either<BaseError, PlaylistModel>> getPlaylists(String nextUrl) async {
    final result = await _remotePlaylistDataSource.getPlaylists(nextUrl);
    return result;
  }
}
