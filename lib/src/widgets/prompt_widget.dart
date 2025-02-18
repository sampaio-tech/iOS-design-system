import 'package:flutter/cupertino.dart';

import '../../ios_design_system.dart';

class PromptWidget extends StatelessWidget {
  const PromptWidget({
    required this.message,
    super.key,
    this.padding,
  });
  final String message;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 9),
      child: Text(
        message,
        style: theme.typography.footnoteRegular.copyWith(
          color: theme.defaultLabelColors.primary,
        ),
        textAlign: TextAlign.center,
        overflow: TextOverflow.visible,
      ),
    );
  }
}
