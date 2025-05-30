import 'package:flutter/material.dart';

import '../../ios_design_system.dart';

BoxDecoration defaultDecorationCallback(IosThemeData theme) => BoxDecoration(
  color: switch (theme) {
    IosLightThemeData() => theme.defaultSystemBackgroundsColors.primaryLight,
    IosDarkThemeData() =>
      theme.defaultSystemBackgroundsColors.primaryDarkElevated,
  },
);

BoxDecoration stocksDecorationCallback(IosThemeData theme) => switch (theme) {
  IosLightThemeData() => BoxDecoration(
    color: theme.defaultSystemBackgroundsColors.primaryLight,
  ),
  IosDarkThemeData() => theme.stocksDecorations.gradients.background,
};

class GroupedTableWidget extends StatelessWidget {
  const GroupedTableWidget({
    required this.rows,
    required this.title,
    required this.description,
    this.rowsSpacing = 0,
    this.decorationCallback = defaultDecorationCallback,
    Key? key,
    this.borderRadius,
  }) : super(key: key);

  factory GroupedTableWidget.rounded({
    required List<Widget> rows,
    required Widget? title,
    required Widget? description,
    BoxDecoration Function(IosThemeData theme)? decorationCallback =
        defaultDecorationCallback,
    double rowsSpacing = 0,
  }) => GroupedTableWidget(
    rows: rows,
    title: title,
    description: description,
    borderRadius: BorderRadius.circular(14),
    decorationCallback: decorationCallback,
    rowsSpacing: rowsSpacing,
  );

  factory GroupedTableWidget.stocks({
    required List<Widget> rows,
    required Widget? title,
    required Widget? description,
    BoxDecoration Function(IosThemeData theme)? decorationCallback =
        stocksDecorationCallback,
    double rowsSpacing = 0,
  }) => GroupedTableWidget(
    rows: rows,
    title: title,
    description: description,
    borderRadius: BorderRadius.circular(14),
    decorationCallback: decorationCallback,
    rowsSpacing: rowsSpacing,
  );

  final List<Widget> rows;
  final Widget? title;
  final Widget? description;
  final BorderRadiusGeometry? borderRadius;
  final BoxDecoration Function(IosThemeData theme)? decorationCallback;
  final double rowsSpacing;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null) title ?? const SizedBox.shrink(),
        if (borderRadius == null) const DividerWidget(),
        ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(0),
          child: Container(
            decoration: switch (decorationCallback) {
              null => null,
              final callback => callback(theme),
            },
            child: Column(
              spacing: rowsSpacing,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: rows,
            ),
          ),
        ),
        if (borderRadius == null) const DividerWidget(),
        if (description != null) description ?? const SizedBox.shrink(),
      ],
    );
  }
}
