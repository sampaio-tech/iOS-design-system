import 'package:flutter/cupertino.dart';

import '../../ios_design_system.dart';

Color applePlayBackgroundColorCallback01(IosThemeData theme) => switch (theme) {
  IosLightThemeData() => const Color(0xFFEBEBEB),
  IosDarkThemeData() => const Color(0xFF262526),
};

Color applePlayBackgroundColorCallback02(IosThemeData theme) => switch (theme) {
  IosLightThemeData() => const Color(0xFFFFFFFF),
  IosDarkThemeData() => const Color(0xFF313131),
};

class TitleSheetWidget extends StatelessWidget {
  const TitleSheetWidget({
    required this.title,
    this.colorCallback,
    this.leading,
    this.separator,
    super.key,
    this.padding = const EdgeInsets.only(
      top: 15,
      right: 16,
      left: 16,
      bottom: 8,
    ),
    this.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(10),
      topRight: Radius.circular(10),
    ),
  });

  factory TitleSheetWidget.standard({
    required String title,
    Widget? leading,
    Widget? separator = const DividerWidget(),
  }) => TitleSheetWidget(
    leading: leading,
    separator: separator,
    title: Builder(
      builder: (context) {
        final theme = IosTheme.of(context);
        return Text(
          title,
          overflow: TextOverflow.visible,
          textAlign: TextAlign.start,
          style: theme.typography.title1Bold.copyWith(
            fontSize: 25,
            height: 30 / 25,
            letterSpacing: 0,
            color: theme.defaultLabelColors.primary,
          ),
        );
      },
    ),
  );

  factory TitleSheetWidget.applePay01({
    required String title,
    Widget? leading,
    Widget? separator = DividerWidget.applePay,
  }) => TitleSheetWidget(
    leading: leading,
    separator: separator,
    colorCallback: applePlayBackgroundColorCallback01,
    title: Builder(
      builder: (context) {
        final theme = IosTheme.of(context);
        return Text(
          title,
          overflow: TextOverflow.visible,
          textAlign: TextAlign.start,
          style: theme.typography.title1Bold.copyWith(
            fontSize: 25,
            height: 30 / 25,
            letterSpacing: 0,
            color: theme.defaultLabelColors.primary,
          ),
        );
      },
    ),
  );

  factory TitleSheetWidget.applePay02({
    required String title,
    Widget? leading,
    Widget? separator = DividerWidget.applePay,
  }) => TitleSheetWidget(
    leading: leading,
    separator: separator,
    colorCallback: applePlayBackgroundColorCallback02,
    title: Builder(
      builder: (context) {
        final theme = IosTheme.of(context);
        return Text(
          title,
          overflow: TextOverflow.visible,
          textAlign: TextAlign.start,
          style: theme.typography.title1Bold.copyWith(
            fontSize: 25,
            height: 30 / 25,
            letterSpacing: 0,
            color: theme.defaultLabelColors.primary,
          ),
        );
      },
    ),
  );

  final BorderRadius borderRadius;
  final EdgeInsets padding;
  final Widget title;
  final Color? Function(IosThemeData theme)? colorCallback;
  final Widget? leading;
  final Widget? separator;

  @override
  Widget build(BuildContext context) {
    final canPop =
        (ModalRoute.canPopOf(context) ?? false) &&
        (ModalRoute.isCurrentOf(context) ?? false);
    final theme = IosTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color:
                colorCallback?.call(theme) ??
                switch (theme) {
                  IosLightThemeData() => theme.defaultColors.systemWhite,
                  IosDarkThemeData() =>
                    theme.defaultSystemBackgroundsColors.secondaryDarkBase,
                },
          ),
          padding: padding,
          child: Row(
            children: [
              if (leading != null) leading ?? const SizedBox.shrink(),
              Expanded(child: title),
              const SizedBox(width: 4),
              CloseButtonWidget(
                onPressed: switch (canPop) {
                  true => () => Navigator.pop(context),
                  false => null,
                },
              ),
            ],
          ),
        ),
        separator ?? const SizedBox.shrink(),
      ],
    );
  }
}
