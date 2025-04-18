import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../ios_design_system.dart';

class MarkdownModalSheetWidget extends HookWidget {
  const MarkdownModalSheetWidget({
    required this.markdownText,
    required this.title,
    this.textAlign = TextAlign.start,
    this.textScaler,
    this.textDirection,
    this.highlightColor,
    this.h1,
    this.h2,
    this.h3,
    this.h4,
    this.h5,
    this.h6,
    this.hrLineThickness,
    this.hrLineColor,
    this.linkColor,
    this.linkHoverColor,
    this.style,
    this.linkBuilder,
    this.imageBuilder,
    this.sourceTagBuilder,
    this.highlightBuilder,
    this.onLinkTab,
    this.latexWorkaround,
    this.latexBuilder,
    super.key,
  });
  final String Function(BuildContext context) markdownText;
  final String? Function(BuildContext context) title;
  final TextAlign? textAlign;
  final TextScaler? textScaler;
  final TextDirection? textDirection;
  final Color? highlightColor;
  final TextStyle? h1;
  final TextStyle? h2;
  final TextStyle? h3;
  final TextStyle? h4;
  final TextStyle? h5;
  final TextStyle? h6;
  final double? hrLineThickness;
  final Color? hrLineColor;
  final Color? linkColor;
  final Color? linkHoverColor;
  final TextStyle? style;
  final Widget Function(BuildContext, String, String, TextStyle)? linkBuilder;
  final Widget Function(BuildContext, String)? imageBuilder;
  final Widget Function(BuildContext, String, TextStyle)? sourceTagBuilder;
  final Widget Function(BuildContext, String, TextStyle)? highlightBuilder;
  final void Function({
    required String url,
    required String title,
    required BuildContext context,
  })?
  onLinkTab;
  final String Function(String)? latexWorkaround;
  final Widget Function(BuildContext, String, TextStyle, bool)? latexBuilder;

  Future<T?> show<T>({
    required BuildContext context,
    Widget? leading,
    Widget? separator = DividerWidget.applePay,
    bool useNestedNavigation = false,
  }) => CupertinoSheetWidget.showModalSheet<T>(
    context: context,
    title: TitleSheetWidget.applePay02(
      title: title(context),
      separator: separator,
      leading: leading,
    ),
    children: (context) => [this],
    useNestedNavigation: useNestedNavigation,
    colorCallback: applePlayBackgroundColorCallback01,
  );

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final safeArea = CupertinoSheetWidget.safeArea(context);
    return Expanded(
      child: CupertinoScrollbar(
        controller: scrollController,
        child: SingleChildScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 20,
          ).copyWith(bottom: safeArea.bottom + 20),
          child: MarkdownWidget(
            text: markdownText(context),
            textAlign: textAlign,
            h1: h1,
            h2: h2,
            h3: h3,
            h4: h4,
            h5: h5,
            h6: h6,
            hrLineThickness: hrLineThickness,
            hrLineColor: hrLineColor,
            linkColor: linkColor,
            linkHoverColor: linkHoverColor,
            style: style,
            linkBuilder: linkBuilder,
            imageBuilder: imageBuilder,
            sourceTagBuilder: sourceTagBuilder,
            highlightBuilder: highlightBuilder,
            onLinkTab:
                (url, title) =>
                    onLinkTab?.call(url: url, title: title, context: context),
            latexWorkaround: latexWorkaround,
            latexBuilder: latexBuilder,
          ),
        ),
      ),
    );
  }
}
