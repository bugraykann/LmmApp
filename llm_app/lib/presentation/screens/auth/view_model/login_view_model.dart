import 'package:go_router/go_router.dart';
import 'package:llm_app/core/base/model/base_view_model.dart';
import 'package:llm_app/core/config/config.dart';
import 'package:llm_app/domain/repositories/spotify_sign_repository.dart';
import 'package:llm_app/domain/repositories/spotify_token_repository.dart';

class LoginViewModel extends BaseViewModel {
  LoginViewModel(this._spotifyAuthRepository, this._spotifyTokenRepository);

  final SpotifyAuthRepository _spotifyAuthRepository;
  final SpotifyTokenRepository _spotifyTokenRepository;

  void initialize(BuildContext context) {
    if (mounted) return;
    this.context = context;
  }

  Future<void> login() async {
    final code = await _spotifyTokenRepository.getToken();
    code.fold((l) {
      changeLoading(false);
      var errorMessage = l.data.toString();

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(errorMessage)));
    }, (r) {
      changeLoading(true);
      _spotifyAuthRepository.authenticate(r).then(
            (value) => context.goNamed(Routes.home),
          );
    });
    notifyListeners();
  }
}
