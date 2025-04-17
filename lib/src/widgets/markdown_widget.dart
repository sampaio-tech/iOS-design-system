import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:gpt_markdown/custom_widgets/selectable_adapter.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:intl/intl.dart' as intl;

import '../../ios_design_system.dart';

class MarkdownWidget extends StatelessWidget {
  const MarkdownWidget({
    required this.text,
    super.key,
    this.textAlign = TextAlign.justify,
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
  });

  final String text;
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
  final void Function(String, String)? onLinkTab;
  final String Function(String)? latexWorkaround;
  final Widget Function(BuildContext, String, TextStyle, bool)? latexBuilder;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    final textScaler = MediaQuery.textScalerOf(context);
    final textDirection = switch (intl.Bidi.isRtlLanguage(
      Localizations.localeOf(context).languageCode,
    )) {
      true => TextDirection.rtl,
      false => TextDirection.ltr,
    };
    return Material(
      color: Colors.transparent,
      child: GptMarkdownTheme(
        gptThemeData: GptMarkdownThemeData(
          brightness: theme.brightness,
          highlightColor: highlightColor,
          h6:
              h6 ??
              theme.typography.bodyBold.copyWith(
                color: theme.defaultLabelColors.primary,
              ),
          h5:
              h5 ??
              theme.typography.headlineBold.copyWith(
                color: theme.defaultLabelColors.primary,
              ),
          h4:
              h4 ??
              theme.typography.title3Bold.copyWith(
                color: theme.defaultLabelColors.primary,
              ),
          h3:
              h3 ??
              theme.typography.title2Bold.copyWith(
                color: theme.defaultLabelColors.primary,
              ),
          h2:
              h2 ??
              theme.typography.title1Bold.copyWith(
                color: theme.defaultLabelColors.primary,
              ),
          h1:
              h1 ??
              theme.typography.largeTitleBold.copyWith(
                color: theme.defaultLabelColors.primary,
              ),
          hrLineThickness: hrLineThickness,
          hrLineColor: hrLineColor,
          linkColor: linkColor ?? theme.acessibleColors.systemBlue,
          linkHoverColor: linkHoverColor ?? theme.acessibleColors.systemBlue,
        ),
        child: GptMarkdown(
          text,
          textAlign: textAlign,
          textScaler: this.textScaler ?? textScaler,
          style:
              style ??
              theme.typography.bodyRegular.copyWith(
                color: theme.defaultLabelColors.primary,
              ),
          textDirection: this.textDirection ?? textDirection,
          onLinkTab: onLinkTab,
          highlightBuilder:
              highlightBuilder ??
              (context, text, style) {
                final theme = IosTheme.of(context);
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: theme.defaultColors.systemBlue.withValues(
                      alpha: switch (theme) {
                        IosDarkThemeData() => 0.25,
                        IosLightThemeData() => 0.1,
                      },
                    ),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: theme.defaultColors.systemBlue.withValues(
                        alpha: 0.5,
                      ),
                    ),
                  ),
                  child: Text(
                    text,
                    style: theme.typography.bodyBold.copyWith(
                      color: theme.defaultLabelColors.primary,
                    ),
                  ),
                );
              },
          latexWorkaround:
              latexWorkaround ??
              (tex) {
                final List<String> stack = [];
                tex = tex.splitMapJoin(
                  RegExp(r'\\text\{|\{|\}|\_'),
                  onMatch: (p) {
                    final String input = p[0] ?? '';
                    if (input == r'\text{') {
                      stack.add(input);
                    }
                    if (stack.isNotEmpty) {
                      if (input == r'{') {
                        stack.add(input);
                      }
                      if (input == r'}') {
                        stack.removeLast();
                      }
                      if (input == r'_') {
                        return r'\_';
                      }
                    }
                    return input;
                  },
                );
                return tex.replaceAllMapped(
                  RegExp(r'align\*'),
                  (match) => 'aligned',
                );
              },
          imageBuilder:
              imageBuilder ??
              (context, url) {
                final uri = Uri.tryParse(url);
                if (uri == null) {
                  return const SizedBox.shrink();
                }
                if (uri.scheme == 'file' || uri.scheme.isEmpty) {
                  return Image.asset(url);
                }
                if (uri.scheme == 'http' || uri.scheme == 'https') {
                  return Image.network(url);
                }
                return const SizedBox.shrink();
              },
          latexBuilder:
              latexBuilder ??
              (context, tex, textStyle, inline) =>
                  LatexWidget(tex: tex, textStyle: textStyle, inline: inline),
          sourceTagBuilder:
              sourceTagBuilder ??
              (buildContext, string, textStyle) {
                var value = int.tryParse(string);
                value ??= -1;
                value += 1;
                return SizedBox(
                  height: 20,
                  width: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text('$value')),
                  ),
                );
              },
          linkBuilder:
              linkBuilder ??
              (context, label, path, style) => Text(
                label,
                style: theme.typography.bodyRegular.copyWith(
                  color: theme.defaultColors.systemBlue,
                ),
              ),
          components: [
            CodeBlockMd(),
            NewLines(),
            BlockQuote(),
            ImageMd(),
            ATagMd(),
            TableMd(),
            HTag(),
            UnOrderedList(),
            OrderedList(),
            RadioButtonMd(),
            CheckBoxMd(),
            HrLine(),
            StrikeMd(),
            BoldMd(),
            ItalicMd(),
            LatexMath(),
            LatexMathMultiLine(),
            HighlightedText(),
            SourceTag(),
            IndentMd(),
          ],
          inlineComponents: [
            ImageMd(),
            ATagMd(),
            TableMd(),
            StrikeMd(),
            BoldMd(),
            ItalicMd(),
            LatexMath(),
            LatexMathMultiLine(),
            HighlightedText(),
            SourceTag(),
          ],
        ),
      ),
    );
  }
}

class LatexWidget extends HookWidget {
  const LatexWidget({
    required this.tex,
    required this.textStyle,
    required this.inline,
    super.key,
  });
  final String tex;
  final TextStyle textStyle;
  final bool inline;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    if (tex.contains(r'\begin{tabular}')) {
      // return table.
      String tableString =
          "|${(RegExp(r"^\\begin\{tabular\}\{.*?\}(.*?)\\end\{tabular\}$", multiLine: true, dotAll: true).firstMatch(tex)?[1] ?? "").trim()}|";
      tableString = tableString
          .replaceAll(r'\', '|\n|')
          .replaceAll(r'\hline', '')
          .replaceAll(RegExp(r'(?<!\\)&'), '|');
      final tableStringList = tableString.split('\n')..insert(1, '|---|');
      tableString = tableStringList.join('\n');
      return GptMarkdown(tableString);
    }
    Widget child = Math.tex(tex, textStyle: textStyle);
    if (!inline) {
      child = Padding(
        padding: const EdgeInsets.all(0),
        child: Material(
          color: Theme.of(context).colorScheme.onInverseSurface,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Scrollbar(
              controller: scrollController,
              child: SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                child: Math.tex(tex, textStyle: textStyle),
              ),
            ),
          ),
        ),
      );
    }
    child = SelectableAdapter(selectedText: tex, child: Math.tex(tex));
    return child;
  }
}
