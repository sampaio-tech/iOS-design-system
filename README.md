# iOS Design System for Flutter

A comprehensive iOS-native design system for Flutter applications that follows Apple's Human Interface Guidelines. Build beautiful, consistent iOS apps with 35+ pre-built widgets, automatic dark mode support, and complete theming.

[![Flutter](https://img.shields.io/badge/Flutter-3.7.0+-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart)](https://dart.dev)

## ✨ Features

### 🎨 Complete Theme System
- **8 Color Palettes**: System colors, labels, fills, backgrounds, separators, materials, and app-specific themes
- **22 Typography Styles**: SF Pro Text font with all iOS text scales
- **Automatic Dark Mode**: Seamless light/dark theme switching
- **App Themes**: Pre-built themes for Music, Stocks, Weather, App Store, Books, and Podcast apps

### 🧩 35+ Widgets
- **Layout**: Scaffold, Navigation Bar, Toolbar, Grouped Tables, Rows
- **Forms**: Text Fields, Search Fields, Switches, Pickers, Date Pickers
- **Buttons**: Multiple sizes (Small, Medium, Large) and colors (Blue, Grey, Transparent)
- **Display**: Icons, Tags, Titles, Descriptions, Dividers, Markdown
- **Modals**: Bottom Sheets, Action Sheets, Search Modals, Apple Pay Sheets
- **Specialized**: Music Player, App Store, and custom app widgets

### 🪝 Flutter Hooks Integration
- Built-in `flutter_hooks` support for cleaner state management
- No more `StatefulWidget` boilerplate
- Automatic controller disposal
- Example patterns for all widgets

### 📱 Apple HIG Compliant
- Correct spacing (8pt grid system)
- Proper touch targets (44pt minimum)
- iOS animations and transitions
- Native iOS look and feel

## 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  ios_design_system:
    git:
      url: https://github.com/yourusername/ios_design_system.git
      # Or use path for local development:
      # path: ../ios_design_system
```

Then run:

```bash
flutter pub get
```

## 🚀 Quick Start

### 1. Wrap Your App with Theme

```dart
import 'package:flutter/cupertino.dart';
import 'package:ios_design_system/ios_design_system.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = IosDarkThemeData(); // or IosLightThemeData()

    return IosAnimatedTheme(
      data: themeData,
      child: CupertinoApp(
        title: 'My iOS App',
        theme: CupertinoThemeData(
          brightness: themeData.brightness,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
```

### 2. Build a Settings Screen

```dart
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ios_design_system/ios_design_system.dart';

class SettingsScreen extends HookWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = useState(true);
    final darkMode = useState(false);

    return ScaffoldWidget(
      navigationBar: CupertinoNavigatorBarWidget(
        title: 'Settings',
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
                    text: 'PREFERENCES',
                    size: TitleSize.small,
                  ),
                  rows: [
                    RowWidget.standard(
                      title: 'Notifications',
                      description: null,
                      leftWidget: null,
                      rightWidget: SwitchWidget(
                        value: notifications.value,
                        onChanged: (value) => notifications.value = value,
                      ),
                      displayDivider: true,
                      onPressed: null,
                      onLongPress: null,
                      decorationCallback: null,
                    ),
                    RowWidget.standard(
                      title: 'Dark Mode',
                      description: null,
                      leftWidget: null,
                      rightWidget: SwitchWidget(
                        value: darkMode.value,
                        onChanged: (value) => darkMode.value = value,
                      ),
                      displayDivider: false,
                      onPressed: null,
                      onLongPress: null,
                      decorationCallback: null,
                    ),
                  ],
                  description: const DescriptionWidget(
                    text: 'Changes take effect immediately.',
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
```

### 3. Create a Form

```dart
class ProfileForm extends HookWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final isValid = useState(false);

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

    return Column(
      children: [
        GroupedTableWidget.rounded(
          title: const TitleWidget(text: 'PROFILE', size: TitleSize.small),
          rows: [
            CupertinoTextFieldWidget(
              placeholder: 'Name',
              controller: nameController,
            ),
            const DividerWidget(),
            CupertinoTextFieldWidget(
              placeholder: 'Email',
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
          ],
          description: null,
        ),
        const SizedBox(height: 16),
        ButtonWidget.label(
          size: const LargeButtonSize(),
          color: const BlueButtonColor(),
          label: 'Save',
          onPressed: isValid.value ? () {} : null,
        ),
      ],
    );
  }
}
```

## 📚 Documentation

### Widget Categories

#### Layout Widgets
- **ScaffoldWidget** - Main screen container
- **CupertinoNavigatorBarWidget** - Navigation bar with blur
- **ToolBarWidget** - Bottom toolbar
- **GroupedTableWidget** - Settings-style lists
- **RowWidget** - Individual list rows

[See Layout Widgets Guide →](.claude/skills/layout-widgets/SKILL.md)

#### Form Widgets
- **CupertinoTextFieldWidget** - Text input
- **CupertinoSearchTextFieldWidget** - Search field
- **SwitchWidget** - Toggle switch
- **PickerButtonWidget** - Date/time picker button
- **CupertinoDatePickerWidget** - Date/time picker
- **CupertinoPickerWidget** - Custom picker

[See Form Widgets Guide →](.claude/skills/form-widgets/SKILL.md)

#### Button Widgets
- **ButtonWidget** - High-level themed button
- **CupertinoButtonWidget** - Base interactive widget
- Sizes: Small (28pt), Medium (34pt), Large (50pt)
- Colors: Blue, Grey Transparent, Blue Transparent, Custom

[See Button System Guide →](.claude/skills/button-system/SKILL.md)

#### Display Widgets
- **IconWidget** - Icons with backgrounds
- **TagWidget** - Selection tags/chips
- **TitleWidget** - Section headers
- **DescriptionWidget** - Help text
- **DividerWidget** - Separators
- **MarkdownWidget** - Markdown rendering

[See Display Widgets Guide →](.claude/skills/display-widgets/SKILL.md)

#### Sheet & Modal Widgets
- **CupertinoSheetWidget** - Bottom sheets
- **ModalSheetWidget** - Search modals
- **TitleSheetWidget** - Sheet headers
- Supports drag-to-dismiss, nested navigation, Apple Pay variants

[See Sheet & Modals Guide →](.claude/skills/sheet-modals/SKILL.md)

### Theme System

Access theme colors and typography:

```dart
@override
Widget build(BuildContext context) {
  final theme = IosTheme.of(context);

  // Colors
  final primaryColor = theme.defaultColors.systemBlue;
  final textColor = theme.defaultLabelColors.primary;
  final backgroundColor = switch (theme) {
    IosLightThemeData() => theme.defaultSystemBackgroundsColors.primaryLight,
    IosDarkThemeData() => theme.defaultSystemBackgroundsColors.primaryDarkBase,
  };

  // Typography
  final titleStyle = theme.typography.title1Bold;
  final bodyStyle = theme.typography.bodyRegular;

  return Container(
    color: backgroundColor,
    child: Text(
      'Hello',
      style: titleStyle.copyWith(color: textColor),
    ),
  );
}
```

**Available Color Systems:**
1. **System Colors** - `systemBlue`, `systemRed`, `systemGreen`, etc.
2. **Label Colors** - `primary`, `secondary`, `tertiary`, `quaternary`
3. **Fill Colors** - Background fills for UI elements
4. **System Backgrounds** - Screen-level backgrounds
5. **Grouped Backgrounds** - Settings-style backgrounds
6. **Separator Colors** - Dividers and borders
7. **System Materials** - Blur effect colors
8. **App Decorations** - Weather, Stocks, Music, App Store, Books, Podcast

[See Theme System Guide →](.claude/skills/theme-system/SKILL.md)

### Flutter Hooks

This package includes `flutter_hooks` for cleaner state management:

```dart
// Traditional StatefulWidget (verbose)
class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(controller: _controller);
  }
}

// With Hooks (clean)
class MyWidget extends HookWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(); // Auto-disposed!
    return TextField(controller: controller);
  }
}
```

**Common Hooks:**
- `useState` - Simple state
- `useTextEditingController` - Text field controller
- `useEffect` - Side effects and listeners
- `useMemoized` - Cache expensive operations
- `useAnimationController` - Animations

[See Flutter Hooks Guide →](.claude/skills/flutter-hooks/SKILL.md)

## 🎯 App-Specific Themes

Pre-built themes for common iOS app styles:

### Music Player
```dart
NeutralCardWidget(
  child: Column(
    children: [
      // Album art
      NeutralCircularButtonWidget(
        iconData: CupertinoIcons.play_fill,
        onPressed: () {},
      ),
      NeutralPillButtonWidget(
        label: 'Add to Playlist',
        leftIcon: CupertinoIcons.add,
        onPressed: () {},
      ),
    ],
  ),
)
```

### Stocks App
```dart
GroupedTableWidget.stocks(
  title: const TitleWidget(text: 'WATCHLIST', size: TitleSize.small),
  rows: [
    RowWidget.stocks(
      title: 'AAPL',
      description: 'Apple Inc.',
      rightWidget: Text('+2.5%'),
      onPressed: () {},
    ),
  ],
)
```

### App Store
```dart
AppIconWidget(
  imageUrl: 'https://example.com/icon.png',
  size: 60,
  borderRadius: 12,
)
```

[See App Themes Guide →](.claude/skills/app-themes/SKILL.md)

## 🛠️ Creating Custom Widgets

Follow the design system patterns to create your own widgets:

```dart
import 'package:flutter/cupertino.dart';
import 'package:ios_design_system/ios_design_system.dart';

class MyCustomWidget extends StatelessWidget {
  const MyCustomWidget({
    required this.title,
    this.subtitle,
    super.key,
  });

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: switch (theme) {
          IosLightThemeData() =>
            theme.defaultSystemBackgroundsColors.primaryLight,
          IosDarkThemeData() =>
            theme.defaultSystemBackgroundsColors.primaryDarkElevated,
        },
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.typography.bodyBold.copyWith(
              color: theme.defaultLabelColors.primary,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(
              subtitle!,
              style: theme.typography.caption1Regular.copyWith(
                color: theme.defaultLabelColors.secondary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
```

[See Widget Creation Guide →](.claude/skills/create-widget/SKILL.md)

## 📖 Complete Documentation

### For Developers (Cursor IDE)
Comprehensive rules in `.cursor/rules/`:
- `00-project-overview.md` - Project structure and principles
- `01-theme-system.md` - Complete theme documentation
- `02-button-system.md` - Button system guide
- `03-layout-widgets.md` - Layout components
- `04-form-widgets.md` - Form widgets
- `05-display-widgets.md` - Display components
- `06-sheet-modals.md` - Sheets and modals
- `07-specialized-widgets.md` - App-specific widgets
- `08-apple-hig-guidelines.md` - iOS design standards
- `09-code-patterns.md` - Common patterns and recipes
- `10-file-organization.md` - File structure and conventions
- `11-flutter-hooks-patterns.md` - Hook patterns

### For AI Assistants (Claude Code)
Task-specific skills in `.claude/skills/`:
- `theme-system/` - Theme colors and typography
- `button-system/` - Button components
- `layout-widgets/` - Layout components
- `form-widgets/` - Form inputs
- `display-widgets/` - Display components
- `sheet-modals/` - Modal presentations
- `app-themes/` - App-specific themes
- `flutter-hooks/` - Hook patterns
- `create-widget/` - Widget creation guide

## 🎨 Design Principles

1. **Always use theme colors** - Never hardcode colors
2. **Follow Apple HIG** - Correct spacing, sizing, and behavior
3. **Support dark mode** - Test in both themes
4. **Use hooks** - Cleaner state management
5. **Type safety** - Sealed classes for variants
6. **Composability** - Build complex UIs from simple widgets

## 🏃 Running the Example

```bash
cd example
flutter pub get
flutter run
```

The example app demonstrates:
- Theme switching
- All widget categories
- Form validation
- Modal presentations
- Navigation patterns
- Flutter hooks usage

## 🔧 Development Setup

### Prerequisites
- Flutter SDK (>=3.7.0 <4.0.0)
- Dart SDK (>=3.0.0)

### Setting up MCP (Model Context Protocol)

MCP enables AI assistants to interact with your Flutter project:

1. **Copy the example configuration:**
   ```bash
   cp .cursor/mcp.json.example .cursor/mcp.json
   ```

2. **Update Dart SDK path in `.cursor/mcp.json`:**
   ```bash
   which flutter
   # Use: <flutter_path>/bin/cache/dart-sdk/bin/dart
   ```

3. **Restart Cursor IDE**

### Setting up Ralph Orchestrator

Ralph Orchestrator is an AI-powered coding tool:

1. **Install Ralph:**
   ```bash
   npm install -g ralph-orchestrator
   ```

2. **Initialize and configure:**
   ```bash
   ralph init --backend claude
   cp ralph.yml.example ralph.yml
   ```

3. **Update `ralph.yml` with your git settings**

4. **Run Ralph:**
   ```bash
   ralph run
   ```

## 📝 Contributing

We welcome contributions! To maintain consistency:

1. **Follow Apple HIG** - Match iOS native appearance
2. **Use theme exclusively** - No hardcoded colors or styles
3. **Support both themes** - Test light and dark modes
4. **Include examples** - Update example app
5. **Add documentation** - Update relevant skill/rule files
6. **Write tests** - Include unit tests for new widgets

### Creating a Widget

1. Create widget file: `/lib/src/widgets/my_widget.dart`
2. Export in `/lib/src/widgets/exports.dart`
3. Add tests in `/test/widgets/my_widget_test.dart`
4. Update example app
5. Document in `.claude/skills/` and `.cursor/rules/`

[See Complete Widget Creation Guide →](.claude/skills/create-widget/SKILL.md)

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run specific test
flutter test test/widgets/button_widget_test.dart

# Run with coverage
flutter test --coverage
```

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_svg: ^2.0.17      # SVG support
  gpt_markdown: 1.0.19       # Markdown rendering
  flutter_math_fork: 0.7.4   # LaTeX math
  flutter_hooks: ^0.21.2     # Hook-based state
  intl: ^0.20.0              # Date formatting
```

## 🗺️ Roadmap

- [ ] Additional app themes (Notes, Reminders, Calendar)
- [ ] More specialized widgets
- [ ] Accessibility improvements
- [ ] Performance optimizations
- [ ] Web platform support
- [ ] Additional examples

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- Apple Inc. for the Human Interface Guidelines
- Flutter team for the amazing framework
- flutter_hooks for cleaner state management
- All contributors to this project

## 🔗 Links

- [Apple Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines)
- [Flutter Documentation](https://flutter.dev/docs)
- [flutter_hooks Documentation](https://pub.dev/packages/flutter_hooks)
- [Example App](./example)
- [Full Documentation](./.cursor/rules/)

---

**Made with ❤️ for iOS developers using Flutter**
