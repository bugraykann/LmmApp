import 'package:dartz/dartz.dart';
import 'package:llm_app/core/base/model/base_error.dart';
import 'package:llm_app/domain/entitties/playlist.dart';

abstract interface class PlaylistRepository {
  Future<Either<BaseError, PlaylistModel>> getPlaylists(String nextUrl);
}
