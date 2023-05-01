import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class HotReload extends StatelessWidget {
  const HotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      devices: [
        Apple.iPhone11,
        Samsung.s21ultra,
      ],
      categories: [
        WidgetbookCategory(
          name: 'category',
          widgets: [
            WidgetbookComponent(
              name: 'shink',
              useCases: [
                WidgetbookUseCase.child(
                  name: 'shink',
                  child: const SizedBox.shrink(),
                ),
              ],
            )
          ],
        ),
      ],
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: ThemeData.light(),
        ),
        WidgetbookTheme(
          name: 'Dark',
          data: ThemeData.dark(),
        ),
      ],
      appInfo: AppInfo(name: 'iOS Design System'),
    );
  }
}
