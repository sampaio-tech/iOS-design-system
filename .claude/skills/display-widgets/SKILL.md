---
name: display-widgets
description: Icons, tags, titles, descriptions, dividers, and markdown rendering for iOS Design System
---

## Display Widgets Reference

Visual presentation widgets with automatic theme adaptation.

## IconWidget

iOS-style icons with background containers.

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

// Transparent icon (no background)
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

// Slide action icon
IconWidget.slideAction(
  iconData: CupertinoIcons.trash,
  backgroundColorCallback: (theme) => theme.defaultColors.systemRed,
)
```

**Default Styling:**
- **background**: Icon size 20pt, radius 7pt, padding 5pt
- **transparentBackground**: Icon size 26pt, no background
- **slideAction**: Icon size 20pt, padding h:26pt v:12pt

### Common Icon Colors
```dart
// By function
Messages: systemGreen
Mail: systemBlue
Phone: systemGreen
Calendar: systemRed
Photos: systemPink
Settings: systemGray
Health: systemRed
Wallet: systemBlue
```

## TagWidget

iOS-style tag/chip with selection state.

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
```

**Styling:**
- **Selected**: Blue background, white text, X icon
- **Unselected**: Transparent background, border, blue text
- **Border radius**: 50pt (pill shape)

### Multi-Select Pattern with Hooks
```dart
class TagSelector extends HookWidget {
  final List<String> allTags;
  final Function(Set<String>) onChanged;

  const TagSelector({
    required this.allTags,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final selected = useState<Set<String>>({});

    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: allTags.map((tag) {
        return TagWidget(
          label: tag,
          selected: selected.value.contains(tag),
          onPressed: () {
            final newSelected = Set<String>.from(selected.value);
            if (newSelected.contains(tag)) {
              newSelected.remove(tag);
            } else {
              newSelected.add(tag);
            }
            selected.value = newSelected;
            onChanged(newSelected);
          },
        );
      }).toList(),
    );
  }
}
```

## TitleWidget

Section header text with two size options.

```dart
// Small title for table headers
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

**Default Styling:**
- **small**: `caption1Regular`, secondary label color, padding h:16pt b:8pt
- **large**: `title3Bold`, primary label color, padding h:16pt b:8pt

## DescriptionWidget

Secondary text for explanations and help text.

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

**Default Styling:**
- Typography: `caption1Regular`
- Color: secondary label color
- Padding: h:16pt t:8pt
- Text align: start

## DividerWidget

Horizontal line separator.

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

// Stocks divider
const DividerWidget.stocks

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

**Default Styling:**
- Height: 1pt
- Color: `systemColoursSeparatorColors.nonOpaque`

## MarkdownWidget

Render markdown content with iOS styling.

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

// In scrollable view
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

**Features:**
- Full markdown support
- Syntax highlighting
- LaTeX rendering
- Custom link handling
- Theme-aware styling

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

### Settings Section with Icons
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

## Best Practices

1. **Use IconWidget.background** for list items and settings
2. **Use IconWidget.transparentBackground** for navigation and actions
3. **Keep tag labels short** (1-2 words)
4. **Use TitleSize.small** for grouped table headers
5. **Use TitleSize.large** for main screen sections
6. **Add descriptions** to explain complex settings
7. **Use consistent icon colors** for similar actions
8. **Wrap tags properly** with 4pt spacing
9. **Use DividerWidget** between form fields in tables
10. **Test markdown content** on both light and dark themes

## Icon Color Reference

```dart
// System colors for common icons
Messages/Phone: systemGreen
Mail/Browser: systemBlue
Calendar/Health: systemRed
Photos: systemPink
Camera/Settings: systemGray
Maps: systemTeal
Wallet: systemIndigo
```

## File Locations

- IconWidget: `/lib/src/widgets/icon_widget.dart`
- TagWidget: `/lib/src/widgets/tag_widget.dart`
- TitleWidget: `/lib/src/widgets/title_widget.dart`
- DescriptionWidget: `/lib/src/widgets/description_widget.dart`
- DividerWidget: `/lib/src/widgets/divider_widget.dart`
- MarkdownWidget: `/lib/src/widgets/markdown_widget.dart`
