---
description: "File structure, naming conventions, exports, and extending the design system"
alwaysApply: false
---

# File Organization & Architecture

Guide to file structure, naming conventions, and how to extend the design system.

## Project Structure

```
ios_design_system/
├── lib/
│   ├── ios_design_system.dart          # Main export file
│   └── src/
│       ├── exports.dart                # Internal exports
│       ├── theme/                      # Theme system
│       │   ├── exports.dart
│       │   ├── colors/                 # Color definitions
│       │   │   ├── colors.dart         # Main export
│       │   │   ├── default.dart        # System colors
│       │   │   ├── acessible.dart      # Accessibility colors
│       │   │   ├── app_store.dart      # App Store theme
│       │   │   ├── books.dart          # Books theme
│       │   │   ├── neutral_music.dart  # Music theme
│       │   │   ├── neutral_podcast.dart # Podcast theme
│       │   │   ├── stocks.dart         # Stocks theme
│       │   │   ├── weather.dart        # Weather theme
│       │   │   ├── system_colours.dart # Separator colors
│       │   │   └── system_materials.dart # Material backgrounds
│       │   ├── settings/               # Theme configuration
│       │   ├── typography/             # Font styles
│       │   └── extra/                  # Additional theme data
│       └── widgets/                    # Widget components
│           ├── exports.dart            # Widget exports
│           ├── scaffold_widget.dart
│           ├── cupertino_navigation_bar_widget.dart
│           ├── tool_bar_widget.dart
│           ├── grouped_table_widget.dart
│           ├── row_widget.dart
│           ├── button_widget.dart
│           ├── cupertino_button_widget.dart
│           ├── cupertino_text_field_widget.dart
│           ├── cupertino_search_text_field_widget.dart
│           ├── cupertino_sheet_widget.dart
│           ├── modal_sheet_widget.dart
│           ├── title_sheet_widget.dart
│           ├── modal_title_widget.dart
│           ├── cupertino_picker_widget.dart
│           ├── cupertino_date_picker_widget.dart
│           ├── picker_button_widget.dart
│           ├── switch_widget.dart
│           ├── icon_widget.dart
│           ├── tag_widget.dart
│           ├── title_widget.dart
│           ├── description_widget.dart
│           ├── divider_widget.dart
│           ├── label_button_widget.dart
│           ├── close_button_widget.dart
│           ├── prompt_widget.dart
│           ├── resize_indicator_widget.dart
│           ├── app_icon_widget.dart
│           ├── markdown_widget.dart
│           ├── markdown_modal_sheet_widget.dart
│           ├── app_store/              # App Store widgets
│           │   └── ...
│           └── neutral_music/          # Music widgets
│               ├── neutral_card_widget.dart
│               ├── neutral_circular_button_widget.dart
│               ├── neutral_pill_button_widget.dart
│               └── neutral_decorations_style.dart
├── example/                            # Example app
│   └── lib/
│       └── main.dart
├── test/                               # Tests
├── pubspec.yaml                        # Package configuration
└── README.md
```

---

## File Naming Conventions

### Widget Files

**Pattern:** `{widget_name}_widget.dart`

```dart
// Good
scaffold_widget.dart
button_widget.dart
cupertino_text_field_widget.dart

// Avoid
scaffold.dart
btn_widget.dart
textfield.dart
```

### Theme Files

**Pattern:** `{theme_name}.dart` or `{category}.dart`

```dart
// Good
default.dart
stocks.dart
neutral_music.dart
system_colours.dart

// Avoid
defaultTheme.dart
stocks_theme.dart
music.dart
```

### Class Naming

**Widgets:** `{Name}Widget`

```dart
class ScaffoldWidget extends StatelessWidget {}
class ButtonWidget extends StatelessWidget {}
class IconWidget extends StatelessWidget {}
```

**Theme Data:** `{Name}ThemeData` or `{Name}Colors`

