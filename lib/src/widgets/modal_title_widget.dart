import 'package:flutter/cupertino.dart';

import '../../ios_design_system.dart';

class ModalTitleWidget extends StatelessWidget {
  final String title;
  final LabelButtonWidget? leftLabelButton;
  final LabelButtonWidget? rightLabelButton;
  final ModalTitleSize size;

  const ModalTitleWidget({
    super.key,
    required this.title,
    required this.leftLabelButton,
    required this.rightLabelButton,
    this.size = ModalTitleSize.small,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = CupertinoTheme.brightnessOf(context);
    const kLabelPadding = EdgeInsets.symmetric(horizontal: 7, vertical: 11);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            if (leftLabelButton != null)
              leftLabelButton?.copyWith(padding: kLabelPadding) ??
                  const SizedBox.shrink(),
            switch (size) {
              ModalTitleSize.large => const Spacer(),
              final size => Expanded(
                  child: Padding(
                    padding: size.padding,
                    child: Text(
                      title,
                      style: size.style(brightness),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
            },
            if (rightLabelButton != null)
              rightLabelButton?.copyWith(padding: kLabelPadding) ??
                  const SizedBox.shrink(),
          ],
        ),
        switch (size) {
          ModalTitleSize.small => const SizedBox.shrink(),
          final size => Padding(
              padding: size.padding,
              child: Text(
                title,
                style: size.style(brightness),
                textAlign: TextAlign.start,
                overflow: TextOverflow.visible,
              ),
            ),
        },
      ],
    );
  }
}

enum ModalTitleSize {
  small(
    style: AppTypography.headlineRegular,
    padding: EdgeInsets.symmetric(vertical: 11),
  ),
  large(
    style: AppTypography.largeTitleBold,
    padding: EdgeInsets.only(left: 16, right: 16, top: 5),
  );

  const ModalTitleSize({
    required this.padding,
    required TextStyle style,
  }) : _style = style;

  final EdgeInsets padding;
  final TextStyle _style;

  TextStyle style(Brightness brightness) =>
      _style.copyWith(color: _color(brightness));

  Color _color(Brightness brightness) => switch (brightness) {
        Brightness.light => DefaultLabelColors.primaryLight,
        Brightness.dark => DefaultLabelColors.primaryDark,
      };
}
