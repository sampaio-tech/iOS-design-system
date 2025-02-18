import 'package:flutter/cupertino.dart';

import '../../ios_design_system.dart';

class ModalTitleWidget extends StatelessWidget {
  const ModalTitleWidget({
    required this.title,
    required this.leftLabelButton,
    required this.rightLabelButton,
    super.key,
    this.size = ModalTitleSize.small,
  });
  final String title;
  final LabelButtonWidget? leftLabelButton;
  final LabelButtonWidget? rightLabelButton;
  final ModalTitleSize size;

  @override
  Widget build(BuildContext context) {
    const labelPadding = EdgeInsets.symmetric(
      horizontal: 7,
      vertical: 11,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leftLabelButton != null)
              leftLabelButton?.copyWith(padding: labelPadding) ??
                  const SizedBox.shrink(),
            switch (size) {
              ModalTitleSize.large => const Spacer(),
              final size => Expanded(
                  child: Padding(
                    padding: size.padding,
                    child: Text(
                      title,
                      style: size.style(context),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
            },
            if (rightLabelButton != null)
              rightLabelButton?.copyWith(padding: labelPadding) ??
                  const SizedBox.shrink(),
          ],
        ),
        switch (size) {
          ModalTitleSize.small => const SizedBox.shrink(),
          final size => Padding(
              padding: size.padding,
              child: Text(
                title,
                style: size.style(context),
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
    padding: EdgeInsets.symmetric(
      vertical: 11,
    ),
  ),
  large(
    padding: EdgeInsets.only(
      left: 16,
      right: 16,
      top: 5,
    ),
  );

  const ModalTitleSize({
    required this.padding,
  });

  final EdgeInsets padding;

  TextStyle style(BuildContext context) {
    final theme = IosTheme.of(context);
    final _style = switch (this) {
      ModalTitleSize.small => theme.typography.headlineRegular,
      ModalTitleSize.large => theme.typography.largeTitleBold,
    };
    return _style.copyWith(
      color: _color(theme),
    );
  }

  Color _color(
    IosThemeData theme,
  ) =>
      theme.defaultLabelColors.primary;
}
