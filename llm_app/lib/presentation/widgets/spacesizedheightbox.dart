import 'package:llm_app/core/extensions/extensions.dart';

class SpaceSizedHeightBox extends StatelessWidget {
  const SpaceSizedHeightBox({
    required this.height,
    super.key,
  });
  final double height;
  @override
  Widget build(BuildContext context) =>
      SizedBox(height: context.mediaQuerySize.height * height);
}
