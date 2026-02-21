---
description: "Icons, tags, titles, descriptions, dividers, and markdown rendering widgets"
alwaysApply: false
---

# Display Widgets Guide

Complete reference for display and presentation widgets in the iOS Design System.

## Overview

Display widgets handle visual presentation of content including icons, tags, titles, descriptions, dividers, and markdown rendering. All widgets automatically adapt to theme changes.

---

## IconWidget

iOS-style icons with background containers and styling variants.

### File Location
`/lib/src/widgets/icon_widget.dart`

### Variants

1. **background** - Icon with colored rounded background
2. **transparentBackground** - Icon without background
3. **slideAction** - Icon for swipe actions

### Constructors

```dart
// Icon with background (7pt radius)
IconWidget.background({
  required IconData iconData,
  double iconSize = 20,
  Color Function(IosThemeData)? backgroundColorCallback,
  Color Function(IosThemeData)? iconColorCallback,
  BorderRadiusGeometry? borderRadius,
  EdgeInsetsGeometry? padding,
  Key? key,
})

// Icon without background
IconWidget.transparentBackground({
  required IconData iconData,
  double iconSize = 26,
  Color Function(IosThemeData)? iconColorCallback,
  EdgeInsetsGeometry? padding,
  Key? key,
})

// Icon for slide actions
IconWidget.slideAction({
  required IconData iconData,
  double iconSize = 20,
  Color Function(IosThemeData)? backgroundColorCallback,
  Color Function(IosThemeData)? iconColorCallback,
  BorderRadiusGeometry? borderRadius,
  EdgeInsetsGeometry? padding,
  Key? key,
})
```

### Default Styling

**background:**
- Icon Size: 20pt
- Icon Color: `systemWhite`
- Background: `systemBlue`
- Border Radius: 7pt
- Padding: 5pt all sides

**transparentBackground:**
- Icon Size: 26pt
- Icon Color: `systemBlue`
- No background
- No padding

**slideAction:**
- Icon Size: 20pt
- Icon Color: `systemWhite`
- Background: `systemGray01`
- Padding: h:26pt, v:12pt

### Example Usage

```dart
// Standard icon with blue background
IconWidget.background(
  iconData: CupertinoIcons.person,
)

// Custom color background
IconWidget.background(
  iconData: CupertinoIcons.bell,
  backgroundColorCallback: (theme) => theme.defaultColors.systemRed,
  iconColorCallback: (theme) => theme.defaultColors.systemWhite,
)

// Icon in a row
RowWidget.standard(
  title: 'Notifications',
  description: null,
  leftWidget: IconWidget.background(
    iconData: CupertinoIcons.bell,
    backgroundColorCallback: (theme) => theme.defaultColors.systemRed,
  ),
  rightWidget: const Icon(CupertinoIcons.chevron_right),
  displayDivider: true,
  onPressed: () {},
  onLongPress: null,
  decorationCallback: null,
)

// Transparent icon
IconWidget.transparentBackground(
  iconData: CupertinoIcons.star,
  iconColorCallback: (theme) => theme.defaultColors.systemYellow,
)

// Custom size and radius
IconWidget.background(
  iconData: CupertinoIcons.heart_fill,
  iconSize: 24,
  backgroundColorCallback: (theme) => theme.defaultColors.systemPink,
  borderRadius: BorderRadius.circular(12),
  padding: const EdgeInsets.all(8),
)

// Multiple icons in a row
Row(
  children: [
    IconWidget.background(iconData: CupertinoIcons.phone),
    const SizedBox(width: 8),
    IconWidget.background(
      iconData: CupertinoIcons.envelope,
      backgroundColorCallback: (theme) => theme.defaultColors.systemGreen,
    ),
    const SizedBox(width: 8),
    IconWidget.background(
      iconData: CupertinoIcons.videocam,
      backgroundColorCallback: (theme) => theme.defaultColors.systemOrange,
    ),
  ],
)
```

### Common Icon Colors

```dart
// System colors for icons
backgroundColorCallback: (theme) => theme.defaultColors.systemRed,
backgroundColorCallback: (theme) => theme.defaultColors.systemOrange,
backgroundColorCallback: (theme) => theme.defaultColors.systemYellow,
backgroundColorCallback: (theme) => theme.defaultColors.systemGreen,
backgroundColorCallback: (theme) => theme.defaultColors.systemTeal,
backgroundColorCallback: (theme) => theme.defaultColors.systemBlue,
backgroundColorCallback: (theme) => theme.defaultColors.systemIndigo,
backgroundColorCallback: (theme) => theme.defaultColors.systemPurple,
backgroundColorCallback: (theme) => theme.defaultColors.systemPink,
```

