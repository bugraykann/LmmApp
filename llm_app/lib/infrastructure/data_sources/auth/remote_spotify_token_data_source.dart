import 'package:dartz/dartz.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:llm_app/core/base/model/base_error.dart';
import 'package:llm_app/core/config/env.dart';

class RemoteSpotifyTokenDataSource {
  final url =
      '${Env.authorizeUrl}?client_id=${Env.clientId}&response_type=code&redirect_uri=${Env.redirectUri}&scope=${Env.scope}';
  Future<Either<BaseError, String>> getToken() async =>
      FlutterWebAuth.authenticate(
        url: url,
        callbackUrlScheme: 'com.example.llmapp',
      ).then(
        (res) {
          final code = Uri.parse(res).queryParameters['code'];
          if (code != null) return right(code);
          return left(
            BaseError(
              1,
              'Hata',
            ),
          );
        },
      );
}
