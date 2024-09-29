import 'package:go_router/go_router.dart';
import 'package:llm_app/core/base/model/base_view_model.dart';
import 'package:llm_app/core/config/config.dart';
import 'package:llm_app/domain/repositories/playlist_repository.dart';

import '../../../../domain/entitties/playlist.dart';

class LandingViewModel extends BaseViewModel {
  LandingViewModel(this._playlistRepository);
  final PlaylistRepository _playlistRepository;
  PlaylistModel? playlists;
  @override
  bool isLoading = false;
  String? error;

  int _selectedCardIndex = -1;

  int get selectedCardIndex => _selectedCardIndex;

  void initialize(BuildContext context) {
    if (mounted) return;
    this.context = context;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchPlaylists();
    });
  }

  void selectCard(int index) {
    _selectedCardIndex = index;
    if (index == 0) {
      context.goNamed(Routes.detail, extra: {'type': 'liked_songs'});
    } else {
      context.goNamed(Routes.detail, extra: {
        'type': 'playlist',
        'playlistId': playlists?.playlists?[index].id,
      });
    }
    notifyListeners();
  }

  Future<void> fetchPlaylists() async {
    isLoading = true;
    notifyListeners();

    final result = await _playlistRepository.getPlaylists('');

    result.fold(
      (l) => error = l.message,
      (r) => playlists = r,
    );

    isLoading = false;
    notifyListeners();
  }
}
