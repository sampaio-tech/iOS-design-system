import 'package:flutter/cupertino.dart';

import '../../ios_design_system.dart';

class TitleWidget extends StatelessWidget {
  final String text;
  final TitleSize size;
  final EdgeInsetsGeometry? padding;
  const TitleWidget({
    super.key,
    required this.text,
    required this.size,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = CupertinoTheme.brightnessOf(context);
    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.start,
              overflow: TextOverflow.visible,
              style: switch ((size, brightness)) {
                (TitleSize.small, Brightness.light) => AppTypography
                    .caption1Regular
                    .copyWith(color: DefaultLabelColors.secondaryLight),
                (TitleSize.small, Brightness.dark) => AppTypography
                    .caption1Regular
                    .copyWith(color: DefaultLabelColors.secondaryDark),
                (TitleSize.large, Brightness.light) => AppTypography.title3Bold
                    .copyWith(color: DefaultLabelColors.primaryLight),
                (TitleSize.large, Brightness.dark) => AppTypography.title3Bold
                    .copyWith(color: DefaultLabelColors.primaryDark),
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