---

## TagWidget

iOS-style tag/chip with selection state and optional blur effect.

### File Location
`/lib/src/widgets/tag_widget.dart`

### Key Features
- Selection state with visual feedback
- X icon when selected
- Blur effect support
- Rounded pill shape
- Animated selection changes

### Constructor

```dart
TagWidget({
  required String label,
  required bool selected,
  required void Function()? onPressed,
  TagImageFilter imageFilter = TagImageFilter.disabled,
  Key? key,
})
```

### Properties

| Property | Type | Description |
|----------|------|-------------|
| `label` | `String` | Tag text |
| `selected` | `bool` | Selection state |
| `onPressed` | `VoidCallback?` | Tap handler |
| `imageFilter` | `TagImageFilter` | Enable blur effect |

### Styling

**Selected:**
- Background: `systemBlue`
- Text: `systemWhite`
- Icon: X mark (14pt)

**Unselected:**
- Background: Transparent
- Border: `systemColoursSeparatorColors.nonOpaque`
- Text: `systemBlue`

### Example Usage

```dart
// Basic tag
TagWidget(
  label: 'sports',
  selected: true,
  onPressed: () {},
)

// Tag row
Row(
  children: [
    TagWidget(
      label: 'games',
      selected: true,
      onPressed: () {
        setState(() {
          _selectedTags.remove('games');
        });
      },
    ),
    const SizedBox(width: 4),
    TagWidget(
      label: 'puzzle',
      selected: false,
      onPressed: () {
        setState(() {
          _selectedTags.add('puzzle');
        });
      },
    ),
    const SizedBox(width: 4),
    TagWidget(
      label: 'brain',
      selected: false,
      onPressed: () {
        setState(() {
          _selectedTags.add('brain');
        });
      },
    ),
  ],
)

// Tags with blur (in toolbar)
ToolBarWidget(
  imageFilter: ToolBarImageFilter.enabled,
  child: Wrap(
    spacing: 4,
    runSpacing: 4,
    children: _allTags.map((tag) {
      return TagWidget(
        label: tag,
        selected: _selectedTags.contains(tag),
        onPressed: () {
          setState(() {
            if (_selectedTags.contains(tag)) {
              _selectedTags.remove(tag);
            } else {
              _selectedTags.add(tag);
            }
          });
        },
        imageFilter: TagImageFilter.enabled,
      );
    }).toList(),
  ),
)

// Multi-select tag system
class TagSelector extends StatefulWidget {
  final List<String> allTags;
  final Function(Set<String>) onChanged;

  const TagSelector({
    required this.allTags,
    required this.onChanged,
  });

  @override
  State<TagSelector> createState() => _TagSelectorState();
}

class _TagSelectorState extends State<TagSelector> {
  final Set<String> _selected = {};

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: widget.allTags.map((tag) {
        return TagWidget(
          label: tag,
          selected: _selected.contains(tag),
          onPressed: () {
            setState(() {
              if (_selected.contains(tag)) {
                _selected.remove(tag);
              } else {
                _selected.add(tag);
              }
            });
            widget.onChanged(_selected);
          },
        );
      }).toList(),
    );
  }
}
```

---

## TitleWidget

Section header text with two size options.

### File Location
`/lib/src/widgets/title_widget.dart`

### Constructor

```dart
TitleWidget({
  required String text,
  required TitleSize size,
  EdgeInsetsGeometry? padding,
  Key? key,
})
```

### Size Options

```dart
enum TitleSize {
  small,   // Caption style for table headers
  large,   // Title3 bold style for main sections
}
```

### Default Styling

**small:**
- Typography: `caption1Regular`
- Color: `defaultLabelColors.secondary`
- Padding: h:16pt, b:8pt

**large:**
- Typography: `title3Bold`
- Color: `defaultLabelColors.primary`
- Padding: h:16pt, b:8pt

### Example Usage

```dart
// Small title for table header
const TitleWidget(
  text: 'ACCOUNT SETTINGS',
  size: TitleSize.small,
)

// Large title for main sections
const TitleWidget(
  text: 'Profile',
  size: TitleSize.large,
)

// Custom padding
const TitleWidget(
  text: 'NOTIFICATIONS',
  size: TitleSize.small,
  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
)

// In grouped table
GroupedTableWidget.rounded(
  title: const TitleWidget(
    text: 'PERSONAL INFO',
    size: TitleSize.small,
  ),
  rows: [/* rows */],
  description: null,
)
```

---

## DescriptionWidget

