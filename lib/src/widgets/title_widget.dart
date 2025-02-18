import 'package:flutter/cupertino.dart';

import '../../ios_design_system.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    required this.text,
    required this.size,
    super.key,
    this.padding,
  });
  final String text;
  final TitleSize size;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.start,
              overflow: TextOverflow.visible,
              style: switch ((size, theme)) {
                (TitleSize.small, IosLightThemeData()) =>
                  theme.typography.caption1Regular.copyWith(
                    color: theme.defaultLabelColors.secondary,
                  ),
                (TitleSize.small, IosDarkThemeData()) =>
                  theme.typography.caption1Regular.copyWith(
                    color: theme.defaultLabelColors.secondary,
                  ),
                (TitleSize.large, IosLightThemeData()) =>
                  theme.typography.title3Bold.copyWith(
                    color: theme.defaultLabelColors.primary,
                  ),
                (TitleSize.large, IosDarkThemeData()) =>
                  theme.typography.title3Bold.copyWith(
                    color: theme.defaultLabelColors.primary,
                  ),
              },
            ),
          ),
        ],
      ),
    );
  }
}

enum TitleSize {
  small,
  large,
}
