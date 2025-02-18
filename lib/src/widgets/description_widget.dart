import 'package:flutter/cupertino.dart';

import '../../ios_design_system.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    required this.text,
    super.key,
    this.padding,
  });
  final String text;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 8),
      child: Text(
        text,
        style: theme.typography.caption1Regular.copyWith(
          color: theme.defaultLabelColors.secondary,
        ),
        textAlign: TextAlign.start,
        overflow: TextOverflow.visible,
      ),
    );
  }
}
