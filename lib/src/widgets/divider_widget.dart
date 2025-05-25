import 'package:flutter/cupertino.dart';

import '../../ios_design_system.dart';

Color applePlayDividerColorCallback01(IosThemeData theme) => switch (theme) {
  IosLightThemeData() => const Color(0xFFC6C6C8),
  IosDarkThemeData() => const Color(0xFF545458).withValues(alpha: .65),
};

Color stocksDividerColorCallback(IosThemeData theme) => switch (theme) {
  IosLightThemeData() => theme.systemColoursSeparatorColors.nonOpaque,
  IosDarkThemeData() => theme.stocksDecorations.defaultColors.separator,
};

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key, this.height, this.colorCallback});

  static const applePay = const DividerWidget(
    colorCallback: applePlayDividerColorCallback01,
  );

  static const stocks = const DividerWidget(
    colorCallback: stocksDividerColorCallback,
  );

  final double? height;
  final Color? Function(IosThemeData theme)? colorCallback;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    return Container(
      height: height ?? 1,
      color:
          colorCallback?.call(theme) ??
          theme.systemColoursSeparatorColors.nonOpaque,
    );
  }
}
