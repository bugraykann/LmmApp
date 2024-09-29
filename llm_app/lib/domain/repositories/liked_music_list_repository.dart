import 'package:dartz/dartz.dart';
import 'package:llm_app/core/base/model/base_error.dart';
import 'package:llm_app/domain/entitties/music.dart';

abstract interface class LikedMusicListRepository {
  Future<Either<BaseError, MusicModel>> getLikedMusicList(String nextUrl);
}
