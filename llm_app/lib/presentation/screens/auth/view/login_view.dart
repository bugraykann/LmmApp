import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:llm_app/core/constants/constants.dart';
import 'package:llm_app/core/extensions/extensions.dart';
import 'package:llm_app/infrastructure/implementions/repository_impl.dart';
import 'package:llm_app/presentation/screens/auth/view_model/login_view_model.dart';

final _loginViewModel = ChangeNotifierProvider.autoDispose((ref) =>
    LoginViewModel(ref.read(spotifyAuthRepositoryImpl),
        ref.read(spotifyTokenRepositoryImpl)));

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  late LoginViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    viewModel = ref.watch(_loginViewModel.notifier)..initialize(context);

    String text = "Mettalica'nın ardından\nAhmet Kaya mı\nçalıyor ?";
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      text,
                      speed: const Duration(
                        milliseconds: 100,
                      ),
                      textStyle: context.theme.textTheme.headlineSmall,
                      textAlign: TextAlign.left,
                    ),
                  ],
                  displayFullTextOnTap: true,
                  totalRepeatCount: 2,
                ),
              ),
              Flexible(
                child: GestureDetector(
                  onTap: () => viewModel.login(),
                  child: Container(
                    width: context.mediaQuerySize.width * 0.75,
                    height: context.mediaQuerySize.height * 0.06,
                    decoration: BoxDecoration(
                        color: context.theme.primaryColor,
                        borderRadius:
                            BorderRadius.circular(Dimens.radiusButton)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(CustomIcons.asPng('spotify'),
                              width: context.mediaQuerySize.width * 0.075),
                          context.box.emptySizedWidthBoxLow,
                          Flexible(
                            child: Text(
                              'Spotify ile giriş yap !',
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style:
                                  context.theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
