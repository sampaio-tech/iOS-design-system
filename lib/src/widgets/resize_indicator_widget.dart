import 'package:flutter/cupertino.dart';
import '../../ios_design_system.dart';

class ResizeIndicatorWidget extends StatelessWidget {
  final double width;
  final double height;

  const ResizeIndicatorWidget({
    this.width = 36.0,
    this.height = 5.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = CupertinoTheme.brightnessOf(context);
    const kBorderRadius = BorderRadius.all(Radius.circular(5));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: kAnimationInDuration,
          decoration: BoxDecoration(
            borderRadius: kBorderRadius,
            color: switch (brightness) {
              Brightness.light => DefaultLabelColors.tertiaryLight,
              Brightness.dark => DefaultLabelColors.tertiaryDark,
            },
          ),
          width: width,
          height: height,
        ),
      ],
    );
  }
}
