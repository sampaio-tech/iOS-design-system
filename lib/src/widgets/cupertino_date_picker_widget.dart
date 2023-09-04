import 'package:flutter/cupertino.dart';

import '../../ios_design_system.dart';

// TODO: implement this from scratch (allow edit like CupertinoPickerWidget)
class CupertinoDatePickerWidget extends StatelessWidget {
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

  const CupertinoDatePickerWidget({
    Key? key,
    required this.onDateTimeChanged,
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

  static Future<int?> show({
    required BuildContext context,
    BoxConstraints? boxConstraints,
    CupertinoDatePickerMode mode = CupertinoDatePickerMode.dateAndTime,
    required void Function(DateTime) onDateTimeChanged,
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
          true => SystemMaterialsBackgroundsColors.thickDark,
          false => SystemMaterialsBackgroundsColors.ultraThinDark,
        },
        context: context,
        useRootNavigator: useRootNavigator,
        builder: (BuildContext context) => ConstrainedBox(
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
    final brightness = CupertinoTheme.brightnessOf(context);
    final kBackgroundColor = switch (brightness) {
      Brightness.light => DefaultSystemGroupedBackgroundsColors.primaryLight,
      Brightness.dark => DefaultSystemBackgroundsColors.primaryDarkElevated,
    };
    return DecoratedBox(
      decoration: BoxDecoration(color: kBackgroundColor),
      child: SafeArea(
        top: false,
        maintainBottomViewPadding: true,
        minimum: kMinimumSafeAreaPadding,
        child: Stack(
          children: [
            Positioned.fill(
              child: CupertinoDatePicker(
                backgroundColor: kBackgroundColor,
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
                child: _GradientWidget(color: kBackgroundColor),
              ),
          ],
        ),
      ),
    );
  }
}

class _GradientWidget extends StatelessWidget {
  final Color color;
  const _GradientWidget({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    color,
                    color.withOpacity(.8),
                    color.withOpacity(.5),
                    color.withOpacity(0),
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
                    color.withOpacity(.8),
                    color.withOpacity(.5),
                    color.withOpacity(0),
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
