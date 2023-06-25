import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:ios_design_system/ios_design_system.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: ScaffoldWidget(
        toolBar: ToolBarWidget(
          imageFilter: ToolBarImageFilter.enabled,
          child: ButtonWidget.label(
            size: ButtonSize.large,
            color: ButtonColor.blue,
            onPressed: () {},
            label: 'Label',
          ),
        ),
        navigationBar: CupertinoNavigatorBarWidget(
          title: 'Lorem Ipsum',
          imageFilter: NavigatorBarImageFilter.enabled,
          leading: null,
          trailing: LabelButtonWidget.label(
            label: 'Push',
            iconRight: CupertinoIcons.add,
            onPressed: () => Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => const MyHomePage(title: 'title'),
              ),
            ),
          ),
        ),
        child: CupertinoScrollbar(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ToolBarWidget(
                      child: ButtonWidget.label(
                        size: ButtonSize.large,
                        color: ButtonColor.blue,
                        onPressed: () {},
                        label: 'Label',
                      ),
                    ),
                    ModalTitleWidget(
                      title: 'Title',
                      leftLabelButton: LabelButtonWidget.label(
                        label: 'Back',
                        iconLeft: CupertinoIcons.back,
                        onPressed: () {},
                      ),
                      rightLabelButton: LabelButtonWidget.label(
                        label: 'Add',
                        iconRight: CupertinoIcons.add,
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(height: 8),
                    ModalSheetWidget(
                      cupertinoSearchTextFieldWidget:
                          const CupertinoSearchTextFieldWidget(),
                      title: ModalTitleWidget(
                        title: 'Title',
                        leftLabelButton: LabelButtonWidget.label(
                          label: 'Back',
                          iconLeft: CupertinoIcons.back,
                          onPressed: () {},
                        ),
                        rightLabelButton: LabelButtonWidget.label(
                          label: 'Add',
                          iconRight: CupertinoIcons.add,
                          onPressed: () {},
                        ),
                      ),
                      prompt: const PromptWidget(
                          message: 'This is a prompt message.'),
                    ),
                    const SizedBox(height: 8),
                    ButtonWidget.icon(
                      size: ButtonSize.medium,
                      color: ButtonColor.greyTransparent,
                      onPressed: () {},
                      leftIcon: CupertinoIcons.app,
                    ),
                    const SizedBox(height: 8),
                    ButtonWidget.label(
                      size: ButtonSize.medium,
                      color: ButtonColor.greyTransparent,
                      onPressed: () {},
                      leftIcon: CupertinoIcons.app,
                      label: 'Label',
                    ),
                    const SizedBox(height: 8),
                    const CupertinoSearchTextFieldWidget(),
                    const SizedBox(height: 8),
                    GroupedTableWidget(
                      rows: [
                        const CupertinoTextFieldWidget(
                          placeholder: 'Placeholder',
                        ),
                        RowWidget(
                          onPressed: null,
                          displayDivider: true,
                          title: 'Lorem Ipsum',
                          description:
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                          leftWidget: IconWidget.background(
                            iconData: CupertinoIcons.app,
                          ),
                          rightWidget: IconWidget.background(
                            iconData: CupertinoIcons.app,
                          ),
                        ),
                        RowWidget(
                          onPressed: null,
                          displayDivider: true,
                          title: 'Birthday',
                          description: null,
                          leftWidget: IconWidget.background(
                              iconData: CupertinoIcons.calendar),
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
                          displayDivider: false,
                          title: 'Birthday',
                          description: null,
                          leftWidget: IconWidget.background(
                              iconData: CupertinoIcons.calendar),
                          rightWidget: SwitchWidget(
                            value: false,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                      title: const TitleWidget(
                        text: 'TITLE',
                        size: TitleSize.small,
                      ),
                      description: const DescriptionWidget(
                        text: 'Add description here...',
                      ),
                    ),
                    const SizedBox(height: 8),
                    GroupedTableWidget.rounded(
                      rows: [
                        RowWidget(
                          onPressed: null,
                          displayDivider: true,
                          title: 'Lorem Ipsum',
                          description:
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                          leftWidget: IconWidget.background(
                            iconData: CupertinoIcons.app,
                          ),
                          rightWidget: IconWidget.background(
                            iconData: CupertinoIcons.app,
                          ),
                        ),
                        RowWidget(
                          onPressed: null,
                          displayDivider: true,
                          title: 'Birthday',
                          description: null,
                          leftWidget: IconWidget.background(
                              iconData: CupertinoIcons.calendar),
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
                          displayDivider: false,
                          title: 'Birthday',
                          description: null,
                          leftWidget: IconWidget.background(
                              iconData: CupertinoIcons.calendar),
                          rightWidget: SwitchWidget(
                            value: false,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                      title: const TitleWidget(
                        text: 'TITLE',
                        size: TitleSize.small,
                      ),
                      description: const DescriptionWidget(
                        text: 'Add description here...',
                      ),
                    ),
                    const SizedBox(height: 8),
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
        ),
      ),
    );
  }
}