```dart
class IosLightThemeData extends IosThemeData {}
class IosDarkThemeData extends IosThemeData {}
class DefaultColorsLight extends DefaultColors {}
```

**Enums:** `{Context}{Name}`

```dart
enum TitleSize { small, large }
enum NavigatorBarImageFilter { enabled, disabled }
enum ButtonSize { small, medium, large }
```

---

## Export Strategy

### Main Export File

`lib/ios_design_system.dart`:
```dart
library ios_design_system;

export 'src/exports.dart';
```

### Internal Exports

`lib/src/exports.dart`:
```dart
export 'theme/exports.dart';
export 'widgets/exports.dart';
```

### Widget Exports

`lib/src/widgets/exports.dart`:
```dart
export 'app_icon_widget.dart';
export 'button_widget.dart';
export 'close_button_widget.dart';
export 'cupertino_button_widget.dart';
export 'cupertino_date_picker_widget.dart';
// ... all widget exports
export 'app_store/exports.dart';
export 'neutral_music/exports.dart';
```

### Theme Exports

`lib/src/theme/exports.dart`:
```dart
export 'colors/colors.dart';
export 'settings/exports.dart';
export 'typography/exports.dart';
export 'extra/exports.dart';
```

---

## Adding New Widgets

### Step 1: Create Widget File

Create file in `/lib/src/widgets/`:

```dart
// lib/src/widgets/my_custom_widget.dart
import 'package:flutter/cupertino.dart';
import '../../ios_design_system.dart';

class MyCustomWidget extends StatelessWidget {
  const MyCustomWidget({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: switch (theme) {
          IosLightThemeData() => theme.defaultSystemBackgroundsColors.primaryLight,
          IosDarkThemeData() => theme.defaultSystemBackgroundsColors.primaryDarkElevated,
        },
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        title,
        style: theme.typography.bodyRegular.copyWith(
          color: theme.defaultLabelColors.primary,
        ),
      ),
    );
  }
}
```

### Step 2: Export Widget

Add to `/lib/src/widgets/exports.dart`:

```dart
export 'my_custom_widget.dart';
```

### Step 3: Use Widget

```dart
import 'package:ios_design_system/ios_design_system.dart';

MyCustomWidget(title: 'Hello World')
```

---

## Adding Widget Variants

### Factory Constructors Pattern

```dart
class MyWidget extends StatelessWidget {
  const MyWidget._internal({
    required this.style,
    required this.content,
    super.key,
  });

  // Standard variant
  factory MyWidget.standard({
    required String content,
  }) => MyWidget._internal(
    style: MyWidgetStyle.standard,
    content: content,
  );

  // Custom variant
  factory MyWidget.custom({
    required String content,
  }) => MyWidget._internal(
    style: MyWidgetStyle.custom,
    content: content,
  );

  final MyWidgetStyle style;
  final String content;

  @override
  Widget build(BuildContext context) {
    // Implementation
  }
}

enum MyWidgetStyle {
  standard,
  custom,
}
```

### Named Constructors Pattern

```dart
class IconWidget extends StatelessWidget {
  const IconWidget._({
    required this.backgroundColorCallback,
    required this.iconCallback,
    Key? key,
  }) : super(key: key);

  factory IconWidget.background({
    required IconData iconData,
    // ... parameters
  }) => IconWidget._(
    backgroundColorCallback: (theme) => theme.defaultColors.systemBlue,
    iconCallback: (theme) => Icon(iconData),
  );

  factory IconWidget.transparentBackground({
    required IconData iconData,
    // ... parameters
  }) => IconWidget._(
    backgroundColorCallback: null,
    iconCallback: (theme) => Icon(iconData),
  );

  // Implementation
}
```

---

## Adding Custom Themes

### Step 1: Create Color Definitions

Create file in `/lib/src/theme/colors/`:

