import 'package:flutter/cupertino.dart';

import '../../ios_design_system.dart';

class DescriptionWidget extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry? padding;
  const DescriptionWidget({
    super.key,
    required this.text,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = CupertinoTheme.brightnessOf(context);
    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 8),
      child: Text(
        text,
        style: AppTypography.caption1Regular.copyWith(
          color: switch (brightness) {
            Brightness.light => DefaultLabelColors.secondaryLight,
            Brightness.dark => DefaultLabelColors.secondaryDark,
          },
        ),
        textAlign: TextAlign.start,
        overflow: TextOverflow.visible,
      ),
    );
  }
}
