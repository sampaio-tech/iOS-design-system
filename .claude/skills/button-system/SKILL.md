---
name: button-system
description: Button widgets in iOS Design System - CupertinoButtonWidget and ButtonWidget with all variants
---

## Button System Architecture

Two-layer system:
1. **CupertinoButtonWidget** - Base interactive widget for all tappable elements
2. **ButtonWidget** - High-level themed button with automatic sizing and styling

## CupertinoButtonWidget (Base Layer)

Low-level widget providing:
- Opacity animation on press (default 0.8)
- Tap, long press, double tap, drag gestures
- Loading state with CupertinoActivityIndicator
- Auto focus management

### Basic Usage
```dart
CupertinoButtonWidget(
  onPressed: () {},
  color: theme.defaultColors.systemBlue,
  borderRadius: BorderRadius.circular(12),
  padding: EdgeInsets.all(16),
  child: Text('Button'),
)
```

### With Loading State
```dart
CupertinoButtonWidget(
  onPressed: isLoading ? null : () {},
  displayCupertinoActivityIndicator: isLoading,
  color: theme.defaultColors.systemBlue,
  child: Text('Submit'),
)
```

### With Gradient
```dart
CupertinoButtonWidget(
  onPressed: () {},
  backgroundGradient: LinearGradient(
    colors: [
      theme.defaultColors.systemPurple,
      theme.defaultColors.systemPink,
    ],
  ),
  child: Text('Premium'),
)
```

## ButtonWidget (High Layer)

High-level button with automatic theming.

### Label Button
```dart
ButtonWidget.label(
  size: const LargeButtonSize(),
  color: const BlueButtonColor(),
  label: 'Continue',
  leftIcon: CupertinoIcons.checkmark,
  onPressed: () {},
)
```

### Icon-Only Button
```dart
ButtonWidget.icon(
  size: const MediumButtonSize(),
  color: const GreyTransparentButtonColor(),
  leftIcon: CupertinoIcons.add,
  onPressed: () {},
)
```

## Button Sizes

### SmallButtonSize
- Min height: 28pt
- Border radius: 14pt
- Typography: subheadline (15pt)
- Use for: Secondary actions, compact UIs

### MediumButtonSize
- Min height: 34pt
- Border radius: 50pt (pill)
- Typography: body (17pt)
- Use for: Standard buttons, toolbars

### LargeButtonSize
- Min height: 50pt
- Border radius: 12pt
- Typography: body (17pt)
- Use for: Primary CTAs, main actions

### CustomButtonSize
Define your own dimensions:
```dart
const CustomButtonSize(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
  iconSize: 22,
  boxConstraints: BoxConstraints(minHeight: 56, minWidth: 56),
)
```

## Button Colors

### BlueButtonColor (Primary)
- Background: systemBlue (#007AFF → #0A84FF)
- Label: White
- Use for: Primary actions (Continue, Save, Submit)

### GreyTransparentButtonColor (Secondary)
- Background: Fill secondary (grey, adapts)
- Label: systemBlue
- Use for: Secondary actions (Cancel, Back)

### BlueTransparentButtonColor (Tertiary)
- Background: Blue tint (15% opacity)
- Label: systemBlue
- Use for: Tertiary actions (Learn More, Info)

### CustomButtonColor
```dart
class RedButtonColor extends ButtonColor {
  const RedButtonColor();

  @override
  Color? backgroundEnabled({required BuildContext context}) {
    final theme = IosTheme.of(context);
    return theme.defaultColors.systemRed;
  }

  @override
  Color labelEnabled({required BuildContext context}) {
    final theme = IosTheme.of(context);
    return theme.defaultColors.systemWhite;
  }
}
```

## Label Font Weights

### RegularLabelFontWeight
- Small: subheadlineRegular (400 weight)
- Others: bodyRegular (400 weight)

### BoldLabelFontWeight
- Small: subheadlineBold (600 weight)
- Others: bodyBold (600 weight)

## Common Patterns

### Primary Action
```dart
ButtonWidget.label(
  size: const LargeButtonSize(),
  color: const BlueButtonColor(),
  label: 'Continue',
  onPressed: () {},
)
```

### Secondary with Icon
```dart
ButtonWidget.label(
  size: const MediumButtonSize(),
  color: const GreyTransparentButtonColor(),
  label: 'Share',
  leftIcon: CupertinoIcons.share,
  onPressed: () {},
)
```

### Toolbar Icon Button
```dart
ButtonWidget.icon(
  size: const MediumButtonSize(),
  color: const GreyTransparentButtonColor(),
  leftIcon: CupertinoIcons.add,
  onPressed: () {},
)
```

### Loading Button
```dart
ButtonWidget.label(
  size: const LargeButtonSize(),
  color: const BlueButtonColor(),
  label: 'Processing',
  displayCupertinoActivityIndicator: isLoading,
  onPressed: isLoading ? null : () {},
)
```

### Destructive Action
```dart
ButtonWidget.label(
  size: const MediumButtonSize(),
  color: const CustomButtonColor(
    backgroundEnabled: theme.defaultColors.systemRed,
    labelEnabled: theme.defaultColors.systemWhite,
  ),
  label: 'Delete',
  leftIcon: CupertinoIcons.trash,
  onPressed: () {},
)
```

## Animation Constants

```dart
kAnimationInDuration           // 180ms
kAnimationOutDuration          // 120ms
kCupertinoButtonPressedOpacity // 0.8
```

## File Locations

- Base widget: `/lib/src/widgets/cupertino_button_widget.dart`
- High-level widget: `/lib/src/widgets/button_widget.dart`
