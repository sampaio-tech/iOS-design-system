import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../../ios_design_system.dart';

class CupertinoNavigatorBarWidget extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  const CupertinoNavigatorBarWidget({
    required this.imageFilter,
    required this.title,
    required this.trailing,
    required this.leading,
    Key? key,
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
    final theme = IosTheme.of(context);
    final canPop = ModalRoute.of(context)?.canPop ?? false;
    final textScaler = MediaQuery.textScalerOf(context);
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
        data: MediaQuery.of(context).copyWith(
          textScaler: textScaler,
        ),
        child: CupertinoNavigationBar(
          padding: const EdgeInsetsDirectional.all(0),
          middle: title != null
              ? DefaultTextStyle(
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: theme.typography.headlineRegular.copyWith(
                    color: theme.defaultLabelColors.primary,
                  ),
                  child: Text(
                    title!,
                    textScaler: textScaler,
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
                      data: MediaQuery.of(context).copyWith(
                        textScaler: textScaler,
                      ),
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
                      data: MediaQuery.of(context).copyWith(
                        textScaler: textScaler,
                      ),
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
                      data: MediaQuery.of(context).copyWith(
                        textScaler: textScaler,
                      ),
                      child: leading?.copyWith(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 11,
                            ),
                          ) ??
                          const SizedBox.shrink(),
                    ),
                  ),
                ],
              ),
          },
          automaticallyImplyMiddle: false,
          automaticallyImplyLeading: false,
          brightness: theme.brightness,
          backgroundColor: switch (theme) {
            IosLightThemeData() =>
              theme.defaultSystemBackgroundsColors.primaryLight,
            IosDarkThemeData() =>
              theme.defaultSystemBackgroundsColors.primaryDarkElevated,
          }
              .withValues(alpha: imageFilter.backgroundOpacity),
          border: Border(
            bottom: BorderSide(
              color: theme.systemColoursSeparatorColors.nonOpaque,
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
