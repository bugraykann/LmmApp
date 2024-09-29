import 'package:dartz/dartz.dart';
import 'package:llm_app/core/base/model/base_error.dart';
import 'package:llm_app/domain/entitties/music.dart';
import 'package:llm_app/domain/repositories/music_repository.dart';
import 'package:llm_app/infrastructure/data_sources/music/remote_music_data_source.dart';

class MusicRepositoryImpl implements MusicRepository {
  MusicRepositoryImpl(this._remoteMusicDataSource);

  final RemoteMusicDataSource _remoteMusicDataSource;

  @override
  Future<Either<BaseError, MusicModel>> getPlaylistTracks(String playlistId,
      {String? nextUrl}) {
    return _remoteMusicDataSource.getPlaylistTracks(playlistId,
        nextUrl: nextUrl);
  }
}
