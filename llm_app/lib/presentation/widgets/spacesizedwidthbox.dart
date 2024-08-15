import 'package:llm_app/core/extensions/extensions.dart';

class SpaceSizedWidthBox extends StatelessWidget {
  const SpaceSizedWidthBox({
    required this.width,
    super.key,
  });
  final double width;
  @override
  Widget build(BuildContext context) =>
      SizedBox(width: context.mediaQuerySize.width * width);
}
