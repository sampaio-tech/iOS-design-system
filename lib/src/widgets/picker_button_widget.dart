import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../exports.dart';

class PickerButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const PickerButtonWidget._({
    Key? key,
    required this.label,
    required this.onPressed,
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

  @override
  Widget build(BuildContext context) {
    final brightness = CupertinoTheme.brightnessOf(context);
    return CupertinoButtonWidget(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      color: switch (brightness) {
        Brightness.light => DefaultFillColors.tertiaryLight,
        Brightness.dark => DefaultFillColors.tertiaryDark,
      },
      disabledColor: switch (brightness) {
        Brightness.light => DefaultFillColors.tertiaryLight,
        Brightness.dark => DefaultFillColors.tertiaryDark,
      },
      onPressed: onPressed,
      child: Text(
        label,
        style: AppTypography.bodyRegular.copyWith(
          color: switch (brightness) {
            Brightness.light => DefaultColors.systemBlueLight,
            Brightness.dark => DefaultColors.systemBlueDark,
          },
        ),
        textAlign: TextAlign.center,
        overflow: TextOverflow.visible,
      ),
    );
  }
}
