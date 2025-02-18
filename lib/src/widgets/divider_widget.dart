import 'package:flutter/cupertino.dart';

import '../../ios_design_system.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    return Container(
      height: 1,
      color: theme.systemColoursSeparatorColors.nonOpaque,
    );
  }
}
