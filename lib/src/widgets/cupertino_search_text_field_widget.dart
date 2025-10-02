import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ios_design_system.dart';

class CupertinoSearchTextFieldWidget extends StatelessWidget {
  const CupertinoSearchTextFieldWidget({
    super.key,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.placeholder,
    this.borderRadius,
    this.onSuffixTap,
    this.restorationId,
    this.focusNode,
    this.smartQuotesType,
    this.smartDashesType,
    this.suffixMode = OverlayVisibilityMode.editing,
    this.padding = const EdgeInsets.only(top: 7, bottom: 7),
    this.placeholderStyle,
    this.style,
    this.splashColor,
    this.cursorColor,
    this.selectionColor,
    this.selectionHandleColor,
    this.backgroundColor,
  });

  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onTap;
  final String? placeholder;
  final BorderRadius? borderRadius;
  final TextInputType? keyboardType = TextInputType.text;
  final void Function()? onSuffixTap;
  final String? restorationId;
  final FocusNode? focusNode;
  final SmartQuotesType? smartQuotesType;
  final SmartDashesType? smartDashesType;
  final bool enableIMEPersonalizedLearning = true;
  final bool autofocus = false;
  final bool autocorrect = true;
  final OverlayVisibilityMode suffixMode;
  final EdgeInsets padding;
  final TextStyle? placeholderStyle;
  final TextStyle? style;
  final Color? splashColor;
  final Color? cursorColor;
  final Color? Function(IosThemeData theme)? selectionColor;
  final Color? selectionHandleColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final textScaler = MediaQuery.textScalerOf(context);
    final theme = IosTheme.of(context);
    const _borderRadius = BorderRadius.all(Radius.circular(10));
    const prefixInsets = EdgeInsets.only(left: 8, top: 3, bottom: 3, right: 6);
    const suffixInsets = EdgeInsets.only(left: 8, top: 3, bottom: 3, right: 8);

    /// this is always enabled because Flutter don't allow change disabled
    /// color of [CupertinoSearchTextField]
    const enabled = true;
    return CupertinoTheme(
      data: theme.textFieldCupertinoThemeData(
        selectionHandleColor: selectionHandleColor,
      ),
      child: Theme(
        data: theme.textFieldThemeData(
          splashColor: splashColor,
          cursorColor: cursorColor,
          selectionColor: selectionColor,
          selectionHandleColor: selectionHandleColor,
        ),
        child: CupertinoSearchTextField(
          autocorrect: autocorrect,
          autofocus: autofocus,
          enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
          keyboardType: keyboardType,
          onSuffixTap: onSuffixTap,
          suffixMode: suffixMode,
          restorationId: restorationId,
          smartQuotesType: smartQuotesType,
          smartDashesType: smartDashesType,
          focusNode: focusNode,
          enabled: enabled,
          controller: controller,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          onTap: onTap,
          borderRadius: borderRadius ?? _borderRadius,
          padding: padding,
          prefixInsets: prefixInsets,
          itemColor: theme.defaultLabelColors.secondary,
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: theme.defaultLabelColors.secondary,
            size: textScaler.scale(20),
          ),
          suffixInsets: suffixInsets,
          suffixIcon: Icon(
            CupertinoIcons.xmark_circle_fill,
            size: textScaler.scale(18),
            color: theme.defaultColors.systemGray01,
          ),
          placeholder: placeholder,
          style:
              style ??
              theme.typography.bodyRegular.copyWith(
                color: theme.defaultLabelColors.primary,
              ),
          placeholderStyle:
              placeholderStyle ??
              theme.typography.bodyRegular.copyWith(
                color: theme.defaultLabelColors.secondary,
              ),
          backgroundColor: backgroundColor ?? theme.defaultFillColors.tertiary,
        ),
      ),
    );
  }
}
