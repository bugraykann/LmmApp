import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:llm_app/presentation/screens/auth/view_model/splash_view_model.dart';

final _splashViewModel =
    ChangeNotifierProvider.autoDispose((ref) => SplashViewModel(ref));

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  late SplashViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = ref.watch(_splashViewModel.notifier)..initialize(context);
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