```dart
// lib/src/theme/colors/my_app.dart
part of 'colors.dart';

class MyAppColors {
  const MyAppColors({
    required this.primary,
    required this.secondary,
    required this.accent,
  });

  final Color primary;
  final Color secondary;
  final Color accent;

  MyAppColors lerp(MyAppColors b, double t) {
    if (identical(this, b)) return this;

    return MyAppColors(
      primary: Color.lerp(primary, b.primary, t)!,
      secondary: Color.lerp(secondary, b.secondary, t)!,
      accent: Color.lerp(accent, b.accent, t)!,
    );
  }
}

class MyAppColorsLight extends MyAppColors {
  const MyAppColorsLight()
    : super(
        primary: const Color(0xFF0066CC),
        secondary: const Color(0xFF00CC66),
        accent: const Color(0xFFCC0066),
      );
}

class MyAppColorsDark extends MyAppColors {
  const MyAppColorsDark()
    : super(
        primary: const Color(0xFF3399FF),
        secondary: const Color(0xFF33FF99),
        accent: const Color(0xFFFF3399),
      );
}
```

### Step 2: Add to Theme Data

Update main color file to include:

```dart
// In IosLightThemeData
final myAppColors = const MyAppColorsLight();

// In IosDarkThemeData
final myAppColors = const MyAppColorsDark();
```

### Step 3: Use Custom Colors

```dart
final theme = IosTheme.of(context);
final primaryColor = theme.myAppColors.primary;

Container(
  color: primaryColor,
  child: child,
)
```

---

## Creating Widget Variants for Custom Themes

### Add Variant to Existing Widget

```dart
// In existing widget file
class RowWidget extends StatelessWidget {
  // Existing constructors...

  // Add new variant
  factory RowWidget.myApp({
    required String title,
    required String? description,
    // ... other parameters
  }) => RowWidget(
    decorationCallback: myAppDecorationCallback,
    title: (theme) => Text(
      title,
      style: theme.typography.bodyRegular.copyWith(
        color: theme.myAppColors.primary, // Use custom colors
      ),
    ),
    description: description != null
      ? (theme) => Text(
          description,
          style: theme.typography.caption1Regular.copyWith(
            color: theme.myAppColors.secondary,
          ),
        )
      : null,
    // ... rest of parameters
  );

  // ...
}

// Helper decoration callback
BoxDecoration myAppDecorationCallback(IosThemeData theme) => BoxDecoration(
  color: switch (theme) {
    IosLightThemeData() => theme.myAppColors.accent.withOpacity(0.1),
    IosDarkThemeData() => theme.myAppColors.accent.withOpacity(0.2),
  },
);
```

---

## Testing New Components

### Create Test File

```dart
// test/widgets/my_custom_widget_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:ios_design_system/ios_design_system.dart';

void main() {
  testWidgets('MyCustomWidget displays title', (tester) async {
    await tester.pumpWidget(
      IosAnimatedTheme(
        data: IosLightThemeData(),
        child: CupertinoApp(
          home: MyCustomWidget(
            title: 'Test Title',
          ),
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
  });

  testWidgets('MyCustomWidget adapts to dark theme', (tester) async {
    await tester.pumpWidget(
      IosAnimatedTheme(
        data: IosDarkThemeData(),
        child: CupertinoApp(
          home: MyCustomWidget(
            title: 'Test',
          ),
        ),
      ),
    );

    // Test dark theme specific behavior
  });
}
```

---

## Documentation Standards

### Widget Documentation Template

```dart
/// iOS-style custom widget for [purpose].
///
/// This widget provides [main features] with automatic theme adaptation
/// for both light and dark modes.
///
/// ## Example
///
/// ```dart
/// MyCustomWidget(
///   title: 'Example',
///   subtitle: 'Description',
///   onPressed: () {
///     print('Tapped');
///   },
/// )
/// ```
///
/// See also:
///
///  * [RelatedWidget], which provides similar functionality.
///  * [OtherWidget], for alternative use cases.
class MyCustomWidget extends StatelessWidget {
  /// Creates a custom widget.
  ///
  /// The [title] parameter is required and must not be null.
  const MyCustomWidget({
    required this.title,
    this.subtitle,
    this.onPressed,
    super.key,
  });

