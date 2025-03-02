import 'package:flutter/material.dart';

import '../../ios_design_system.dart';

class CloseButtonWidget extends StatelessWidget {
  const CloseButtonWidget({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    const size = Size.square(30);
    return CupertinoButtonWidget(
      onPressed: onPressed,
      child: SizedBox.fromSize(
        size: size,
        child: Stack(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: switch (theme) {
                    IosLightThemeData() => const Color(
                      0xFF747480,
                    ).withValues(alpha: .12),
                    IosDarkThemeData() => const Color(
                      0xFF747480,
                    ).withValues(alpha: .24),
                  },
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Center(
              child: IconWidget.transparentBackground(
                iconData: Icons.close_rounded,
                iconSize: 21,
                iconColorCallback:
                    (theme) => switch (theme) {
                      IosLightThemeData() => const Color(
                        0xFF3C3C43,
                      ).withValues(alpha: .6),
                      IosDarkThemeData() => const Color(
                        0xFFEBEBF5,
                      ).withValues(alpha: .6),
                    },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
