---
description: "Project structure, core principles, and quick start guide for the iOS Design System"
alwaysApply: false
---

# Project Overview - iOS Design System

## What This Project Is

A **Flutter package** implementing a complete iOS-native design system that:
- Follows Apple's Human Interface Guidelines exactly
- Provides 35+ pre-built Cupertino widgets
- Uses a comprehensive theme system with 8+ color palettes
- Supports light and dark modes automatically
- Enables building Settings-style apps, sheets, forms, and more
- Uses SF Pro Text font throughout
- Never uses Material Design - pure iOS/Cupertino only

## Project Purpose

Build **extensible, editable widgets** that:
1. Follow Cupertino design patterns
2. Integrate with centralized theme system
3. Support both light and dark modes
4. Match pixel-perfect iOS native appearance
5. Are type-safe using sealed classes
6. Can be customized via callbacks and variants

## Technology Stack

- **Language**: Dart 3.7+
- **Framework**: Flutter (Cupertino widgets only)
- **Font**: SF Pro Text (4 weights: regular 400, medium 500, semibold 600, bold 700)
- **Architecture**: Sealed classes, InheritedWidget theme, Stateless widgets
- **Key Dependencies**:
  - `flutter_svg: ^2.0.17` - SVG support
  - `gpt_markdown: 1.0.19` - Markdown rendering
  - `flutter_math_fork: 0.7.4` - LaTeX math
  - `flutter_hooks: ^0.21.2` - Hook-based state
  - `intl: ^0.20.0` - Date formatting

## Directory Structure

```
ios_design_system/
├── lib/
│   ├── ios_design_system.dart        # Main export
│   └── src/
│       ├── exports.dart               # Internal barrel export
│       ├── assets/                    # Fonts and SVGs
│       │   ├── fonts/                 # SF Pro Text fonts
│       │   └── svg/                   # SVG icons
│       ├── assets_gen/                # Generated asset classes
│       │   ├── assets.gen.dart
│       │   └── fonts.gen.dart
│       ├── theme/                     # Theme system (800+ lines)
│       │   ├── exports.dart
│       │   ├── colors/                # 9 color palette files
│       │   │   ├── colors.dart        # Main export (part files)
│       │   │   ├── default.dart       # System colors
│       │   │   ├── system_colours.dart # Separators
│       │   │   ├── system_materials.dart # Material colors
│       │   │   ├── acessible.dart     # Accessible colors
│       │   │   ├── weather.dart       # Weather app theme
│       │   │   ├── stocks.dart        # Stocks app theme
│       │   │   ├── neutral_music.dart # Music app theme
│       │   │   ├── neutral_podcast.dart # Podcast theme
│       │   │   ├── app_store.dart     # App Store theme
│       │   │   └── books.dart         # Books theme
│       │   ├── typography/
│       │   │   └── typography.dart    # 22 text styles
│       │   ├── settings/
│       │   │   ├── theme.dart         # IosTheme, IosThemeData (486 lines)
│       │   │   └── constants.dart     # Animation constants
│       │   └── extra/
│       │       └── decorations.dart   # Decoration functions
│       └── widgets/                   # 35+ widget files
│           ├── exports.dart           # Widget barrel export
│           ├── button_widget.dart     # High-level button (455 lines)
│           ├── cupertino_button_widget.dart # Base interactive (359 lines)
│           ├── scaffold_widget.dart   # Screen scaffold
│           ├── grouped_table_widget.dart # Settings-style lists
│           ├── row_widget.dart        # List row component
│           ├── cupertino_sheet_widget.dart # Bottom sheets
│           ├── modal_sheet_widget.dart # Full modals
│           ├── cupertino_text_field_widget.dart # Text input
│           ├── cupertino_search_text_field_widget.dart # Search bar
│           ├── switch_widget.dart     # Toggle switch
│           ├── picker_button_widget.dart # Picker trigger
│           ├── cupertino_picker_widget.dart # Picker component
│           ├── cupertino_date_picker_widget.dart # Date picker
│           ├── icon_widget.dart       # Icon with background
│           ├── tag_widget.dart        # Filter chip
│           ├── title_widget.dart      # Section titles
│           ├── description_widget.dart # Helper text
│           ├── divider_widget.dart    # Separator
│           ├── markdown_widget.dart   # Markdown renderer
│           ├── [20+ more widgets]
│           ├── neutral_music/         # Music app widgets
│           │   ├── neutral_card_widget.dart
│           │   ├── neutral_pill_button_widget.dart
│           │   ├── neutral_circular_button_widget.dart
│           │   └── neutral_decorations_style.dart
│           └── app_store/             # App Store widgets
│               ├── app_store_pill_button_widget.dart
│               └── app_store_circular_button_widget.dart
├── example/                           # Example app
│   └── lib/
│       └── main.dart                  # Demo of all widgets
├── pubspec.yaml                       # Package config
├── analysis_options.yaml              # Lint rules
├── CLAUDE.md                          # Complete reference
├── README.md                          # Package readme
├── CHANGELOG.md                       # Version history
├── .cursor/                           # Cursor configuration
│   └── rules/                         # AI rules (you are here)
└── .claude/                           # Claude configuration
    └── skills/                        # Task-specific skills
```

