import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../ios_design_system.dart';

class TagWidget extends StatelessWidget {
  final String label;
  final bool selected;
  final void Function()? onPressed;
  final TagImageFilter imageFilter;

  const TagWidget({
    super.key,
    required this.label,
    required this.selected,
    required this.onPressed,
    this.imageFilter = TagImageFilter.disabled,
  });

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
  final String label;
  final bool selected;
  final void Function()? onPressed;
  const _TagWidget({
    Key? key,
    required this.label,
    required this.selected,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.textScaleFactorOf(context);
    final brightness = CupertinoTheme.brightnessOf(context);
    final kColorLabel = switch ((brightness, selected)) {
      (Brightness.light, true) => DefaultColors.systemWhiteLight,
      (Brightness.light, false) => DefaultColors.systemBlueLight,
      (Brightness.dark, true) => DefaultColors.systemWhiteDark,
      (Brightness.dark, false) => DefaultColors.systemBlueDark,
    };
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(50)),
      child: BackdropFilter(
        filter: kImageFilterBlur,
        child: AnimatedContainer(
          duration: kAnimationInDuration,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: switch ((brightness, selected)) {
              (Brightness.light, true) => DefaultColors.systemBlueLight,
              (Brightness.light, false) => Colors.transparent,
              (Brightness.dark, true) => DefaultColors.systemBlueDark,
              (Brightness.dark, false) => Colors.transparent,
            },
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            border: Border.all(
              width: 1,
              color: switch ((brightness, selected)) {
                (Brightness.light, true) => DefaultColors.systemBlueLight,
                (Brightness.light, false) =>
                  SystemColoursSeparatorColors.nonOpaqueLight,
                (Brightness.dark, true) => DefaultColors.systemBlueDark,
                (Brightness.dark, false) =>
                  SystemColoursSeparatorColors.nonOpaqueDark,
              },
            ),
          ),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: 0,
            runSpacing: 0,
            children: [
              Text(
                label,
                style: AppTypography.bodyBold.copyWith(
                  color: kColorLabel,
                  height: 1,
                  letterSpacing: 0,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                              color: kColorLabel,
                              size: 14 * textScaleFactor,
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
