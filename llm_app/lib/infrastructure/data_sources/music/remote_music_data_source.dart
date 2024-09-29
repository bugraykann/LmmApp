import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:llm_app/core/base/model/base_error.dart';
import 'package:llm_app/core/extensions/extensions.dart';
import 'package:llm_app/core/network/network_manager.dart';
import 'package:llm_app/domain/entitties/music.dart';

class RemoteMusicDataSource {
  RemoteMusicDataSource(this._networkManager, this._settingsBox);

  final NetworkManager _networkManager;
  final Box<dynamic> _settingsBox;

  Future<Either<BaseError, MusicModel>> getPlaylistTracks(String playlistId,
      {String? nextUrl}) async {
    final accessToken = _settingsBox.get('token');
    if (accessToken == null) {
      return left(BaseError(1, 'Token not Found'));
    }

    try {
      final response = await _networkManager.get(
        nextUrl ?? 'https://api.spotify.com/v1/playlists/$playlistId/tracks',
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
      );

      final MusicModel musicModel = MusicModel.fromJson(response.data);
      return right(musicModel);
    } catch (e) {
      return (e as DioException).toEitherBaseError<MusicModel>();
    }
  }
}
