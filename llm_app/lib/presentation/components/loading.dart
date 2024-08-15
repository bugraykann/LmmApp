import 'package:llm_app/core/extensions/extensions.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      color: theme.colorScheme.surface,
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    );
  }
}
