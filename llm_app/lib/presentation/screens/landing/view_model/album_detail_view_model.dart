import 'package:flutter/material.dart';
import 'package:llm_app/core/base/model/base_view_model.dart';
import 'package:llm_app/domain/entitties/music.dart';
import 'package:llm_app/domain/repositories/liked_music_list_repository.dart';
import 'package:llm_app/domain/repositories/music_repository.dart';

class AlbumDetailViewModel extends BaseViewModel {
  AlbumDetailViewModel(this._likedMusicListRepository, this._musicRepository) {
    _scrollController.addListener(_onScroll);
  }

  bool _isLoading = false;
  bool _isFetchingMore = false;
  String? _errorMessage;
  String? _nextUrl;

  final LikedMusicListRepository _likedMusicListRepository;
  final MusicRepository _musicRepository;
  final ScrollController _scrollController = ScrollController();

  MusicModel _musicList = MusicModel();
  MusicModel get musicList => _musicList;

  ScrollController get scrollController => _scrollController;

  @override
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isFetchingMore => _isFetchingMore;

  void initialize(BuildContext context, Object? args) {
    if (mounted) return;
    this.context = context;
    final argObj = args as Map;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (argObj['type'] == 'liked_songs') {
        fetchLikedMusics();
      } else if (argObj['playlistId'] != null) {
        fetchMusics(argObj['playlistId']);
      }
    });
  }

  void _onScroll() {
    if (_scrollController.position.atEdge &&
        _scrollController.position.pixels != 0) {
      fetchMoreLikedMusics();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> fetchLikedMusics() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final result =
        await _likedMusicListRepository.getLikedMusicList(_nextUrl ?? '');
    result.fold(
      (error) {
        _errorMessage = error.message;
      },
      (playlist) {
        _musicList = playlist;
        _nextUrl = playlist.nextUrl;
      },
    );

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchMusics(String playlistId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    final result =
        await _musicRepository.getPlaylistTracks(playlistId, nextUrl: _nextUrl);
    result.fold(
      (error) {
        _errorMessage = error.message;
      },
      (musicList) {
        _musicList = musicList;
        _nextUrl = musicList.nextUrl;
      },
    );
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchMoreMusics(String playlistId) async {
    if (_nextUrl == null || _isFetchingMore) return;
    _isFetchingMore = true;
    notifyListeners();
    final result =
        await _musicRepository.getPlaylistTracks(playlistId, nextUrl: _nextUrl);
    result.fold(
      (error) {
        _errorMessage = error.message;
      },
      (musicList) {
        _musicList = musicList;
        _nextUrl = musicList.nextUrl;
      },
    );
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchMoreLikedMusics() async {
    if (_nextUrl == null || _isFetchingMore) return;

    _isFetchingMore = true;
    notifyListeners();

    final result =
        await _likedMusicListRepository.getLikedMusicList(_nextUrl ?? '');
    result.fold(
      (error) {
        _errorMessage = error.message;
      },
      (playlist) {
        _musicList.tracks?.addAll(playlist.tracks ?? []);
        _nextUrl = playlist.nextUrl;
      },
    );

    _isFetchingMore = false;
    notifyListeners();
  }
}
