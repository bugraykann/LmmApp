import 'package:llm_app/core/extensions/extensions.dart';

Visibility visibilityCardHeader(
    int index, BuildContext context, String headerName) {
  return Visibility(
      visible: index == 0,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          headerName,
          style: context.theme.textTheme.titleMedium?.copyWith(),
        ),
      ));
}
