---
name: create-widget
description: Guide to creating new widgets following iOS Design System patterns and conventions
---

## Creating New Widgets

Step-by-step guide to creating widgets that follow the design system's architecture and conventions.

## File Naming Conventions

### Widget Files
**Pattern:** `{widget_name}_widget.dart`

```dart
// ✅ Good
scaffold_widget.dart
button_widget.dart
cupertino_text_field_widget.dart

// ❌ Avoid
scaffold.dart
btn_widget.dart
textfield.dart
```

### Class Naming
**Pattern:** `{Name}Widget`

```dart
class ScaffoldWidget extends StatelessWidget {}
class ButtonWidget extends StatelessWidget {}
class IconWidget extends StatelessWidget {}
```

## Widget Template

### Basic StatelessWidget

```dart
// lib/src/widgets/my_custom_widget.dart
import 'package:flutter/cupertino.dart';
import '../../ios_design_system.dart';

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
///   onPressed: () {},
/// )
/// ```
///
/// See also:
///
///  * [RelatedWidget], which provides similar functionality.
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
    final theme = IosTheme.of(context);

    return CupertinoButtonWidget(
      onPressed: onPressed,
      color: switch (theme) {
        IosLightThemeData() => theme.defaultSystemBackgroundsColors.primaryLight,
        IosDarkThemeData() => theme.defaultSystemBackgroundsColors.primaryDarkElevated,
      },
      borderRadius: BorderRadius.circular(12),
      padding: const EdgeInsets.all(16),
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

### HookWidget Template

```dart
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../ios_design_system.dart';

class MyHookWidget extends HookWidget {
  const MyHookWidget({
    required this.initialValue,
    super.key,
  });

  final String initialValue;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    final controller = useTextEditingController(text: initialValue);
    final isValid = useState(false);

    useEffect(() {
      void validate() {
        isValid.value = controller.text.isNotEmpty;
      }

      controller.addListener(validate);
      return () => controller.removeListener(validate);
    }, [controller]);

    return CupertinoTextFieldWidget(
      controller: controller,
      placeholder: 'Enter text',
    );
  }
}
```

## Widget Variants Pattern

### Factory Constructors

```dart
class MyWidget extends StatelessWidget {
  const MyWidget._internal({
    required this.variant,
    required this.content,
    super.key,
  });

  /// Standard variant with default styling
  factory MyWidget.standard({
    required String content,
  }) => MyWidget._internal(
    variant: MyWidgetVariant.standard,
    content: content,
  );

  /// Rounded variant with 14pt border radius
  factory MyWidget.rounded({
    required String content,
  }) => MyWidget._internal(
    variant: MyWidgetVariant.rounded,
    content: content,
  );

  /// Stocks variant with gradient background
  factory MyWidget.stocks({
    required String content,
  }) => MyWidget._internal(
    variant: MyWidgetVariant.stocks,
    content: content,
  );

  final MyWidgetVariant variant;
  final String content;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);

    return Container(
      decoration: switch (variant) {
        MyWidgetVariant.standard => BoxDecoration(
          color: theme.defaultSystemBackgroundsColors.primaryLight,
        ),
        MyWidgetVariant.rounded => BoxDecoration(
          color: theme.defaultSystemBackgroundsColors.primaryLight,
          borderRadius: BorderRadius.circular(14),
        ),
        MyWidgetVariant.stocks => theme.stocksDecorations.gradients.background,
      },
      child: Text(content),
    );
  }
}

enum MyWidgetVariant {
  standard,
  rounded,
  stocks,
}
```

## Theme Integration

### Required Pattern

**ALWAYS access theme via context:**

```dart
@override
Widget build(BuildContext context) {
  final theme = IosTheme.of(context);

  // Extract colors
  final backgroundColor = switch (theme) {
    IosLightThemeData() => theme.defaultSystemBackgroundsColors.primaryLight,
    IosDarkThemeData() => theme.defaultSystemBackgroundsColors.primaryDarkElevated,
  };

  final textColor = theme.defaultLabelColors.primary;
  final textStyle = theme.typography.bodyRegular;

  return Container(
    color: backgroundColor,
    child: Text(
      'Text',
      style: textStyle.copyWith(color: textColor),
    ),
  );
}
```

### Theme Callbacks

For dynamic theme access in widget parameters:

```dart
class MyWidget extends StatelessWidget {
  const MyWidget({
    required this.title,
    this.backgroundColorCallback,
    this.textColorCallback,
    super.key,
  });

  final String title;
  final Color Function(IosThemeData)? backgroundColorCallback;
  final Color Function(IosThemeData)? textColorCallback;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);

    final backgroundColor = backgroundColorCallback?.call(theme) ??
      theme.defaultSystemBackgroundsColors.primaryLight;

    final textColor = textColorCallback?.call(theme) ??
      theme.defaultLabelColors.primary;

    return Container(
      color: backgroundColor,
      child: Text(
        title,
        style: theme.typography.bodyRegular.copyWith(color: textColor),
      ),
    );
  }
}

// Usage
MyWidget(
  title: 'Hello',
  backgroundColorCallback: (theme) => theme.defaultColors.systemBlue,
  textColorCallback: (theme) => theme.defaultColors.systemWhite,
)
```

## Sealed Classes for Type Safety

### Button Color Example

```dart
sealed class ButtonColor {
  const ButtonColor();

  Color? backgroundEnabled({required BuildContext context});
  Color? backgroundDisabled({required BuildContext context});
  Color labelEnabled({required BuildContext context});
  Color labelDisabled({required BuildContext context});
  Gradient? backgroundGradientEnabled({required BuildContext context}) => null;
}

class BlueButtonColor extends ButtonColor {
  const BlueButtonColor();

  @override
  Color? backgroundEnabled({required BuildContext context}) {
    final theme = IosTheme.of(context);
    return theme.defaultColors.systemBlue;
  }

  @override
  Color? backgroundDisabled({required BuildContext context}) {
    final theme = IosTheme.of(context);
    return theme.defaultFillColors.secondary;
  }

  @override
  Color labelEnabled({required BuildContext context}) {
    final theme = IosTheme.of(context);
    return theme.defaultColors.systemWhite;
  }

  @override
  Color labelDisabled({required BuildContext context}) {
    final theme = IosTheme.of(context);
    return theme.defaultLabelColors.tertiary;
  }
}

class CustomButtonColor extends ButtonColor {
  const CustomButtonColor({
    required this.backgroundEnabledColor,
    required this.backgroundDisabledColor,
    required this.labelEnabledColor,
    required this.labelDisabledColor,
    this.backgroundGradientEnabledValue,
  });

  final Color? backgroundEnabledColor;
  final Color? backgroundDisabledColor;
  final Color labelEnabledColor;
  final Color? labelDisabledColor;
  final Gradient? backgroundGradientEnabledValue;

  @override
  Color? backgroundEnabled({required BuildContext context}) =>
    backgroundEnabledColor;

  @override
  Color? backgroundDisabled({required BuildContext context}) =>
    backgroundDisabledColor;

  @override
  Color labelEnabled({required BuildContext context}) =>
    labelEnabledColor;

  @override
  Color labelDisabled({required BuildContext context}) =>
    labelDisabledColor ?? labelEnabledColor.withOpacity(0.3);

  @override
  Gradient? backgroundGradientEnabled({required BuildContext context}) =>
    backgroundGradientEnabledValue;
}
```

## Export Strategy

### Step 1: Create Widget File

Place in `/lib/src/widgets/`:

```
/lib/src/widgets/my_custom_widget.dart
```

### Step 2: Export Widget

Add to `/lib/src/widgets/exports.dart`:

```dart
export 'my_custom_widget.dart';
```

### Step 3: Import in Code

```dart
import 'package:ios_design_system/ios_design_system.dart';

// Now you can use
MyCustomWidget(title: 'Hello')
```

## Apple HIG Compliance

### Spacing Standards

```dart
// Use standard spacing multiples
const EdgeInsets.all(8)    // Micro spacing
const EdgeInsets.all(16)   // Standard spacing
const EdgeInsets.all(24)   // Section spacing
const EdgeInsets.all(32)   // Large spacing

const SizedBox(height: 8)   // Small gaps
const SizedBox(height: 16)  // Standard gaps
const SizedBox(height: 24)  // Section gaps
const SizedBox(width: 4)    // Between tags
const SizedBox(width: 8)    // Between buttons
```

### Border Radius Standards

```dart
BorderRadius.circular(7)    // Icon backgrounds
BorderRadius.circular(10)   // Search fields
BorderRadius.circular(12)   // Large buttons, cards
BorderRadius.circular(14)   // Grouped tables, small buttons
BorderRadius.circular(50)   // Pills, tags, medium buttons
```

### Touch Targets

**Minimum: 44pt x 44pt**

```dart
BoxConstraints(
  minHeight: 44,
  minWidth: 44,
)
```

### Typography

```dart
// Use theme typography
theme.typography.largeTitleBold    // 34pt - Page headers
theme.typography.title1Bold        // 28pt - Section titles
theme.typography.title2Bold        // 22pt - Subsection titles
theme.typography.title3Bold        // 20pt - Card titles
theme.typography.bodyRegular       // 17pt - Body text (DEFAULT)
theme.typography.calloutRegular    // 16pt - Secondary content
theme.typography.subheadlineRegular // 15pt - Small buttons
theme.typography.footnoteRegular   // 13pt - Footnotes
theme.typography.caption1Regular   // 12pt - Captions
theme.typography.caption2Regular   // 11pt - Smallest text
```

## Testing Checklist

### Create Test File

```dart
// test/widgets/my_custom_widget_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/cupertino.dart';
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

    await tester.pumpAndSettle();
    // Test dark theme specific behavior
  });

  testWidgets('MyCustomWidget handles null subtitle', (tester) async {
    await tester.pumpWidget(
      IosAnimatedTheme(
        data: IosLightThemeData(),
        child: CupertinoApp(
          home: MyCustomWidget(
            title: 'Title',
            subtitle: null,
          ),
        ),
      ),
    );

    expect(find.text('Title'), findsOneWidget);
  });
}
```

## Quality Checklist

Before committing your widget:

- [ ] Widget file named with `_widget.dart` suffix
- [ ] Class named with `Widget` suffix
- [ ] Exported in `/lib/src/widgets/exports.dart`
- [ ] Uses `IosTheme.of(context)` for all visual properties
- [ ] NO hardcoded colors (uses theme colors)
- [ ] NO hardcoded text styles (uses theme typography)
- [ ] Supports both light and dark modes
- [ ] Follows Apple HIG spacing (8pt, 16pt, 24pt, 32pt)
- [ ] Follows Apple HIG sizing (min 44pt touch targets)
- [ ] Uses sealed classes for variants (if applicable)
- [ ] Includes dartdoc comments
- [ ] Has example usage in comments
- [ ] Created unit tests
- [ ] Tested in light mode
- [ ] Tested in dark mode
- [ ] Tested with different text scales
- [ ] Uses const constructors where possible
- [ ] Disposes controllers properly (if stateful)
- [ ] Added to example app

## Common Mistakes to Avoid

### ❌ Don't Hardcode Colors

```dart
// ❌ Bad
Container(
  color: Color(0xFF007AFF),
  child: child,
)

// ✅ Good
Container(
  color: theme.defaultColors.systemBlue,
  child: child,
)
```

### ❌ Don't Hardcode Text Styles

```dart
// ❌ Bad
Text(
  'Hello',
  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
)

// ✅ Good
Text(
  'Hello',
  style: theme.typography.bodyRegular,
)
```

### ❌ Don't Ignore Dark Mode

```dart
// ❌ Bad - only works in light mode
Container(
  color: theme.defaultSystemBackgroundsColors.primaryLight,
  child: child,
)

// ✅ Good - adapts to theme
Container(
  color: switch (theme) {
    IosLightThemeData() => theme.defaultSystemBackgroundsColors.primaryLight,
    IosDarkThemeData() => theme.defaultSystemBackgroundsColors.primaryDarkElevated,
  },
  child: child,
)
```

### ❌ Don't Use Material Widgets

```dart
// ❌ Bad
import 'package:flutter/material.dart';

Scaffold(
  appBar: AppBar(title: Text('Title')),
  body: child,
)

// ✅ Good
import 'package:flutter/cupertino.dart';

ScaffoldWidget(
  navigationBar: CupertinoNavigatorBarWidget(
    title: 'Title',
  ),
  child: child,
)
```

### ❌ Don't Create State Classes for Simple State

```dart
// ❌ Bad - too much boilerplate
class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool _isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return SwitchWidget(
      value: _isEnabled,
      onChanged: (value) => setState(() => _isEnabled = value),
    );
  }
}

// ✅ Good - use hooks
class MyWidget extends HookWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isEnabled = useState(false);

    return SwitchWidget(
      value: isEnabled.value,
      onChanged: (value) => isEnabled.value = value,
    );
  }
}
```

## Example: Creating a Card Widget

Complete example from start to finish:

### 1. Create File
`/lib/src/widgets/custom_card_widget.dart`

### 2. Write Widget
```dart
import 'package:flutter/cupertino.dart';
import '../../ios_design_system.dart';

/// iOS-style card widget with rounded corners and shadow.
///
/// Displays content in a card format with automatic theme adaptation.
///
/// ## Example
///
/// ```dart
/// CustomCardWidget(
///   title: 'Card Title',
///   description: 'Card description text',
///   icon: CupertinoIcons.star,
///   onPressed: () {},
/// )
/// ```
class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    required this.title,
    this.description,
    this.icon,
    this.onPressed,
    super.key,
  });

  final String title;
  final String? description;
  final IconData? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);

    return CupertinoButtonWidget(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: switch (theme) {
            IosLightThemeData() =>
              theme.defaultSystemBackgroundsColors.secondaryLight,
            IosDarkThemeData() =>
              theme.defaultSystemBackgroundsColors.secondaryDarkElevated,
          },
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            if (icon != null) ...[
              IconWidget.background(
                iconData: icon!,
                backgroundColorCallback: (theme) =>
                  theme.defaultColors.systemBlue,
              ),
              const SizedBox(width: 16),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.typography.bodyBold.copyWith(
                      color: theme.defaultLabelColors.primary,
                    ),
                  ),
                  if (description != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      description!,
                      style: theme.typography.caption1Regular.copyWith(
                        color: theme.defaultLabelColors.secondary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (onPressed != null)
              Icon(
                CupertinoIcons.chevron_right,
                color: theme.defaultLabelColors.tertiary,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
```

### 3. Export Widget
Add to `/lib/src/widgets/exports.dart`:
```dart
export 'custom_card_widget.dart';
```

### 4. Create Test
```dart
// test/widgets/custom_card_widget_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:ios_design_system/ios_design_system.dart';

void main() {
  testWidgets('CustomCardWidget displays title', (tester) async {
    await tester.pumpWidget(
      IosAnimatedTheme(
        data: IosLightThemeData(),
        child: CupertinoApp(
          home: CustomCardWidget(
            title: 'Test Card',
          ),
        ),
      ),
    );

    expect(find.text('Test Card'), findsOneWidget);
  });
}
```

### 5. Add to Example App
```dart
// example/lib/main.dart
CustomCardWidget(
  title: 'Example Card',
  description: 'This is a card widget',
  icon: CupertinoIcons.star,
  onPressed: () {},
)
```

## Quick Reference

### Must Do
- ✅ Use `IosTheme.of(context)`
- ✅ Test light AND dark modes
- ✅ Follow Apple HIG spacing
- ✅ Use const constructors
- ✅ Export in exports.dart
- ✅ Add dartdoc comments

### Never Do
- ❌ Hardcode colors
- ❌ Hardcode text styles
- ❌ Use Material widgets
- ❌ Ignore dark mode
- ❌ Skip testing
- ❌ Forget to export
