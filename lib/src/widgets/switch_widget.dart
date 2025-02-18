import 'package:flutter/cupertino.dart';

import '../../ios_design_system.dart';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({
    required this.value,
    super.key,
    this.onChanged,
  });
  final void Function(bool)? onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
      activeTrackColor: theme.defaultColors.systemGreen,
      inactiveTrackColor: theme.defaultFillColors.secondary,
      thumbColor: theme.defaultColors.systemWhite,
    );
  }
}