Secondary text for explanations and help text.

### File Location
`/lib/src/widgets/description_widget.dart`

### Constructor

```dart
DescriptionWidget({
  required String text,
  EdgeInsetsGeometry? padding,
  Key? key,
})
```

### Default Styling

- Typography: `caption1Regular`
- Color: `defaultLabelColors.secondary`
- Padding: h:16pt, t:8pt
- Text Align: start

### Example Usage

```dart
// Basic description
const DescriptionWidget(
  text: 'This information is used to personalize your experience.',
)

// In grouped table
GroupedTableWidget.rounded(
  title: const TitleWidget(
    text: 'PRIVACY',
    size: TitleSize.small,
  ),
  rows: [/* rows */],
  description: const DescriptionWidget(
    text: 'Your data is encrypted and never shared with third parties.',
  ),
)

// Long description
const DescriptionWidget(
  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
        'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
)

// Custom padding
const DescriptionWidget(
  text: 'Note: Changes take effect immediately.',
  padding: EdgeInsets.all(24),
)
```

---

## DividerWidget

Horizontal line separator.

### File Location
`/lib/src/widgets/divider_widget.dart`

### Constructors

```dart
// Standard divider
const DividerWidget({
  double? height,
  Color? Function(IosThemeData)? colorCallback,
  Key? key,
})

// Apple Pay styled divider
const DividerWidget.applePay

// Stocks styled divider
const DividerWidget.stocks
```

### Default Styling

- Height: 1pt
- Color: `systemColoursSeparatorColors.nonOpaque`

### Example Usage

```dart
// Standard divider
const DividerWidget()

// Between rows in table
GroupedTableWidget.rounded(
  title: null,
  rows: [
    const CupertinoTextFieldWidget(
      placeholder: 'First Name',
    ),
    const DividerWidget(),
    const CupertinoTextFieldWidget(
      placeholder: 'Last Name',
    ),
  ],
  description: null,
)

// Custom height
const DividerWidget(height: 2)

// Custom color
DividerWidget(
  colorCallback: (theme) => theme.defaultColors.systemGray03,
)

// Apple Pay divider
const DividerWidget.applePay

// In column layout
Column(
  children: [
    Text('Section 1'),
    const DividerWidget(),
    Text('Section 2'),
    const DividerWidget(),
    Text('Section 3'),
  ],
)
```

---

## MarkdownWidget

Render markdown content with iOS styling.

### File Location
`/lib/src/widgets/markdown_widget.dart`

### Key Features
- Full markdown support
- Syntax highlighting
- LaTeX rendering
- Custom link handling
- Theme-aware styling

### Constructor

```dart
MarkdownWidget({
  required String text,
  TextAlign? textAlign = TextAlign.justify,
  TextScaler? textScaler,
  TextDirection? textDirection,
  Color? highlightColor,
  TextStyle? h1,
  TextStyle? h2,
  TextStyle? h3,
  TextStyle? h4,
  TextStyle? h5,
  TextStyle? h6,
  double? hrLineThickness,
  Color? hrLineColor,
  Color? linkColor,
  Color? linkHoverColor,
  TextStyle? style,
  Widget Function(String, String?)? linkBuilder,
  Widget Function(String, String?)? imageBuilder,
  Widget Function(String)? sourceTagBuilder,
  Widget Function(String)? highlightBuilder,
  void Function(String)? onLinkTab,
  bool Function(String)? latexWorkaround,
  Widget Function(String)? latexBuilder,
  Key? key,
})
```

### Example Usage

```dart
// Basic markdown
const MarkdownWidget(
  text: '''
# Heading 1
## Heading 2

This is **bold** and this is *italic*.

- Item 1
- Item 2
- Item 3

[Link](https://example.com)
''',
)

// Code example
const MarkdownWidget(
  text: '''
```dart
void main() {
  print('Hello, World!');
}
```
''',
)

// In a scrollable view
SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: MarkdownWidget(
      text: _markdownContent,
      onLinkTab: (url) {
        print('Link tapped: $url');
      },
    ),
  ),
)

// Custom styling
MarkdownWidget(
  text: _content,
  h1: theme.typography.title1Bold,
  h2: theme.typography.title2Bold,
  style: theme.typography.bodyRegular,
  linkColor: theme.defaultColors.systemBlue,
)
```

---

## Common Display Patterns

### Contact List Item

