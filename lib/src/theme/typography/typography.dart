import 'package:flutter/material.dart';

final class IosTypography {
  const IosTypography({
    TextStyle? caption2Regular,
    TextStyle? caption2Bold,
    TextStyle? caption1Regular,
    TextStyle? caption1Bold,
    TextStyle? footnoteRegular,
    TextStyle? footnoteBold,
    TextStyle? subheadlineRegular,
    TextStyle? subheadlineBold,
    TextStyle? calloutRegular,
    TextStyle? calloutBold,
    TextStyle? bodyRegular,
    TextStyle? bodyBold,
    TextStyle? headlineRegular,
    TextStyle? headlineBold,
    TextStyle? title3Regular,
    TextStyle? title3Bold,
    TextStyle? title2Regular,
    TextStyle? title2Bold,
    TextStyle? title1Regular,
    TextStyle? title1Bold,
    TextStyle? largeTitleRegular,
    TextStyle? largeTitleBold,
  })  : caption2Regular = caption2Regular ?? _defaultCaption2Regular,
        caption2Bold = caption2Bold ?? _defaultCaption2Bold,
        caption1Regular = caption1Regular ?? _defaultCaption1Regular,
        caption1Bold = caption1Bold ?? _defaultCaption1Bold,
        footnoteRegular = footnoteRegular ?? _defaultFootnoteRegular,
        footnoteBold = footnoteBold ?? _defaultFootnoteBold,
        subheadlineRegular = subheadlineRegular ?? _defaultSubheadlineRegular,
        subheadlineBold = subheadlineBold ?? _defaultSubheadlineBold,
        calloutRegular = calloutRegular ?? _defaultCalloutRegular,
        calloutBold = calloutBold ?? _defaultCalloutBold,
        bodyRegular = bodyRegular ?? _defaultBodyRegular,
        bodyBold = bodyBold ?? _defaultBodyBold,
        headlineRegular = headlineRegular ?? _defaultHeadlineRegular,
        headlineBold = headlineBold ?? _defaultHeadlineBold,
        title3Regular = title3Regular ?? _defaultTitle3Regular,
        title3Bold = title3Bold ?? _defaultTitle3Bold,
        title2Regular = title2Regular ?? _defaultTitle2Regular,
        title2Bold = title2Bold ?? _defaultTitle2Bold,
        title1Regular = title1Regular ?? _defaultTitle1Regular,
        title1Bold = title1Bold ?? _defaultTitle1Bold,
        largeTitleRegular = largeTitleRegular ?? _defaultLargeTitleRegular,
        largeTitleBold = largeTitleBold ?? _defaultLargeTitleBold;

  static const _defaultCaption2Regular = TextStyle(
    fontFamily: 'SF',
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: 13 / 11,
    letterSpacing: .07,
  );

  static const _defaultCaption2Bold = TextStyle(
    fontFamily: 'SF',
    fontSize: 11,
    fontWeight: FontWeight.w600,
    height: 13 / 11,
    letterSpacing: .06,
  );

  static const _defaultCaption1Regular = TextStyle(
    fontFamily: 'SF',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 16 / 12,
  );

  static const _defaultCaption1Bold = TextStyle(
    fontFamily: 'SF',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 16 / 12,
  );

  static const _defaultFootnoteRegular = TextStyle(
    fontFamily: 'SF',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 18 / 13,
    letterSpacing: -.08,
  );

  static const _defaultFootnoteBold = TextStyle(
    fontFamily: 'SF',
    fontSize: 13,
    fontWeight: FontWeight.w600,
    height: 18 / 13,
    letterSpacing: -.08,
  );

  static const _defaultSubheadlineRegular = TextStyle(
    fontFamily: 'SF',
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 20 / 15,
    letterSpacing: -.24,
  );

  static const _defaultSubheadlineBold = TextStyle(
    fontFamily: 'SF',
    fontSize: 15,
    fontWeight: FontWeight.w600,
    height: 18 / 15,
    letterSpacing: -.5,
  );

