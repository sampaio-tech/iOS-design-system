import 'package:flutter/material.dart';

import '../../ios_design_system.dart';

class GroupedTableWidget extends StatelessWidget {
  const GroupedTableWidget({
    required this.rows,
    required this.title,
    required this.description,
    Key? key,
    this.borderRadius,
  }) : super(key: key);

  factory GroupedTableWidget.rounded({
    required List<Widget> rows,
    required Widget? title,
    required Widget? description,
  }) => GroupedTableWidget(
    rows: rows,
    title: title,
    description: description,
    borderRadius: BorderRadius.circular(14),
  );

  final List<Widget> rows;
  final Widget? title;
  final Widget? description;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null) title ?? const SizedBox.shrink(),
        if (borderRadius == null) const DividerWidget(),
        ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: rows,
          ),
        ),
        if (borderRadius == null) const DividerWidget(),
        if (description != null) description ?? const SizedBox.shrink(),
      ],
    );
  }
}
