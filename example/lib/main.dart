import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ios_design_system/ios_design_system.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final brightness = CupertinoTheme.brightnessOf(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          color: switch (brightness) {
            Brightness.light =>
              DefaultSystemGroupedBackgroundsColors.primaryLight,
            Brightness.dark => DefaultSystemBackgroundsColors.primaryDarkBase,
          },
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RowWidget(
                  onPressed: null,
                  displayDivider: true,
                  title: 'Lorem Ipsum',
                  description:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                  leftWidget:
                      IconWidget.background(iconData: CupertinoIcons.app),
                  rightWidget:
                      IconWidget.background(iconData: CupertinoIcons.app),
                ),
                RowWidget(
                  onPressed: null,
                  displayDivider: true,
                  title: 'Birthday',
                  description: null,
                  leftWidget:
                      IconWidget.background(iconData: CupertinoIcons.calendar),
                  rightWidget: Row(
                    children: [
                      PickerButtonWidget.dateTime(
                        dateTime: DateTime(2020, 6, 20, 13),
                        dateFormat: DateFormat.yMMMMd('en_US'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                RowWidget(
                  onPressed: null,
                  displayDivider: true,
                  title: 'Birthday',
                  description: null,
                  leftWidget:
                      IconWidget.background(iconData: CupertinoIcons.calendar),
                  rightWidget: SwitchWidget(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
                IconWidget.slideAction(iconData: CupertinoIcons.app),
                const SizedBox(height: 8),
                IconWidget.background(iconData: CupertinoIcons.app),
                const SizedBox(height: 8),
                IconWidget.transparentBackground(
                  iconData: CupertinoIcons.app,
                ),
                const SizedBox(height: 8),
                const TitleWidget(
                  text: 'TITLE',
                  size: TitleSize.small,
                ),
                PickerButtonWidget.dateTime(
                  dateTime: DateTime(2020, 6, 20, 13),
                  dateFormat: DateFormat.yMMMMd('en_US'),
                  onPressed: () {},
                ),
                const SizedBox(height: 8),
                PickerButtonWidget.dateTime(
                  dateTime: DateTime(2020, 6, 20, 13),
                  dateFormat: DateFormat.jm(),
                  onPressed: () {},
                ),
                const DescriptionWidget(
                  text: 'Add description here...',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