  static const _defaultCalloutRegular = TextStyle(
    fontFamily: 'SF',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 21 / 16,
    letterSpacing: -.32,
  );

  static const _defaultCalloutBold = TextStyle(
    fontFamily: 'SF',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 21 / 16,
    letterSpacing: -.32,
  );

  static const _defaultBodyRegular = TextStyle(
    fontFamily: 'SF',
    fontSize: 17,
    fontWeight: FontWeight.w400,
    height: 22 / 17,
    letterSpacing: -.41,
  );

  static const _defaultBodyBold = TextStyle(
    fontFamily: 'SF',
    fontSize: 17,
    fontWeight: FontWeight.w600,
    height: 22 / 17,
    letterSpacing: -.41,
  );

  static const _defaultHeadlineRegular = TextStyle(
    fontFamily: 'SF',
    fontSize: 17,
    fontWeight: FontWeight.w600,
    height: 22 / 17,
    letterSpacing: -.41,
  );

  static const _defaultHeadlineBold = TextStyle(
    fontFamily: 'SF',
    fontSize: 17,
    fontWeight: FontWeight.w600,
    height: 22 / 17,
    letterSpacing: -.41,
  );

  static const _defaultTitle3Regular = TextStyle(
    fontFamily: 'SF',
    fontSize: 20,
    fontWeight: FontWeight.w400,
    height: 25 / 20,
    letterSpacing: .38,
  );

  static const _defaultTitle3Bold = TextStyle(
    fontFamily: 'SF',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 25 / 20,
    letterSpacing: .38,
  );

  static const _defaultTitle2Regular = TextStyle(
    fontFamily: 'SF',
    fontSize: 22,
    fontWeight: FontWeight.w400,
    height: 28 / 22,
    letterSpacing: .35,
  );

  static const _defaultTitle2Bold = TextStyle(
    fontFamily: 'SF',
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 28 / 22,
    letterSpacing: .35,
  );

  static const _defaultTitle1Regular = TextStyle(
    fontFamily: 'SF',
    fontSize: 28,
    fontWeight: FontWeight.w400,
    height: 34 / 28,
    letterSpacing: .36,
  );

  static const _defaultTitle1Bold = TextStyle(
    fontFamily: 'SF',
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 34 / 28,
    letterSpacing: .36,
  );

  static const _defaultLargeTitleRegular = TextStyle(
    fontFamily: 'SF',
    fontSize: 34,
    fontWeight: FontWeight.w400,
    height: 41 / 34,
    letterSpacing: .37,
  );

  static const _defaultLargeTitleBold = TextStyle(
    fontFamily: 'SF',
    fontSize: 34,
    fontWeight: FontWeight.w700,
    height: 41 / 34,
    letterSpacing: .37,
  );

  final TextStyle caption2Regular;
  final TextStyle caption2Bold;
  final TextStyle caption1Regular;
  final TextStyle caption1Bold;
  final TextStyle footnoteRegular;
  final TextStyle footnoteBold;
  final TextStyle subheadlineRegular;
  final TextStyle subheadlineBold;
  final TextStyle calloutRegular;
  final TextStyle calloutBold;
  final TextStyle bodyRegular;
  final TextStyle bodyBold;
  final TextStyle headlineRegular;
  final TextStyle headlineBold;
  final TextStyle title3Regular;
  final TextStyle title3Bold;
  final TextStyle title2Regular;
  final TextStyle title2Bold;
  final TextStyle title1Regular;
  final TextStyle title1Bold;
  final TextStyle largeTitleRegular;
  final TextStyle largeTitleBold;

