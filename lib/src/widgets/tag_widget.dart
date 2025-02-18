import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ios_design_system.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({
    required this.label,
    required this.selected,
    required this.onPressed,
    super.key,
    this.imageFilter = TagImageFilter.disabled,
  });
  final String label;
  final bool selected;
  final void Function()? onPressed;
  final TagImageFilter imageFilter;

  @override
  Widget build(BuildContext context) {
    return CupertinoButtonWidget(
      onPressed: onPressed,
      child: switch (imageFilter) {
        TagImageFilter.enabled => _TagWidget(
            label: label,
            selected: selected,
            onPressed: onPressed,
          ),
        TagImageFilter.disabled => _TagWidget(
            label: label,
            selected: selected,
            onPressed: onPressed,
          ),
      },
    );
  }
}

class _TagWidget extends StatelessWidget {
  const _TagWidget({
    required this.label,
    required this.selected,
    Key? key,
    this.onPressed,
  }) : super(key: key);
  final String label;
  final bool selected;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final textScaler = MediaQuery.textScalerOf(context);
    final theme = IosTheme.of(context);
    final colorLabel = switch ((theme, selected)) {
      (IosLightThemeData(), true) => theme.defaultColors.systemWhite,
      (IosLightThemeData(), false) => theme.defaultColors.systemBlue,
      (IosDarkThemeData(), true) => theme.defaultColors.systemWhite,
      (IosDarkThemeData(), false) => theme.defaultColors.systemBlue,
    };
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(50)),
      child: BackdropFilter(
        filter: kImageFilterBlur,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: switch ((theme, selected)) {
              (IosLightThemeData(), true) => theme.defaultColors.systemBlue,
              (IosLightThemeData(), false) => Colors.transparent,
              (IosDarkThemeData(), true) => theme.defaultColors.systemBlue,
              (IosDarkThemeData(), false) => Colors.transparent,
            },
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            border: Border.all(
              color: switch ((theme, selected)) {
                (IosLightThemeData(), true) => theme.defaultColors.systemBlue,
                (IosLightThemeData(), false) =>
                  theme.systemColoursSeparatorColors.nonOpaque,
                (IosDarkThemeData(), true) => theme.defaultColors.systemBlue,
                (IosDarkThemeData(), false) =>
                  theme.systemColoursSeparatorColors.nonOpaque,
              },
            ),
          ),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              Text(
                label,
                style: theme.typography.bodyBold.copyWith(
                  color: colorLabel,
                  height: 1,
                  letterSpacing: 0,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedSwitcher(
                    duration: kAnimationInDuration,
                    reverseDuration: kAnimationInDuration,
                    transitionBuilder: (widget, animation) => SizeTransition(
                      sizeFactor: animation,
                      child: widget,
                    ),
                    child: selected
                        ? Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Icon(
                              CupertinoIcons.xmark,
                              color: colorLabel,
                              size: textScaler.scale(14),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum TagImageFilter {
  enabled,
  disabled;

  const TagImageFilter();
}
