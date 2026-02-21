import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:ios_design_system/ios_design_system.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends HookWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = useState(false);

    final themeData = useMemoized(
      () => isDark.value ? IosDarkThemeData() : IosLightThemeData(),
      [isDark.value],
    );

    return IosAnimatedTheme(
      data: themeData,
      child: CupertinoApp(
        title: 'iOS Design System Example',
        theme: CupertinoThemeData(
          brightness: themeData.brightness,
        ),
        home: HomeScreen(
          isDarkMode: isDark.value,
          onThemeToggle: (value) => isDark.value = value,
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.isDarkMode,
    required this.onThemeToggle,
    super.key,
  });

  final bool isDarkMode;
  final ValueChanged<bool> onThemeToggle;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);

    return ScaffoldWidget(
      navigationBar: CupertinoNavigatorBarWidget(
        title: 'iOS Design System',
        imageFilter: NavigatorBarImageFilter.enabled,
        leading: null,
        trailing: null,
      ),
      toolBar: null,
      child: CupertinoScrollbar(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 24),
                // Theme Switcher
                GroupedTableWidget.rounded(
                  title: const TitleWidget(
                    text: 'APPEARANCE',
                    size: TitleSize.small,
                  ),
                  rows: [
                    RowWidget.standard(
                      title: 'Dark Mode',
                      description: 'Toggle between light and dark themes',
                      leftWidget: IconWidget.background(
                        iconData: isDarkMode
                            ? CupertinoIcons.moon_fill
                            : CupertinoIcons.sun_max_fill,
                        backgroundColorCallback: (theme) => isDarkMode
                            ? theme.defaultColors.systemIndigo
                            : theme.defaultColors.systemYellow,
                      ),
                      rightWidget: SwitchWidget(
                        value: isDarkMode,
                        onChanged: onThemeToggle,
                      ),
                      displayDivider: false,
                      onPressed: null,
                      onLongPress: null,
                      decorationCallback: null,
                    ),
                  ],
                  description: const DescriptionWidget(
                    text: 'Theme changes apply immediately to all screens.',
                  ),
                ),
                const SizedBox(height: 24),
                // Examples
                GroupedTableWidget.rounded(
                  title: const TitleWidget(
                    text: 'EXAMPLES',
                    size: TitleSize.small,
                  ),
                  rows: [
                    RowWidget.standard(
                      title: 'Layout Widgets',
                      description: 'Scaffold, Navigation, Tables, Rows',
                      leftWidget: IconWidget.background(
                        iconData: CupertinoIcons.square_grid_2x2,
                        backgroundColorCallback: (theme) =>
                            theme.defaultColors.systemBlue,
                      ),
                      rightWidget: const Icon(CupertinoIcons.chevron_right),
                      displayDivider: true,
                      onPressed: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (context) => const LayoutExampleScreen(),
                          ),
                        );
                      },
                      onLongPress: null,
                      decorationCallback: null,
                    ),
                    RowWidget.standard(
                      title: 'Form Widgets',
                      description: 'Text fields, Switches, Pickers',
                      leftWidget: IconWidget.background(
                        iconData: CupertinoIcons.doc_text,
                        backgroundColorCallback: (theme) =>
                            theme.defaultColors.systemGreen,
                      ),
                      rightWidget: const Icon(CupertinoIcons.chevron_right),
                      displayDivider: true,
                      onPressed: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (context) => const FormExampleScreen(),
                          ),
                        );
                      },
                      onLongPress: null,
                      decorationCallback: null,
                    ),
                    RowWidget.standard(
                      title: 'Button Widgets',
                      description: 'All button sizes and colors',
                      leftWidget: IconWidget.background(
                        iconData: CupertinoIcons.circle_fill,
                        backgroundColorCallback: (theme) =>
                            theme.defaultColors.systemPurple,
                      ),
                      rightWidget: const Icon(CupertinoIcons.chevron_right),
                      displayDivider: true,
                      onPressed: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (context) => const ButtonExampleScreen(),
                          ),
                        );
                      },
                      onLongPress: null,
                      decorationCallback: null,
                    ),
                    RowWidget.standard(
                      title: 'Display Widgets',
                      description: 'Icons, Tags, Markdown',
                      leftWidget: IconWidget.background(
                        iconData: CupertinoIcons.photo,
                        backgroundColorCallback: (theme) =>
                            theme.defaultColors.systemOrange,
                      ),
                      rightWidget: const Icon(CupertinoIcons.chevron_right),
                      displayDivider: true,
                      onPressed: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (context) => const DisplayExampleScreen(),
                          ),
                        );
                      },
                      onLongPress: null,
                      decorationCallback: null,
                    ),
                    RowWidget.standard(
                      title: 'Sheets & Modals',
                      description: 'Bottom sheets, Action sheets',
                      leftWidget: IconWidget.background(
                        iconData: CupertinoIcons.rectangle_on_rectangle,
                        backgroundColorCallback: (theme) =>
                            theme.defaultColors.systemPink,
                      ),
                      rightWidget: const Icon(CupertinoIcons.chevron_right),
                      displayDivider: false,
                      onPressed: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (context) => const SheetExampleScreen(),
                          ),
                        );
                      },
                      onLongPress: null,
                      decorationCallback: null,
                    ),
                  ],
                  description: const DescriptionWidget(
                    text:
                        'Explore all widget categories with interactive examples.',
                  ),
                ),
                const SizedBox(height: 24),
                // About
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'iOS Design System for Flutter\nVersion 1.0.0',
                    textAlign: TextAlign.center,
                    style: theme.typography.footnoteRegular.copyWith(
                      color: theme.defaultLabelColors.secondary,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Layout Example Screen
class LayoutExampleScreen extends StatelessWidget {
  const LayoutExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      navigationBar: CupertinoNavigatorBarWidget(
        title: 'Layout Widgets',
        imageFilter: NavigatorBarImageFilter.enabled,
        leading: null,
        trailing: LabelButtonWidget.label(
          label: 'Info',
          onPressed: () {
            CupertinoSheetWidget.showModalSheet(
              context: context,
              title: TitleSheetWidget.standard(
                title: 'Layout Widgets',
                leading: CloseButtonWidget(
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              children: (context) => [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'This screen demonstrates:\n\n'
                    '• ScaffoldWidget\n'
                    '• CupertinoNavigatorBarWidget\n'
                    '• GroupedTableWidget\n'
                    '• RowWidget\n'
                    '• IconWidget\n'
                    '• TitleWidget\n'
                    '• DescriptionWidget',
                  ),
                ),
              ],
            );
          },
        ),
      ),
      toolBar: null,
      child: CupertinoScrollbar(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 24),
                GroupedTableWidget.rounded(
                  title: const TitleWidget(
                    text: 'PROFILE',
                    size: TitleSize.small,
                  ),
                  rows: [
                    RowWidget.standard(
                      title: 'John Doe',
                      description: 'john.doe@example.com',
                      leftWidget: IconWidget.background(
                        iconData: CupertinoIcons.person_circle_fill,
                        backgroundColorCallback: (theme) =>
                            theme.defaultColors.systemBlue,
                      ),
                      rightWidget: const Icon(CupertinoIcons.chevron_right),
                      displayDivider: false,
                      onPressed: () {},
                      onLongPress: null,
                      decorationCallback: null,
                    ),
                  ],
                  description: null,
                ),
                const SizedBox(height: 24),
                GroupedTableWidget.rounded(
                  title: const TitleWidget(
                    text: 'SETTINGS',
                    size: TitleSize.small,
                  ),
                  rows: [
                    RowWidget.standard(
                      title: 'Privacy',
                      description: null,
                      leftWidget: IconWidget.background(
                        iconData: CupertinoIcons.lock_shield,
                        backgroundColorCallback: (theme) =>
                            theme.defaultColors.systemGreen,
                      ),
                      rightWidget: const Icon(CupertinoIcons.chevron_right),
                      displayDivider: true,
                      onPressed: () {},
                      onLongPress: null,
                      decorationCallback: null,
                    ),
                    RowWidget.standard(
                      title: 'Security',
                      description: null,
                      leftWidget: IconWidget.background(
                        iconData: CupertinoIcons.checkmark_shield,
                        backgroundColorCallback: (theme) =>
                            theme.defaultColors.systemOrange,
                      ),
                      rightWidget: const Icon(CupertinoIcons.chevron_right),
                      displayDivider: true,
                      onPressed: () {},
                      onLongPress: null,
                      decorationCallback: null,
                    ),
                    RowWidget.standard(
                      title: 'Help',
                      description: null,
                      leftWidget: IconWidget.background(
                        iconData: CupertinoIcons.question_circle,
                        backgroundColorCallback: (theme) =>
                            theme.defaultColors.systemPurple,
                      ),
                      rightWidget: const Icon(CupertinoIcons.chevron_right),
                      displayDivider: false,
                      onPressed: () {},
                      onLongPress: null,
                      decorationCallback: null,
                    ),
                  ],
                  description: const DescriptionWidget(
                    text: 'Manage your account settings and preferences.',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Form Example Screen
class FormExampleScreen extends HookWidget {
  const FormExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final notificationsEnabled = useState(true);
    final selectedDate = useState(DateTime.now());
    final isValid = useState(false);
    final isLoading = useState(false);

    // Auto-validation
    useEffect(() {
      void validate() {
        isValid.value = nameController.text.isNotEmpty &&
            emailController.text.contains('@');
      }

      nameController.addListener(validate);
      emailController.addListener(validate);

      return () {
        nameController.removeListener(validate);
        emailController.removeListener(validate);
      };
    }, [nameController, emailController]);

    return ScaffoldWidget(
      navigationBar: CupertinoNavigatorBarWidget(
        title: 'Form Example',
        imageFilter: NavigatorBarImageFilter.enabled,
        leading: null,
        trailing: null,
      ),
      toolBar: ToolBarWidget(
        imageFilter: ToolBarImageFilter.enabled,
        child: ButtonWidget.label(
          size: const LargeButtonSize(),
          color: const BlueButtonColor(),
          label: 'Save Profile',
          displayCupertinoActivityIndicator: isLoading.value,
          onPressed: !isValid.value || isLoading.value
              ? null
              : () async {
                  isLoading.value = true;
                  await Future.delayed(const Duration(seconds: 2));
                  isLoading.value = false;
                  if (context.mounted) {
                    await CupertinoSheetWidget.showModalSheet(
                      context: context,
                      title: TitleSheetWidget.standard(
                        title: 'Success',
                      ),
                      children: (context) => [
                        const Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(
                            child: Text('Profile saved successfully!'),
                          ),
                        ),
                        ButtonWidget.label(
                          size: const LargeButtonSize(),
                          color: const BlueButtonColor(),
                          label: 'OK',
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    );
                  }
                },
        ),
      ),
      child: CupertinoScrollbar(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 24),
                GroupedTableWidget.rounded(
                  title: const TitleWidget(
                    text: 'PERSONAL INFORMATION',
                    size: TitleSize.small,
                  ),
                  rows: [
                    CupertinoTextFieldWidget(
                      placeholder: 'Full Name',
                      controller: nameController,
                      textInputAction: TextInputAction.next,
                    ),
                    const DividerWidget(),
                    CupertinoTextFieldWidget(
                      placeholder: 'Email',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                    ),
                  ],
                  description: const DescriptionWidget(
                    text: 'Your email will be used for account recovery.',
                  ),
                ),
                const SizedBox(height: 24),
                GroupedTableWidget.rounded(
                  title: const TitleWidget(
                    text: 'PREFERENCES',
                    size: TitleSize.small,
                  ),
                  rows: [
                    RowWidget.standard(
                      title: 'Notifications',
                      description: 'Receive push notifications',
                      leftWidget: null,
                      rightWidget: SwitchWidget(
                        value: notificationsEnabled.value,
                        onChanged: (value) =>
                            notificationsEnabled.value = value,
                      ),
                      displayDivider: true,
                      onPressed: null,
                      onLongPress: null,
                      decorationCallback: null,
                    ),
                    RowWidget.standard(
                      title: 'Birthday',
                      description: null,
                      leftWidget: null,
                      rightWidget: PickerButtonWidget.dateTime(
                        dateTime: selectedDate.value,
                        dateFormat: DateFormat.yMMMMd('en_US'),
                        onPressed: () async {
                          await CupertinoDatePickerWidget.show(
                            context: context,
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: selectedDate.value,
                            maximumDate: DateTime.now(),
                            onDateTimeChanged: (date) {
                              selectedDate.value = date;
                            },
                          );
                        },
                      ),
                      displayDivider: false,
                      onPressed: null,
                      onLongPress: null,
                      decorationCallback: null,
                    ),
                  ],
                  description: null,
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CupertinoSearchTextFieldWidget(
                    placeholder: 'Search settings',
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Button Example Screen
class ButtonExampleScreen extends StatelessWidget {
  const ButtonExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);

    return ScaffoldWidget(
      navigationBar: CupertinoNavigatorBarWidget(
        title: 'Button Widgets',
        imageFilter: NavigatorBarImageFilter.enabled,
        leading: null,
        trailing: null,
      ),
      toolBar: null,
      child: CupertinoScrollbar(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Button Sizes',
                    style: theme.typography.title3Bold,
                  ),
                  const SizedBox(height: 16),
                  ButtonWidget.label(
                    size: const LargeButtonSize(),
                    color: const BlueButtonColor(),
                    label: 'Large Button (50pt)',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 8),
                  ButtonWidget.label(
                    size: const MediumButtonSize(),
                    color: const BlueButtonColor(),
                    label: 'Medium Button (34pt)',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 8),
                  ButtonWidget.label(
                    size: const SmallButtonSize(),
                    color: const BlueButtonColor(),
                    label: 'Small (28pt)',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Button Colors',
                    style: theme.typography.title3Bold,
                  ),
                  const SizedBox(height: 16),
                  ButtonWidget.label(
                    size: const LargeButtonSize(),
                    color: const BlueButtonColor(),
                    label: 'Blue (Primary)',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 8),
                  ButtonWidget.label(
                    size: const LargeButtonSize(),
                    color: const GreyTransparentButtonColor(),
                    label: 'Grey Transparent (Secondary)',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 8),
                  ButtonWidget.label(
                    size: const LargeButtonSize(),
                    color: const BlueTransparentButtonColor(),
                    label: 'Blue Transparent (Tertiary)',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Buttons with Icons',
                    style: theme.typography.title3Bold,
                  ),
                  const SizedBox(height: 16),
                  ButtonWidget.label(
                    size: const MediumButtonSize(),
                    color: const BlueButtonColor(),
                    label: 'Share',
                    leftIcon: CupertinoIcons.share,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 8),
                  ButtonWidget.label(
                    size: const MediumButtonSize(),
                    color: const GreyTransparentButtonColor(),
                    label: 'Next',
                    rigthIcon: CupertinoIcons.forward,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ButtonWidget.icon(
                        size: const MediumButtonSize(),
                        color: const GreyTransparentButtonColor(),
                        leftIcon: CupertinoIcons.add,
                        onPressed: () {},
                      ),
                      const SizedBox(width: 8),
                      ButtonWidget.icon(
                        size: const MediumButtonSize(),
                        color: const GreyTransparentButtonColor(),
                        leftIcon: CupertinoIcons.heart,
                        onPressed: () {},
                      ),
                      const SizedBox(width: 8),
                      ButtonWidget.icon(
                        size: const MediumButtonSize(),
                        color: const GreyTransparentButtonColor(),
                        leftIcon: CupertinoIcons.ellipsis,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Button States',
                    style: theme.typography.title3Bold,
                  ),
                  const SizedBox(height: 16),
                  ButtonWidget.label(
                    size: const LargeButtonSize(),
                    color: const BlueButtonColor(),
                    label: 'Disabled Button',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Display Example Screen
class DisplayExampleScreen extends HookWidget {
  const DisplayExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    final selectedTags = useState<Set<String>>({'sports', 'news'});

    return ScaffoldWidget(
      navigationBar: CupertinoNavigatorBarWidget(
        title: 'Display Widgets',
        imageFilter: NavigatorBarImageFilter.enabled,
        leading: null,
        trailing: null,
      ),
      toolBar: null,
      child: CupertinoScrollbar(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Icons',
                    style: theme.typography.title3Bold,
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      IconWidget.background(
                        iconData: CupertinoIcons.phone,
                        backgroundColorCallback: (theme) =>
                            theme.defaultColors.systemGreen,
                      ),
                      const SizedBox(width: 12),
                      IconWidget.background(
                        iconData: CupertinoIcons.envelope,
                        backgroundColorCallback: (theme) =>
                            theme.defaultColors.systemBlue,
                      ),
                      const SizedBox(width: 12),
                      IconWidget.background(
                        iconData: CupertinoIcons.calendar,
                        backgroundColorCallback: (theme) =>
                            theme.defaultColors.systemRed,
                      ),
                      const SizedBox(width: 12),
                      IconWidget.background(
                        iconData: CupertinoIcons.camera,
                        backgroundColorCallback: (theme) =>
                            theme.defaultColors.systemGray02,
                      ),
                      const SizedBox(width: 12),
                      IconWidget.transparentBackground(
                        iconData: CupertinoIcons.star_fill,
                        iconColorCallback: (theme) =>
                            theme.defaultColors.systemYellow,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TitleWidget(
                    text: 'Tags',
                    size: TitleSize.large,
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: ['sports', 'news', 'tech', 'health', 'finance']
                        .map((tag) {
                      return TagWidget(
                        label: tag,
                        selected: selectedTags.value.contains(tag),
                        onPressed: () {
                          final newSet = Set<String>.from(selectedTags.value);
                          if (newSet.contains(tag)) {
                            newSet.remove(tag);
                          } else {
                            newSet.add(tag);
                          }
                          selectedTags.value = newSet;
                        },
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 32),
                const DividerWidget(),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TitleWidget(
                    text: 'MARKDOWN',
                    size: TitleSize.small,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: MarkdownWidget(
                    text: '''
# Heading 1
## Heading 2

This is **bold** and this is *italic*.

- Item 1
- Item 2
- Item 3

```dart
void main() {
  print('Hello, World!');
}
```
''',
                  ),
                ),
                const SizedBox(height: 16),
                const DividerWidget(),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: DescriptionWidget(
                    text: 'This is a description widget. Use it to provide '
                        'additional context or help text for your UI elements.',
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Sheet Example Screen
class SheetExampleScreen extends StatelessWidget {
  const SheetExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      navigationBar: CupertinoNavigatorBarWidget(
        title: 'Sheets & Modals',
        imageFilter: NavigatorBarImageFilter.enabled,
        leading: null,
        trailing: null,
      ),
      toolBar: null,
      child: CupertinoScrollbar(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 24),
                GroupedTableWidget.rounded(
                  title: const TitleWidget(
                    text: 'SHEET TYPES',
                    size: TitleSize.small,
                  ),
                  rows: [
                    RowWidget.standard(
                      title: 'Action Sheet',
                      description: 'Simple selection sheet',
                      leftWidget: null,
                      rightWidget: const Icon(CupertinoIcons.chevron_right),
                      displayDivider: true,
                      onPressed: () async {
                        final action =
                            await CupertinoSheetWidget.showModalSheet<String>(
                          context: context,
                          title: TitleSheetWidget.standard(
                            title: 'Choose Action',
                          ),
                          children: (context) => [
                            RowWidget.standard(
                              title: 'Share',
                              description: null,
                              leftWidget: IconWidget.background(
                                iconData: CupertinoIcons.share,
                              ),
                              rightWidget: null,
                              displayDivider: true,
                              onPressed: () => Navigator.pop(context, 'share'),
                              onLongPress: null,
                              decorationCallback: null,
                            ),
                            RowWidget.standard(
                              title: 'Save',
                              description: null,
                              leftWidget: IconWidget.background(
                                iconData: CupertinoIcons.square_arrow_down,
                              ),
                              rightWidget: null,
                              displayDivider: false,
                              onPressed: () => Navigator.pop(context, 'save'),
                              onLongPress: null,
                              decorationCallback: null,
                            ),
                          ],
                        );
                        if (action != null && context.mounted) {
                          // Handle action
                        }
                      },
                      onLongPress: null,
                      decorationCallback: null,
                    ),
                    RowWidget.standard(
                      title: 'Search Modal',
                      description: 'Modal with search field',
                      leftWidget: null,
                      rightWidget: const Icon(CupertinoIcons.chevron_right),
                      displayDivider: true,
                      onPressed: () {
                        ModalSheetWidget.showModalSheet(
                          context: context,
                          barrierFilter: BarrierFilter.enabled,
                          title: ModalTitleWidget(
                            title: 'Select Contact',
                            leftLabelButton: LabelButtonWidget.label(
                              label: 'Cancel',
                              onPressed: () => Navigator.pop(context),
                            ),
                            rightLabelButton: null,
                          ),
                          cupertinoSearchTextFieldWidget:
                              const CupertinoSearchTextFieldWidget(
                            placeholder: 'Search contacts',
                          ),
                          prompt: const PromptWidget(
                            message: 'Search for a contact to add.',
                          ),
                        );
                      },
                      onLongPress: null,
                      decorationCallback: null,
                    ),
                    RowWidget.standard(
                      title: 'Confirmation Sheet',
                      description: 'Ask user to confirm',
                      leftWidget: null,
                      rightWidget: const Icon(CupertinoIcons.chevron_right),
                      displayDivider: false,
                      onPressed: () async {
                        final confirmed = await CupertinoSheetWidget
                            .showStandardModalSheet<bool>(
                          context: context,
                          title: 'Confirm Delete',
                          children: (context) => [
                            const Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                'Are you sure you want to delete this item? '
                                'This action cannot be undone.',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const DividerWidget(),
                            RowWidget.standard(
                              title: 'Delete',
                              description: null,
                              leftWidget: null,
                              rightWidget: null,
                              displayDivider: true,
                              onPressed: () => Navigator.pop(context, true),
                              onLongPress: null,
                              decorationCallback: null,
                            ),
                            RowWidget.standard(
                              title: 'Cancel',
                              description: null,
                              leftWidget: null,
                              rightWidget: null,
                              displayDivider: false,
                              onPressed: () => Navigator.pop(context, false),
                              onLongPress: null,
                              decorationCallback: null,
                            ),
                          ],
                        );
                        if (confirmed == true && context.mounted) {
                          // Handle delete
                        }
                      },
                      onLongPress: null,
                      decorationCallback: null,
                    ),
                  ],
                  description: const DescriptionWidget(
                    text: 'Tap any option to see the sheet in action.',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
