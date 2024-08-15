import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:llm_app/core/base/model/base_view_model.dart';
import 'package:llm_app/core/config/config.dart';
import 'package:llm_app/domain/repositories/spotify_sign_repository.dart';
import 'package:llm_app/infrastructure/implementions/repository_impl.dart';

class SplashViewModel extends BaseViewModel {
  SplashViewModel(Ref ref)
      : _spotifyAuthRepository = ref.read(spotifyAuthRepositoryImpl);

  final SpotifyAuthRepository _spotifyAuthRepository;

  void initialize(BuildContext context) {
    if (mounted) return;
    this.context = context;
  }

  Future<void> getData() async {
    final token = _spotifyAuthRepository.getToken();
    if (token == null) return context.goNamed(Routes.login);
    context.goNamed(Routes.home);
  }
}
