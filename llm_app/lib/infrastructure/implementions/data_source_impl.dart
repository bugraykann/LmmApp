import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:llm_app/core/database/database.dart';
import 'package:llm_app/core/network/network_manager.dart';
import 'package:llm_app/infrastructure/data_sources/auth/local_auth_data_source.dart';
import 'package:llm_app/infrastructure/data_sources/auth/remote_spotify_auth_data_source.dart';
import 'package:llm_app/infrastructure/data_sources/auth/remote_spotify_token_data_source.dart';
import 'package:llm_app/infrastructure/data_sources/playlist/remote_playlist_data_source.dart';

final remoteSpotifyAuthDataSourceImpl =
    Provider((ref) => RemoteSpotifyAuthDataSource(NetworkManager.instance));

final localAuthDataSourceImpl =
    Provider((ref) => LocalAuthDataSource(Database.settingsBox));

final remoteSpotifyTokenDataSourceImpl =
    Provider((ref) => RemoteSpotifyTokenDataSource());

final remoteSpotifyPlayListDataSourceImpl = Provider((ref) =>
    RemoteSpotifyPlayListDataSource(
        NetworkManager.instance, Database.settingsBox));