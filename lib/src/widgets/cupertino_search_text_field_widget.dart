import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ios_design_system.dart';

class CupertinoSearchTextFieldWidget extends StatelessWidget {
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
  });

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.textScaleFactorOf(context);
    final brightness = CupertinoTheme.brightnessOf(context);
    const kBorderRadius = BorderRadius.all(Radius.circular(10));
    const kPadding = EdgeInsets.only(left: 0, top: 7, bottom: 7, right: 0);
    const kPrefixInsets = EdgeInsets.only(left: 8, top: 3, bottom: 3, right: 6);
    const kSuffixInsets = EdgeInsets.only(left: 8, top: 3, bottom: 3, right: 8);
    const kSuffixMode = OverlayVisibilityMode.editing;

    /// this is always enabled because Flutter don't allow change disabled
    /// color of [CupertinoSearchTextField]
    const kEnabled = true;
    return Theme(
      data: AppThemeData.kTextFieldThemeData(brightness),
      child: CupertinoSearchTextField(
        autocorrect: autocorrect,
        autofocus: autofocus,
        enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
        keyboardType: keyboardType,
        onSuffixTap: onSuffixTap,
        restorationId: restorationId,
        smartQuotesType: smartQuotesType,
        smartDashesType: smartDashesType,
        focusNode: focusNode,
        suffixMode: kSuffixMode,
        enabled: kEnabled,
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        onTap: onTap,
        borderRadius: borderRadius ?? kBorderRadius,
        padding: kPadding,
        prefixInsets: kPrefixInsets,
        itemSize: 20,
        itemColor: switch (brightness) {
          Brightness.light => DefaultLabelColors.secondaryLight,
          Brightness.dark => DefaultLabelColors.secondaryDark,
        },
        prefixIcon: Icon(
          CupertinoIcons.search,
          color: switch (brightness) {
            Brightness.light => DefaultLabelColors.secondaryLight,
            Brightness.dark => DefaultLabelColors.secondaryDark,
          },
          size: 20 * textScaleFactor,
        ),
        suffixInsets: kSuffixInsets,
        suffixIcon: Icon(
          CupertinoIcons.xmark_circle_fill,
          size: 18 * textScaleFactor,
          color: switch (brightness) {
            Brightness.light => DefaultColors.systemGray01Light,
            Brightness.dark => DefaultColors.systemGray01Dark,
          },
        ),
        placeholder: placeholder,
        style: AppTypography.bodyRegular.copyWith(
          color: switch (brightness) {
            Brightness.light => DefaultLabelColors.primaryLight,
            Brightness.dark => DefaultLabelColors.primaryDark,
          },
        ),
        placeholderStyle: AppTypography.bodyRegular.copyWith(
          color: switch (brightness) {
            Brightness.light => DefaultLabelColors.secondaryLight,
            Brightness.dark => DefaultLabelColors.secondaryDark,
          },
        ),
        backgroundColor: switch (brightness) {
          Brightness.light => DefaultFillColors.tertiaryLight,
          Brightness.dark => DefaultFillColors.tertiaryDark,
        },
      ),
    );
  }
}
