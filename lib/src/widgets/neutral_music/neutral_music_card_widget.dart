import 'package:flutter/material.dart';

import '../../../ios_design_system.dart';

class NeutralMusicCardWidget extends StatelessWidget {
  const NeutralMusicCardWidget({
    required this.primaryChildren,
    required this.secondaryChildren,
    required this.onPressed,
    required this.onLongPress,
    this.primaryChildrenDecoration,
    this.secondaryChildrenDecoration,
    super.key,
  });

  final List<Widget> primaryChildren;
  final List<Widget> secondaryChildren;
  final BoxDecoration? primaryChildrenDecoration;
  final BoxDecoration? secondaryChildrenDecoration;
  final void Function()? onPressed;
  final void Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(22)),
      child: CupertinoButtonWidget(
        pressedOpacity: 1,
        onPressed: onPressed,
        onLongPress: onLongPress,
        child: Container(
          padding: const EdgeInsets.only(top: 16),
          decoration:
              primaryChildrenDecoration ??
              theme
                  .neutralMusicDecorations
                  .gradients
                  .primaryBackgroundLargeWidget,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              ...primaryChildren,
              const SizedBox(height: 12),
              if (secondaryChildren.isNotEmpty)
                Container(
                  padding: const EdgeInsets.only(top: 15, bottom: 17),
                  decoration:
                      secondaryChildrenDecoration ??
                      theme
                          .neutralMusicDecorations
                          .gradients
                          .secondaryBackgroundLargeWidget,
                  child: Column(children: secondaryChildren),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
