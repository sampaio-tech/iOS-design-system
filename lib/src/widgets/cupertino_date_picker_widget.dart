import 'package:flutter/cupertino.dart';

import '../../ios_design_system.dart';

// TODO: implement this from scratch (allow edit like CupertinoPickerWidget)
class CupertinoDatePickerWidget extends StatelessWidget {
  const CupertinoDatePickerWidget({
    required this.onDateTimeChanged,
    Key? key,
    this.mode = CupertinoDatePickerMode.dateAndTime,
    this.initialDateTime,
    this.minimumDate,
    this.maximumDate,
    this.minimumYear = 1,
    this.maximumYear,
    this.minuteInterval = 1,
    this.use24hFormat = false,
    this.dateOrder,
    this.showDayOfWeek = false,
    this.showGradient = true,
  }) : super(key: key);
  final CupertinoDatePickerMode mode;
  final void Function(DateTime) onDateTimeChanged;
  final DateTime? initialDateTime;
  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final int minimumYear;
  final int? maximumYear;
  final int minuteInterval;
  final bool use24hFormat;
  final DatePickerDateOrder? dateOrder;
  final bool showDayOfWeek;
  final bool showGradient;

  static Future<int?> show({
    required BuildContext context,
    required void Function(DateTime) onDateTimeChanged,
    BoxConstraints? boxConstraints,
    CupertinoDatePickerMode mode = CupertinoDatePickerMode.dateAndTime,
    DateTime? initialDateTime,
    DateTime? minimumDate,
    DateTime? maximumDate,
    int minimumYear = 1,
    int? maximumYear,
    int minuteInterval = 1,
    bool use24hFormat = false,
    DatePickerDateOrder? dateOrder,
    bool showDayOfWeek = false,
    bool barrierFilter = false,
    bool useRootNavigator = true,
    bool showGradient = true,
  }) =>
      showCupertinoModalPopup<int>(
        filter: switch (barrierFilter) {
          true => kImageFilterBlur,
          false => null,
        },
        barrierColor: switch (barrierFilter) {
          true => const SystemMaterialsBackgroundsColorsDark().thick,
          false => const SystemMaterialsBackgroundsColorsDark().ultraThin,
        },
        context: context,
        useRootNavigator: useRootNavigator,
        builder: (context) => ConstrainedBox(
          constraints: boxConstraints ?? const BoxConstraints.expand(),
          child: CupertinoDatePickerWidget(
            onDateTimeChanged: onDateTimeChanged,
            mode: mode,
            initialDateTime: initialDateTime,
            minimumDate: minimumDate,
            maximumDate: maximumDate,
            minimumYear: minimumYear,
            maximumYear: maximumYear,
            minuteInterval: minuteInterval,
            use24hFormat: use24hFormat,
            dateOrder: dateOrder,
            showDayOfWeek: showDayOfWeek,
            showGradient: showGradient,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    final backgroundColor = switch (theme) {
      IosLightThemeData() =>
        theme.defaultSystemGroupedBackgroundsColors.primaryLight,
      IosDarkThemeData() =>
        theme.defaultSystemBackgroundsColors.primaryDarkElevated,
    };
    return DecoratedBox(
      decoration: BoxDecoration(color: backgroundColor),
      child: SafeArea(
        top: false,
        maintainBottomViewPadding: true,
        minimum: kMinimumSafeAreaPadding,
        child: Stack(
          children: [
            Positioned.fill(
              child: CupertinoDatePicker(
                backgroundColor: backgroundColor,
                onDateTimeChanged: onDateTimeChanged,
                mode: mode,
                initialDateTime: initialDateTime,
                minimumDate: minimumDate,
                maximumDate: maximumDate,
                minimumYear: minimumYear,
                maximumYear: maximumYear,
                minuteInterval: minuteInterval,
                use24hFormat: use24hFormat,
                dateOrder: dateOrder,
                showDayOfWeek: showDayOfWeek,
              ),
            ),
            if (showGradient)
              Positioned.fill(
                child: _GradientWidget(
                  color: backgroundColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _GradientWidget extends StatelessWidget {
  const _GradientWidget({
    required this.color,
    Key? key,
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    color,
                    color.withValues(alpha: .8),
                    color.withValues(alpha: .5),
                    color.withValues(alpha: 0),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    color,
                    color.withValues(alpha: .8),
                    color.withValues(alpha: .5),
                    color.withValues(alpha: 0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
