import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../../ios_design_system.dart';

class CupertinoNavigatorBarWidget extends StatelessWidget
    implements ObstructingPreferredSizeWidget {

  const CupertinoNavigatorBarWidget({
    required this.imageFilter, required this.title, required this.trailing, required this.leading, Key? key,
    this.backButtonWidget = _kCupertinoNavigationBackButtonWidget,
  }) : super(key: key);
  final NavigatorBarImageFilter imageFilter;
  final String? title;
  final LabelButtonWidget? trailing;
  final LabelButtonWidget? leading;
  final CupertinoNavigationBackButtonWidget backButtonWidget;

  @override
  Widget build(BuildContext context) {
    final ScrollController? primaryScrollController =
        PrimaryScrollController.maybeOf(context);
    final brightness = CupertinoTheme.brightnessOf(context);
    final canPop = ModalRoute.of(context)?.canPop ?? false;
    final textScaleFactor = MediaQuery.textScaleFactorOf(context);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        final hasClients = primaryScrollController?.hasClients ?? false;
        if (hasClients) {
          primaryScrollController?.animateTo(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.linearToEaseOut,
          );
        }
      },
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(textScaleFactor)),
        child: CupertinoNavigationBar(
          padding: const EdgeInsetsDirectional.all(0),
          middle: title != null
              ? DefaultTextStyle(
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.headlineRegular.copyWith(
                    color: switch (brightness) {
                      Brightness.light => DefaultLabelColors.primaryLight,
                      Brightness.dark => DefaultLabelColors.primaryDark,
                    },
                  ),
                  child: Text(
                    title!,
                    textScaleFactor: textScaleFactor,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                )
              : null,
          trailing: switch (trailing) {
            null => null,
            final trailing => Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(textScaler: TextScaler.linear(textScaleFactor)),
                      child: trailing.copyWith(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 11,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          },
          leading: switch ((leading, backButtonWidget, canPop)) {
            (null, _, true) => Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(textScaler: TextScaler.linear(textScaleFactor)),
                      child: backButtonWidget,
                    ),
                  ),
                ],
              ),
            (null, _, _) => null,
            (final leading, _, _) => Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(textScaler: TextScaler.linear(textScaleFactor)),
                      child: leading!.copyWith(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 11,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          },
          automaticallyImplyMiddle: false,
          automaticallyImplyLeading: false,
          brightness: brightness,
          backgroundColor: imageFilter.backgroundColor(brightness: brightness),
          border: Border(
            bottom: BorderSide(
              color: switch (brightness) {
                Brightness.light => SystemColoursSeparatorColors.nonOpaqueLight,
                Brightness.dark => SystemColoursSeparatorColors.nonOpaqueDark,
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool shouldFullyObstruct(BuildContext context) => switch (imageFilter) {
        NavigatorBarImageFilter.enabled => true,
        NavigatorBarImageFilter.disabled => false,
      };

  @override
  Size get preferredSize => const Size.fromHeight(_kNavBarPersistentHeight);
}

const double _kNavBarPersistentHeight = kMinInteractiveDimensionCupertino;

enum NavigatorBarImageFilter {
  enabled,
  disabled;

  const NavigatorBarImageFilter();

  ImageFilter? get imageFilter => switch (this) {
        NavigatorBarImageFilter.enabled => kImageFilterBlur,
        NavigatorBarImageFilter.disabled => null,
      };

  double get backgroundOpacity => switch (this) {
        NavigatorBarImageFilter.enabled => .8,
        NavigatorBarImageFilter.disabled => 1,
      };

  Color backgroundColor({
    required Brightness brightness,
  }) =>
      switch (brightness) {
        Brightness.light => DefaultSystemBackgroundsColors.primaryLight,
        Brightness.dark => DefaultSystemBackgroundsColors.primaryDarkElevated,
      }
          withValues(alpha = backgroundOpacity);
}

const _kCupertinoNavigationBackButtonWidget =
    CupertinoNavigationBackButtonWidget();

class CupertinoNavigationBackButtonWidget extends StatelessWidget {
  const CupertinoNavigationBackButtonWidget({
    super.key,
    this.label,
  });
  final String? label;

  @override
  Widget build(BuildContext context) {
    final canPop = ModalRoute.of(context)?.canPop ?? false;
    return LabelButtonWidget.label(
      label: label ?? 'Back',
      iconLeft: CupertinoIcons.back,
      onPressed: canPop ? Navigator.of(context).pop : null,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 11,
      ),
    );
  }
}
