import 'package:flutter/cupertino.dart';

import '../../ios_design_system.dart';

Color stocksDecorationCallback(IosThemeData theme) =>
    theme.stocksDecorations.defaultColors.positiveTrend;

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({
    required this.value,
    super.key,
    this.onChanged,
    this.activeTrackColorCallback,
    this.inactiveTrackColorCallback,
    this.thumbColorCallback,
  });

  factory SwitchWidget.stocks({
    required bool value,
    void Function(bool)? onChanged,
    Color Function(IosThemeData)? activeTrackColorCallback =
        stocksDecorationCallback,
    Color Function(IosThemeData)? inactiveTrackColorCallback,
    Color Function(IosThemeData)? thumbColorCallback,
  }) => SwitchWidget(
    value: value,
    onChanged: onChanged,
    activeTrackColorCallback: activeTrackColorCallback,
    inactiveTrackColorCallback: inactiveTrackColorCallback,
    thumbColorCallback: thumbColorCallback,
  );

  final void Function(bool)? onChanged;
  final bool value;
  final Color Function(IosThemeData theme)? activeTrackColorCallback;
  final Color Function(IosThemeData theme)? inactiveTrackColorCallback;
  final Color Function(IosThemeData theme)? thumbColorCallback;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
      activeTrackColor:
          activeTrackColorCallback?.call(theme) ??
          theme.defaultColors.systemGreen,
      inactiveTrackColor:
          inactiveTrackColorCallback?.call(theme) ??
          theme.defaultFillColors.secondary,
      thumbColor:
          thumbColorCallback?.call(theme) ?? theme.defaultColors.systemWhite,
    );
  }
}
