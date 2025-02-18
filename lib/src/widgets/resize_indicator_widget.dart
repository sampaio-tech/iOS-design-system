import 'package:flutter/cupertino.dart';

import '../../ios_design_system.dart';

class ResizeIndicatorWidget extends StatelessWidget {
  const ResizeIndicatorWidget({
    this.width = 36.0,
    this.height = 5.0,
    super.key,
  });
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    const borderRadius = BorderRadius.all(
      Radius.circular(5),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: kAnimationInDuration,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: theme.defaultLabelColors.tertiary,
          ),
          width: width,
          height: height,
        ),
      ],
    );
  }
}
