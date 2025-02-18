import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../exports.dart';

class PickerButtonWidget extends StatelessWidget {
  const PickerButtonWidget._({
    required this.label,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  factory PickerButtonWidget.dateTime({
    required DateTime dateTime,
    required DateFormat dateFormat,
    required VoidCallback? onPressed,
    Key? key,
  }) =>
      PickerButtonWidget._(
        label: dateFormat.format(dateTime),
        onPressed: onPressed,
        key: key,
      );
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    return CupertinoButtonWidget(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      color: theme.defaultFillColors.tertiary,
      disabledColor: theme.defaultFillColors.tertiary,
      onPressed: onPressed,
      child: Text(
        label,
        style: theme.typography.bodyRegular.copyWith(
          color: theme.defaultColors.systemBlue,
        ),
        textAlign: TextAlign.center,
        overflow: TextOverflow.visible,
      ),
    );
  }
}
