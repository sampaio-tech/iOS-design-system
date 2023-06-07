import 'package:flutter/cupertino.dart';
import '../../ios_design_system.dart';

class SwitchWidget extends StatelessWidget {
  final void Function(bool)? onChanged;
  final bool value;

  const SwitchWidget({
    super.key,
    this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = CupertinoTheme.brightnessOf(context);
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
      activeColor: switch (brightness) {
        Brightness.light => DefaultColors.systemGreenLight,
        Brightness.dark => DefaultColors.systemGreenDark,
      },
      trackColor: switch (brightness) {
        Brightness.light => DefaultFillColors.secondaryLight,
        Brightness.dark => DefaultFillColors.secondaryDark,
      },
      thumbColor: switch (brightness) {
        Brightness.light => DefaultColors.systemWhiteLight,
        Brightness.dark => DefaultColors.systemWhiteDark,
      },
    );
  }
}