```dart
RowWidget.standard(
  title: 'John Doe',
  description: 'john.doe@example.com',
  leftWidget: IconWidget.background(
    iconData: CupertinoIcons.person_circle_fill,
    backgroundColorCallback: (theme) => theme.defaultColors.systemGreen,
  ),
  rightWidget: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      IconWidget.transparentBackground(
        iconData: CupertinoIcons.phone,
        iconSize: 20,
      ),
      const SizedBox(width: 12),
      IconWidget.transparentBackground(
        iconData: CupertinoIcons.envelope,
        iconSize: 20,
      ),
    ],
  ),
  displayDivider: true,
  onPressed: () {},
  onLongPress: null,
  decorationCallback: null,
)
```

### Settings Section with Icon

```dart
GroupedTableWidget.rounded(
  title: const TitleWidget(
    text: 'ACCOUNT',
    size: TitleSize.small,
  ),
  rows: [
    RowWidget.standard(
      title: 'Profile',
      description: 'Edit your personal information',
      leftWidget: IconWidget.background(
        iconData: CupertinoIcons.person,
        backgroundColorCallback: (theme) => theme.defaultColors.systemBlue,
      ),
      rightWidget: const Icon(CupertinoIcons.chevron_right),
      displayDivider: true,
      onPressed: () {},
      onLongPress: null,
      decorationCallback: null,
    ),
    RowWidget.standard(
      title: 'Privacy',
      description: 'Manage your privacy settings',
      leftWidget: IconWidget.background(
        iconData: CupertinoIcons.lock_shield,
        backgroundColorCallback: (theme) => theme.defaultColors.systemGreen,
      ),
      rightWidget: const Icon(CupertinoIcons.chevron_right),
      displayDivider: true,
      onPressed: () {},
      onLongPress: null,
      decorationCallback: null,
    ),
    RowWidget.standard(
      title: 'Security',
      description: 'Two-factor authentication and more',
      leftWidget: IconWidget.background(
        iconData: CupertinoIcons.checkmark_shield,
        backgroundColorCallback: (theme) => theme.defaultColors.systemOrange,
      ),
      rightWidget: const Icon(CupertinoIcons.chevron_right),
      displayDivider: false,
      onPressed: () {},
      onLongPress: null,
      decorationCallback: null,
    ),
  ],
  description: null,
)
```

### Tag Filter Bar

```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Padding(
      padding: EdgeInsets.all(16),
      child: TitleWidget(
        text: 'Filter by Category',
        size: TitleSize.large,
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 4,
        runSpacing: 4,
        children: [
          TagWidget(
            label: 'All',
            selected: _selectedCategory == 'All',
            onPressed: () {
              setState(() => _selectedCategory = 'All');
            },
          ),
          TagWidget(
            label: 'Sports',
            selected: _selectedCategory == 'Sports',
            onPressed: () {
              setState(() => _selectedCategory = 'Sports');
            },
          ),
          TagWidget(
            label: 'News',
            selected: _selectedCategory == 'News',
            onPressed: () {
              setState(() => _selectedCategory = 'News');
            },
          ),
        ],
      ),
    ),
  ],
)
```

### Help/Documentation Screen

```dart
ScaffoldWidget(
  navigationBar: CupertinoNavigatorBarWidget(
    title: 'Help',
    imageFilter: NavigatorBarImageFilter.enabled,
    leading: null,
    trailing: null,
  ),
  toolBar: null,
  child: CupertinoScrollbar(
    child: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: MarkdownWidget(
            text: _helpContent,
            onLinkTab: (url) async {
              // Open URL
            },
          ),
        ),
      ),
    ),
  ),
)
```

---

## Best Practices

1. **Use IconWidget.background** for list items and settings
2. **Use IconWidget.transparentBackground** for navigation and actions
3. **Keep tag labels short** (1-2 words)
4. **Use TitleSize.small** for grouped table headers
5. **Use TitleSize.large** for main screen sections
6. **Add descriptions** to explain complex settings
7. **Use consistent icon colors** for similar actions
8. **Wrap tags** properly with 4pt spacing
9. **Use DividerWidget** between form fields in tables
10. **Test markdown content** on both light and dark themes

---

## Troubleshooting

### Icon not visible
- Check iconData is valid CupertinoIcons
- Verify color callbacks are returning visible colors
- Ensure icon is not clipped by parent container

### Tags not wrapping
- Use Wrap widget instead of Row
- Set proper spacing and runSpacing

### Markdown not rendering
- Verify text string is properly formatted
- Check for escaped characters
- Ensure gpt_markdown package is imported

### Divider not showing
- Check height is not 0
- Verify color is not transparent
- Ensure divider has parent container

### Title text cut off
- Use Expanded or Flexible parent
- Check padding doesn't exceed container width
- Verify text overflow is set properly
