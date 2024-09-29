import 'package:dartz/dartz.dart';
import 'package:llm_app/core/base/model/base_error.dart';
import 'package:llm_app/domain/entitties/music.dart';

abstract class MusicRepository {
  Future<Either<BaseError, MusicModel>> getPlaylistTracks(String playlistId,
      {String? nextUrl});
}
