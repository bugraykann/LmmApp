import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:llm_app/core/base/model/base_error.dart';
import 'package:llm_app/core/extensions/extensions.dart';
import 'package:llm_app/core/network/network_manager.dart';
import 'package:llm_app/domain/entitties/playlist.dart';

class RemoteSpotifyPlayListDataSource {
  RemoteSpotifyPlayListDataSource(this._networkManager, this._settingsBox);

  final NetworkManager _networkManager;
  final Box<dynamic> _settingsBox;

  Future<Either<BaseError, SimplePlaylist>> getPlaylist(
      String playlistId) async {
    final accessToken = _settingsBox.get('token');
    log(accessToken);
    if (accessToken == null) {
      return left(BaseError(1, 'Token not Found'));
    }
    return _networkManager
        .get(
          'https://api.spotify.com/v1/me/tracks',
          options: Options(
            headers: {
              'Authorization': 'Bearer $accessToken',
            },
          ),
        )
        .then(
          (res) => right(SimplePlaylist.fromJson(res.data)),
          onError: (e) =>
              (e as DioException).toEitherBaseError<SimplePlaylist>(),
        );
  }
}