  /// The primary title text.
  final String title;

  /// Optional subtitle text shown below the title.
  final String? subtitle;

  /// Called when the widget is tapped.
  ///
  /// If null, the widget will be non-interactive.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    // Implementation
  }
}
```

---

## Version Control Best Practices

### Commit Message Format

```
type(scope): subject

body

footer
```

**Types:**
- `feat:` New feature
- `fix:` Bug fix
- `refactor:` Code refactoring
- `style:` Formatting changes
- `docs:` Documentation
- `test:` Tests
- `chore:` Build/config changes

**Examples:**
```
feat(widgets): add CustomCardWidget

Adds a new card widget with gradient support and custom shadows.

Closes #123

---

fix(button): resolve loading state animation

Fixes animation glitch when switching between loading and normal state.

---

refactor(theme): simplify color system

Consolidates color callbacks into a single pattern for consistency.

---

docs(readme): update installation instructions

Adds Flutter version requirements and troubleshooting section.
```

### Branch Naming

```
feature/widget-name
fix/issue-description
refactor/component-name
docs/section-name
```

---

## Package Configuration

### pubspec.yaml Structure

```yaml
name: ios_design_system
description: iOS-style design system for Flutter
version: 1.0.0
repository: https://github.com/yourname/ios_design_system

environment:
  sdk: '>=3.0.0 <4.0.0'
  flutter: '>=3.10.0'

dependencies:
  flutter:
    sdk: flutter
  intl: ^0.18.0
  flutter_math_fork: ^0.7.0
  gpt_markdown: ^0.1.0
  flutter_hooks: ^0.20.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0

flutter:
  uses-material-design: false
```

---

## Migration Guide (When Updating)

### Adding Breaking Changes

1. **Update CHANGELOG.md**
2. **Increment major version**
3. **Provide migration guide**
4. **Update examples**

### Example Migration Documentation

```markdown
## Migration from 1.x to 2.x

### Breaking Changes

**ButtonWidget constructor changed:**

Before:
```dart
ButtonWidget(
  label: 'Click',
  style: ButtonStyle.large,
  onPressed: () {},
)
```

After:
```dart
ButtonWidget.label(
  size: const LargeButtonSize(),
  color: const BlueButtonColor(),
  label: 'Click',
  onPressed: () {},
)
```

**IconWidget requires theme callback:**

Before:
```dart
IconWidget(
  icon: CupertinoIcons.star,
  backgroundColor: Colors.blue,
)
```

After:
```dart
IconWidget.background(
  iconData: CupertinoIcons.star,
  backgroundColorCallback: (theme) => theme.defaultColors.systemBlue,
)
```
```

---

## Quick Reference

### File Checklist for New Widgets

- [ ] Created widget file in `/lib/src/widgets/`
- [ ] Named file with `_widget.dart` suffix
- [ ] Exported in `/lib/src/widgets/exports.dart`
- [ ] Added documentation comments
- [ ] Implemented theme callbacks
- [ ] Tested in light and dark modes
- [ ] Created example usage
- [ ] Added to example app
- [ ] Wrote unit tests
- [ ] Updated CHANGELOG.md

### File Checklist for New Themes

- [ ] Created color file in `/lib/src/theme/colors/`
- [ ] Defined light and dark variants
- [ ] Implemented lerp method
- [ ] Added to theme data classes
- [ ] Exported in colors.dart
- [ ] Created widget variants if needed
- [ ] Documented color meanings
- [ ] Tested in example app

---

## Common Patterns Summary

**Import:** Single `ios_design_system` import
**Export:** Centralized through exports.dart files
**Naming:** Consistent `_widget.dart` and `Widget` suffix
**Themes:** Callbacks for dynamic colors
**Variants:** Factory constructors for different styles
**Testing:** Theme-wrapped test widgets
**Docs:** Comprehensive inline documentation
**Version:** Semantic versioning with migration guides
