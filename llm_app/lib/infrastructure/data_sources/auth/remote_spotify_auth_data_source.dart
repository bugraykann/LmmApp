import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:llm_app/core/base/model/base_error.dart';
import 'package:llm_app/core/config/env.dart';
import 'package:llm_app/core/extensions/extensions.dart';
import 'package:llm_app/core/network/network_manager.dart';
import 'package:llm_app/domain/entitties/spotify_token.dart';

class RemoteSpotifyAuthDataSource {
  RemoteSpotifyAuthDataSource(this._networkManager);
  final NetworkManager _networkManager;

  Future<Either<BaseError, ({String token, SpotifyToken spotifyToken})>> auth(
          String code) async =>
      _networkManager.post(
        Env.tokenUrl,
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Authorization':
                'Basic ${base64Encode(utf8.encode('${Env.clientId}:${Env.clientSecret}'))}',
          },
        ),
        data: {
          'grant_type': 'authorization_code',
          'code': code,
          'redirect_uri': Env.redirectUri,
        },
      ).then(
        (res) => right(
          (
            token: res.data['access_token'] as String,
            spotifyToken: SpotifyToken.fromJson(res.data),
          ),
        ),
        onError: (e) => (e as DioException)
            .toEitherBaseError<({String token, SpotifyToken spotifyToken})>(),
      );

  Future<Either<BaseError, SpotifyToken>> refresh(String refreshToken) async {
    return _networkManager.post(
      Env.tokenUrl,
      options: Options(
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization':
              'Basic ${base64Encode(utf8.encode('${Env.clientId}:${Env.clientSecret}'))}',
        },
      ),
      data: {
        'grant_type': 'refresh_token',
        'refresh_token': refreshToken,
      },
    ).then(
      (res) => right(SpotifyToken.fromJson(res.data)),
      onError: (e) => (e as DioException).toEitherBaseError<SpotifyToken>(),
    );
  }
}
