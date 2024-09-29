import 'package:dartz/dartz.dart';
import 'package:llm_app/core/base/model/base_error.dart';
import 'package:llm_app/domain/entitties/music.dart';
import 'package:llm_app/domain/repositories/liked_music_list_repository.dart';
import 'package:llm_app/infrastructure/data_sources/music/remote_liked_music_list_data_source.dart';

class LikedMusicListRepositoryImpl implements LikedMusicListRepository {
  LikedMusicListRepositoryImpl(this._remoteLikedMusicListDataSource);
  final RemoteLikedMusicListDataSource _remoteLikedMusicListDataSource;

  @override
  Future<Either<BaseError, MusicModel>> getLikedMusicList(
      String nextUrl) async {
    final result =
        await _remoteLikedMusicListDataSource.getLikedMusicList(nextUrl);
    return result;
  }
}
