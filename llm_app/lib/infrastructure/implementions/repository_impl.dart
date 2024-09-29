import 'package:llm_app/infrastructure/implementions/data_source_impl.dart';
import 'package:llm_app/infrastructure/repositories/music_repository_impl.dart';
import 'package:llm_app/infrastructure/repositories/playlist_repository_impl.dart';
import 'package:llm_app/infrastructure/repositories/spotify_auth_repository_impl.dart';
import 'package:llm_app/infrastructure/repositories/liked_music_list_repository_imp.dart';
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

final spotifyLikedlistRepositoryImpl = Provider(
  (ref) => LikedMusicListRepositoryImpl(
    ref.read(
      remoteLikedMusicListDataSourceImpl,
    ),
  ),
);
final playlistRepositoryImpl = Provider(
  (ref) => PlaylistRepositoryImpl(
    ref.read(remotePlaylistDataSourceImpl),
  ),
);

final musicRepositoryImpl = Provider(
  (ref) => MusicRepositoryImpl(
    ref.read(remoteMusicDataSourceImpl),
  ),
);