## Core Principles (Non-Negotiable)

### 1. Apple HIG Compliance
Every widget must match iOS native behavior and appearance exactly:
- Correct spacing (8pt grid)
- Correct colors (semantic and system)
- Correct typography (SF Pro Text scale)
- Correct animations (timing, curves)
- Correct interactions (tap, long press, swipe)

Reference: https://developer.apple.com/design/human-interface-guidelines

### 2. Theme-Driven Design
All visual properties come from the centralized theme:
- Colors via `theme.defaultColors.*`, `theme.defaultLabelColors.*`, etc.
- Typography via `theme.typography.*`
- No hardcoded values allowed
- Light and dark modes handled automatically

### 3. Type Safety
Use sealed classes for variants:
- `ButtonColor` sealed class → `BlueButtonColor`, `RedButtonColor`, etc.
- `ButtonSize` sealed class → `SmallButtonSize`, `LargeButtonSize`, etc.
- Compile-time safety for all variants

### 4. Extensibility
Widgets are designed to be extended:
- Factory constructors for common variants
- Callback functions for dynamic behavior
- Custom variants via sealed class extension
- No private implementation details

### 5. Pure Cupertino
This is NOT a Material Design system:
- Never use `Colors.*` from Material
- Never use Material widgets
- Never use Material patterns
- Always use Cupertino equivalents

## Usage Pattern

### 1. Import Package
```dart
import 'package:ios_design_system/ios_design_system.dart';
```

### 2. Wrap App with Theme
```dart
void main() {
  runApp(
    IosAnimatedTheme(
      data: IosLightThemeData(), // or IosDarkThemeData()
      child: CupertinoApp(
        theme: CupertinoThemeData(brightness: Brightness.light),
        home: MyApp(),
      ),
    ),
  );
}
```

### 3. Access Theme in Widgets
```dart
@override
Widget build(BuildContext context) {
  final theme = IosTheme.of(context);

  return Container(
    color: theme.defaultColors.systemBlue,
    child: Text(
      'Hello',
      style: theme.typography.bodyRegular.copyWith(
        color: theme.defaultLabelColors.primary,
      ),
    ),
  );
}
```

## Key Files to Reference

When working on specific areas, reference these files:

**Theme System**:
- `/lib/src/theme/settings/theme.dart` - IosTheme implementation
- `/lib/src/theme/colors/default.dart` - System colors definition
- `/lib/src/theme/typography/typography.dart` - Text styles

**Button System**:
- `/lib/src/widgets/cupertino_button_widget.dart` - Base interactive widget
- `/lib/src/widgets/button_widget.dart` - High-level themed button

**Layout System**:
- `/lib/src/widgets/scaffold_widget.dart` - Screen structure
- `/lib/src/widgets/grouped_table_widget.dart` - Settings lists
- `/lib/src/widgets/row_widget.dart` - List rows

**Example Usage**:
- `/example/lib/main.dart` - Demonstrates all widgets

## Development Workflow

1. **Read existing patterns** before creating new code
2. **Use theme exclusively** for all visual properties
3. **Test both light and dark modes** before committing
4. **Follow Apple HIG** for spacing, sizing, behavior
5. **Export new widgets** in exports.dart
6. **Document usage** with dartdoc comments

## Common Tasks

- Create new widget → See `.claude/skills/create-themed-widget.md`
- Add button variant → See `.claude/skills/add-button-variant.md`
- Create list component → See `.claude/skills/create-list-component.md`
- Debug theme → See `.claude/skills/debug-theme-issues.md`
- Create modal → See `.claude/skills/create-modal-sheet.md`

## Quality Standards

Every contribution must:
- [ ] Use theme colors exclusively
- [ ] Use theme typography exclusively
- [ ] Support both light and dark modes
- [ ] Follow Apple HIG spacing/sizing
- [ ] Use sealed classes for variants
- [ ] Export in exports.dart
- [ ] Include dartdoc comments
- [ ] Be tested in example app

## Project Goals

This design system enables developers to:
1. Build iOS-looking apps faster
2. Maintain consistent design automatically
3. Support dark mode without extra work
4. Create Settings-style interfaces easily
5. Build forms, sheets, and modals quickly
6. Extend with custom variants safely

## NOT Goals

This project does NOT:
- Support Material Design
- Support web-specific patterns
- Support custom design systems outside iOS
- Provide cross-platform theming
- Include business logic or state management
