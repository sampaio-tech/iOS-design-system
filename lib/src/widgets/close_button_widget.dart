import 'package:flutter/material.dart';

import '../../ios_design_system.dart';
import '../assets_gen/assets.gen.dart';

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
              child: Assets.lib.src.assets.svg.closeRounded.svg(
                height: 16,
                width: 16,
                colorFilter: ColorFilter.mode(switch (theme) {
                  IosLightThemeData() => const Color(
                    0xFF3C3C43,
                  ).withValues(alpha: .6),
                  IosDarkThemeData() => const Color(
                    0xFFEBEBF5,
                  ).withValues(alpha: .6),
                }, BlendMode.srcIn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
