import 'package:llm_app/infrastructure/implementions/data_source_impl.dart';
import 'package:llm_app/infrastructure/repositories/spotify_auth_repository_impl.dart';
import 'package:llm_app/infrastructure/repositories/spotify_playlist_repository_imp.dart';
import 'package:llm_app/infrastructure/repositories/spotify_token_repository_impl.dart';
import 'package:riverpod/riverpod.dart';

final spotifyAuthRepositoryImpl = Provider(
  (ref) => SpotifyAuthRepositoryImpl(
    ref.read(remoteSpotifyAuthDataSourceImpl),
    ref.read(localAuthDataSourceImpl),
  ),
);

final spotifyTokenRepositoryImpl = Provider(
  (ref) => SpotifyTokenRepositoryImpl(
    ref.read(remoteSpotifyTokenDataSourceImpl),
  ),
);

final spotifyPlaylistRepositoryImpl = Provider(
  (ref) => SpotifyPlayListRepositoryImpl(
    ref.read(
      remoteSpotifyPlayListDataSourceImpl,
    ),
  ),
);
