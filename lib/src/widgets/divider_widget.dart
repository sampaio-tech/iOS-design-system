import 'package:flutter/cupertino.dart';

import '../../ios_design_system.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = CupertinoTheme.brightnessOf(context);
    return AnimatedContainer(
      duration: kAnimationInDuration,
      height: 1,
      color: switch (brightness) {
        Brightness.light => SystemColoursSeparatorColors.nonOpaqueLight,
        Brightness.dark => SystemColoursSeparatorColors.nonOpaqueDark,
      },
    );
  }
}
