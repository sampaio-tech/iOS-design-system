import 'package:flutter/cupertino.dart';
import '../../ios_design_system.dart';

class PromptWidget extends StatelessWidget {
  final String message;
  final EdgeInsetsGeometry? padding;

  const PromptWidget({
    super.key,
    required this.message,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = CupertinoTheme.brightnessOf(context);
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 9),
      child: Text(
        message,
        style: AppTypography.footnoteRegular.copyWith(
          color: switch (brightness) {
            Brightness.light => DefaultLabelColors.primaryLight,
            Brightness.dark => DefaultLabelColors.primaryDark,
          },
        ),
        textAlign: TextAlign.center,
        overflow: TextOverflow.visible,
      ),
    );
  }
}