  IosTypography copyWith({
    TextStyle? caption2Regular,
    TextStyle? caption2Bold,
    TextStyle? caption1Regular,
    TextStyle? caption1Bold,
    TextStyle? footnoteRegular,
    TextStyle? footnoteBold,
    TextStyle? subheadlineRegular,
    TextStyle? subheadlineBold,
    TextStyle? calloutRegular,
    TextStyle? calloutBold,
    TextStyle? bodyRegular,
    TextStyle? bodyBold,
    TextStyle? headlineRegular,
    TextStyle? headlineBold,
    TextStyle? title3Regular,
    TextStyle? title3Bold,
    TextStyle? title2Regular,
    TextStyle? title2Bold,
    TextStyle? title1Regular,
    TextStyle? title1Bold,
    TextStyle? largeTitleRegular,
    TextStyle? largeTitleBold,
  }) =>
      IosTypography(
        caption2Regular: caption2Regular ?? this.caption2Regular,
        caption2Bold: caption2Bold ?? this.caption2Bold,
        caption1Regular: caption1Regular ?? this.caption1Regular,
        caption1Bold: caption1Bold ?? this.caption1Bold,
        footnoteRegular: footnoteRegular ?? this.footnoteRegular,
        footnoteBold: footnoteBold ?? this.footnoteBold,
        subheadlineRegular: subheadlineRegular ?? this.subheadlineRegular,
        subheadlineBold: subheadlineBold ?? this.subheadlineBold,
        calloutRegular: calloutRegular ?? this.calloutRegular,
        calloutBold: calloutBold ?? this.calloutBold,
        bodyRegular: bodyRegular ?? this.bodyRegular,
        bodyBold: bodyBold ?? this.bodyBold,
        headlineRegular: headlineRegular ?? this.headlineRegular,
        headlineBold: headlineBold ?? this.headlineBold,
        title3Regular: title3Regular ?? this.title3Regular,
        title3Bold: title3Bold ?? this.title3Bold,
        title2Regular: title2Regular ?? this.title2Regular,
        title2Bold: title2Bold ?? this.title2Bold,
        title1Regular: title1Regular ?? this.title1Regular,
        title1Bold: title1Bold ?? this.title1Bold,
        largeTitleRegular: largeTitleRegular ?? this.largeTitleRegular,
        largeTitleBold: largeTitleBold ?? this.largeTitleBold,
      );

  IosTypography lerp(IosTypography b, double t) => IosTypography(
        caption2Regular: TextStyle.lerp(caption2Regular, b.caption2Regular, t),
        caption2Bold: TextStyle.lerp(caption2Bold, b.caption2Bold, t),
        caption1Regular: TextStyle.lerp(caption1Regular, b.caption1Regular, t),
        caption1Bold: TextStyle.lerp(caption1Bold, b.caption1Bold, t),
        footnoteRegular: TextStyle.lerp(footnoteRegular, b.footnoteRegular, t),
        footnoteBold: TextStyle.lerp(footnoteBold, b.footnoteBold, t),
        subheadlineRegular:
            TextStyle.lerp(subheadlineRegular, b.subheadlineRegular, t),
        subheadlineBold: TextStyle.lerp(subheadlineBold, b.subheadlineBold, t),
        calloutRegular: TextStyle.lerp(calloutRegular, b.calloutRegular, t),
        calloutBold: TextStyle.lerp(calloutBold, b.calloutBold, t),
        bodyRegular: TextStyle.lerp(bodyRegular, b.bodyRegular, t),
        bodyBold: TextStyle.lerp(bodyBold, b.bodyBold, t),
        headlineRegular: TextStyle.lerp(headlineRegular, b.headlineRegular, t),
        headlineBold: TextStyle.lerp(headlineBold, b.headlineBold, t),
        title3Regular: TextStyle.lerp(title3Regular, b.title3Regular, t),
        title3Bold: TextStyle.lerp(title3Bold, b.title3Bold, t),
        title2Regular: TextStyle.lerp(title2Regular, b.title2Regular, t),
        title2Bold: TextStyle.lerp(title2Bold, b.title2Bold, t),
        title1Regular: TextStyle.lerp(title1Regular, b.title1Regular, t),
        title1Bold: TextStyle.lerp(title1Bold, b.title1Bold, t),
        largeTitleRegular:
            TextStyle.lerp(largeTitleRegular, b.largeTitleRegular, t),
        largeTitleBold: TextStyle.lerp(largeTitleBold, b.largeTitleBold, t),
      );
}
