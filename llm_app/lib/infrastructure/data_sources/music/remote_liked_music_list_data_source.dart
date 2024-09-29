import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:llm_app/core/base/model/base_error.dart';
import 'package:llm_app/core/extensions/extensions.dart';
import 'package:llm_app/core/network/network_manager.dart';
import 'package:llm_app/domain/entitties/music.dart';

class RemoteLikedMusicListDataSource {
  RemoteLikedMusicListDataSource(
    this._networkManager,
    this._settingsBox,
  );

  final NetworkManager _networkManager;
  final Box<dynamic> _settingsBox;

  Future<Either<BaseError, MusicModel>> getLikedMusicList(
      String? nextUrl) async {
    final accessToken = _settingsBox.get('token');
    log(accessToken);
    if (accessToken == null) {
      return left(BaseError(1, 'Token not Found'));
    }

    try {
      final response = await _networkManager.get(
        nextUrl == '' ? 'https://api.spotify.com/v1/me/tracks' : nextUrl!,
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
      );

      // Parse the response into a SimplePlaylist object
      final MusicModel currentLikedMusicList =
          MusicModel.fromJson(response.data);

      return right(currentLikedMusicList);
    } catch (e) {
      log('Error fetching list: $e');
      return (e as DioException).toEitherBaseError<MusicModel>();
    }
  }
}
