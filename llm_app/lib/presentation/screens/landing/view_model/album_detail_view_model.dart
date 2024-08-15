import 'package:flutter/material.dart';
import 'package:llm_app/core/base/model/base_view_model.dart';
import 'package:llm_app/core/config/config.dart';
import 'package:llm_app/domain/entitties/playlist.dart';
import 'package:llm_app/domain/repositories/playlist_repository.dart';

class AlbumDetailViewModel extends BaseViewModel {
  AlbumDetailViewModel(this._spotifyPlaylistRepository);

  bool _isLoading = false;
  String? _errorMessage;

  final SpotifyPlaylistRepository _spotifyPlaylistRepository;
  SimplePlaylist _playlist = SimplePlaylist();

  SimplePlaylist get playlist => _playlist;
  @override
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void initialize(BuildContext context) {
    if (mounted) return;
    this.context = context;
    fetchPlaylistTracks('1');
  }

  void fetchPlaylistTracks(String playlistId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final result = await _spotifyPlaylistRepository.getPlaylist(playlistId);

    result.fold(
      (error) {
        _errorMessage = error.message;
      },
      (playlist) {
        _playlist = playlist;
      },
    );

    _isLoading = false;
    notifyListeners();
  }
}
