---
description: "Text fields, switches, pickers, date pickers, and form validation patterns"
alwaysApply: false
---

# Form Widgets Guide

Complete reference for form input widgets in the iOS Design System.

## Overview

Form widgets provide iOS-style input controls including text fields, search fields, pickers, switches, and date selectors. All widgets automatically adapt to light and dark themes.

---

## CupertinoTextFieldWidget

iOS-style text input field with automatic clear button and theming.

### File Location
`/lib/src/widgets/cupertino_text_field_widget.dart`

### Key Features
- Automatic clear button in editing mode
- Theme-aware colors and typography
- Blur/transparent background support
- Full keyboard and text input control
- Custom decorations and styling

### Constructor

```dart
CupertinoTextFieldWidget({
  String? placeholder,
  TextEditingController? controller,
  FocusNode? focusNode,
  UndoHistoryController? undoController,
  TextInputType? keyboardType,
  TextInputAction? textInputAction,
  TextCapitalization textCapitalization = TextCapitalization.none,
  TextAlign textAlign = TextAlign.start,
  // ... many more properties
  EdgeInsets padding = const EdgeInsets.only(left: 16, top: 11, bottom: 11),
  OverlayVisibilityMode suffixMode = OverlayVisibilityMode.editing,
  Color? backgroundColor,
  BoxDecoration? Function(BoxDecoration?)? decorationBuilder,
  Color? cursorColor,
  Color? Function(IosThemeData)? selectionColor,
  Key? key,
})
```

### Common Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `placeholder` | `String?` | null | Hint text |
| `controller` | `TextEditingController?` | Auto-created | Text controller |
| `keyboardType` | `TextInputType?` | null | Keyboard type |
| `maxLines` | `int?` | 1 | Maximum lines |
| `obscureText` | `bool` | false | Password mode |
| `padding` | `EdgeInsets` | `l:16,t:11,b:11` | Internal padding |
| `suffixMode` | `OverlayVisibilityMode` | `editing` | When to show clear button |
| `backgroundColor` | `Color?` | Theme default | Background color |

### Background Colors

**Light Theme:**
- `defaultSystemBackgroundsColors.primaryLight`

**Dark Theme:**
- `defaultSystemBackgroundsColors.primaryDarkElevated`

### Typography

**Placeholder:**
- Style: `typography.bodyRegular`
- Color: `defaultLabelColors.secondary`

**Text:**
- Style: `typography.bodyRegular`
- Color: `defaultLabelColors.primary`

### Example Usage

```dart
// Basic text field
const CupertinoTextFieldWidget(
  placeholder: 'Enter your name',
)

// Text field with controller
final nameController = TextEditingController();

CupertinoTextFieldWidget(
  placeholder: 'Name',
  controller: nameController,
  onChanged: (value) {
    print('Name changed: $value');
  },
)

// Email field
const CupertinoTextFieldWidget(
  placeholder: 'Email',
  keyboardType: TextInputType.emailAddress,
  textInputAction: TextInputAction.next,
)

// Password field
const CupertinoTextFieldWidget(
  placeholder: 'Password',
  obscureText: true,
  keyboardType: TextInputType.visiblePassword,
)

// Multiline text field
const CupertinoTextFieldWidget(
  placeholder: 'Description',
  maxLines: 5,
  minLines: 3,
  textAlign: TextAlign.start,
)

// Text field in grouped table
GroupedTableWidget.rounded(
  title: const TitleWidget(
    text: 'PROFILE',
    size: TitleSize.small,
  ),
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

// Custom background color
CupertinoTextFieldWidget(
  placeholder: 'Search',
  backgroundColor: Colors.transparent,
  decorationBuilder: (decoration) => BoxDecoration(
    color: Colors.transparent,
    border: Border.all(
      color: theme.systemColoursSeparatorColors.nonOpaque,
    ),
    borderRadius: BorderRadius.circular(8),
  ),
)
```

### Form Validation Pattern

```dart
class FormScreen extends StatefulWidget {
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _emailError;
  String? _passwordError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validate() {
    setState(() {
      _emailError = _emailController.text.contains('@')
        ? null
        : 'Invalid email';
      _passwordError = _passwordController.text.length >= 8
        ? null
        : 'Password must be 8+ characters';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GroupedTableWidget.rounded(
          title: const TitleWidget(
            text: 'CREDENTIALS',
            size: TitleSize.small,
          ),
          rows: [
            CupertinoTextFieldWidget(
              placeholder: 'Email',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const DividerWidget(),
            CupertinoTextFieldWidget(
              placeholder: 'Password',
              controller: _passwordController,
              obscureText: true,
            ),
          ],
          description: _emailError != null || _passwordError != null
            ? DescriptionWidget(
                text: _emailError ?? _passwordError ?? '',
              )
            : null,
        ),
      ],
    );
  }
}
```

---

## CupertinoSearchTextFieldWidget

iOS-style search field with magnifying glass icon and clear button.

### File Location
`/lib/src/widgets/cupertino_search_text_field_widget.dart`

### Key Features
- Built-in search icon
- Automatic clear button
- Rounded corners (10pt radius)
- Tertiary fill color background

### Constructor

```dart
CupertinoSearchTextFieldWidget({
  TextEditingController? controller,
  void Function(String)? onChanged,
  void Function(String)? onSubmitted,
  void Function()? onTap,
  String? placeholder,
  BorderRadius? borderRadius,
  void Function()? onSuffixTap,
  String? restorationId,
  FocusNode? focusNode,
  SmartQuotesType? smartQuotesType,
  SmartDashesType? smartDashesType,
  OverlayVisibilityMode suffixMode = OverlayVisibilityMode.editing,
  EdgeInsets padding = const EdgeInsets.only(top: 7, bottom: 7),
  TextStyle? placeholderStyle,
  TextStyle? style,
  Color? backgroundColor,
  Key? key,
})
```

### Default Styling

- **Border Radius:** 10pt
- **Background:** `defaultFillColors.tertiary`
- **Icon Size:** 20pt (search), 18pt (clear)
- **Icon Color:** `defaultLabelColors.secondary`

### Example Usage

```dart
// Basic search field
const CupertinoSearchTextFieldWidget()

// Search with controller
final searchController = TextEditingController();

CupertinoSearchTextFieldWidget(
  controller: searchController,
  placeholder: 'Search contacts',
  onChanged: (value) {
    // Filter results
    print('Searching for: $value');
  },
  onSubmitted: (value) {
    // Perform search
    print('Search submitted: $value');
  },
)

// Search in modal sheet
ModalSheetWidget.showModalSheet(
  context: context,
  cupertinoSearchTextFieldWidget: CupertinoSearchTextFieldWidget(
    placeholder: 'Search',
    onChanged: (value) {
      // Update filtered list
    },
  ),
  title: ModalTitleWidget(
    title: 'Select Item',
    leftLabelButton: LabelButtonWidget.label(
      label: 'Cancel',
      onPressed: () => Navigator.pop(context),
    ),
    rightLabelButton: null,
  ),
  prompt: null,
)

// Search with custom clear action
CupertinoSearchTextFieldWidget(
  controller: searchController,
  onSuffixTap: () {
    searchController.clear();
    // Additional cleanup
  },
)
```

### Search Screen Pattern

```dart
class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  List<String> _filteredItems = [];
  List<String> _allItems = ['Apple', 'Banana', 'Cherry'];

  @override
  void initState() {
    super.initState();
    _filteredItems = _allItems;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredItems = _allItems;
      } else {
        _filteredItems = _allItems
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      navigationBar: CupertinoNavigatorBarWidget(
        title: 'Search',
        imageFilter: NavigatorBarImageFilter.enabled,
        leading: null,
        trailing: null,
      ),
      toolBar: null,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: CupertinoSearchTextFieldWidget(
              controller: _searchController,
              placeholder: 'Search items',
              onChanged: _filterItems,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                return RowWidget.standard(
                  title: _filteredItems[index],
                  description: null,
                  leftWidget: null,
                  rightWidget: null,
                  displayDivider: index < _filteredItems.length - 1,
                  onPressed: () {},
                  onLongPress: null,
                  decorationCallback: null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
```

---

## SwitchWidget

iOS-style toggle switch.

### File Location
`/lib/src/widgets/switch_widget.dart`

### Constructors

```dart
// Standard switch
SwitchWidget({
  required bool value,
  void Function(bool)? onChanged,
  Color Function(IosThemeData)? activeTrackColorCallback,
  Color Function(IosThemeData)? inactiveTrackColorCallback,
  Color Function(IosThemeData)? thumbColorCallback,
  Key? key,
})

// Stocks variant (green when on)
SwitchWidget.stocks({
  required bool value,
  void Function(bool)? onChanged,
  // ...
})
```

### Default Colors

- **Active Track:** `defaultColors.systemGreen`
- **Inactive Track:** `defaultFillColors.secondary`
- **Thumb:** `defaultColors.systemWhite`

### Example Usage

```dart
// Basic switch
SwitchWidget(
  value: true,
  onChanged: (value) {
    print('Switch toggled: $value');
  },
)

// Switch in row
RowWidget.standard(
  title: 'Notifications',
  description: null,
  leftWidget: null,
  rightWidget: SwitchWidget(
    value: _notificationsEnabled,
    onChanged: (value) {
      setState(() {
        _notificationsEnabled = value;
      });
    },
  ),
  displayDivider: false,
  onPressed: null,
  onLongPress: null,
  decorationCallback: null,
)

// Disabled switch
SwitchWidget(
  value: true,
  onChanged: null,  // Disabled
)

// Custom color switch
SwitchWidget(
  value: true,
  onChanged: (value) {},
  activeTrackColorCallback: (theme) => theme.defaultColors.systemBlue,
  thumbColorCallback: (theme) => theme.defaultColors.systemWhite,
)
```

---

## PickerButtonWidget

Button that displays selected picker value.

### File Location
`/lib/src/widgets/picker_button_widget.dart`

### Factory Constructor

```dart
PickerButtonWidget.dateTime({
  required DateTime dateTime,
  required DateFormat dateFormat,
  required VoidCallback? onPressed,
  Key? key,
})
```

### Example Usage

```dart
// Date picker button
PickerButtonWidget.dateTime(
  dateTime: DateTime(2020, 6, 20),
  dateFormat: DateFormat.yMMMMd('en_US'),  // "June 20, 2020"
  onPressed: () {
    // Show date picker
  },
)

// Time picker button
PickerButtonWidget.dateTime(
  dateTime: DateTime(2020, 6, 20, 13, 30),
  dateFormat: DateFormat.jm(),  // "1:30 PM"
  onPressed: () {
    // Show time picker
  },
)

// In a row
RowWidget.standard(
  title: 'Birthday',
  description: null,
  leftWidget: IconWidget.background(
    iconData: CupertinoIcons.calendar,
  ),
  rightWidget: PickerButtonWidget.dateTime(
    dateTime: _selectedDate,
    dateFormat: DateFormat.yMMMMd('en_US'),
    onPressed: () async {
      await CupertinoDatePickerWidget.show(
        context: context,
        mode: CupertinoDatePickerMode.date,
        initialDateTime: _selectedDate,
        onDateTimeChanged: (newDate) {
          setState(() {
            _selectedDate = newDate;
          });
        },
      );
    },
  ),
  displayDivider: false,
  onPressed: null,
  onLongPress: null,
  decorationCallback: null,
)
```

---

## CupertinoDatePickerWidget

Full-screen date/time picker with gradients.

### File Location
`/lib/src/widgets/cupertino_date_picker_widget.dart`

### Static Method

```dart
CupertinoDatePickerWidget.show({
  required BuildContext context,
  required void Function(DateTime) onDateTimeChanged,
  CupertinoDatePickerMode mode = CupertinoDatePickerMode.dateAndTime,
  DateTime? initialDateTime,
  DateTime? minimumDate,
  DateTime? maximumDate,
  int minimumYear = 1,
  int? maximumYear,
  int minuteInterval = 1,
  bool use24hFormat = false,
  DatePickerDateOrder? dateOrder,
  bool showDayOfWeek = false,
  bool barrierFilter = false,
  bool useRootNavigator = true,
  bool showGradient = true,
})
```

### Picker Modes

```dart
enum CupertinoDatePickerMode {
  time,           // Hours and minutes
  date,           // Month, day, year
  dateAndTime,    // All components
  monthYear,      // Month and year only
}
```

### Example Usage

```dart
// Date picker
await CupertinoDatePickerWidget.show(
  context: context,
  mode: CupertinoDatePickerMode.date,
  initialDateTime: DateTime.now(),
  minimumDate: DateTime(1900),
  maximumDate: DateTime.now(),
  onDateTimeChanged: (newDate) {
    print('Selected date: $newDate');
  },
)

// Time picker
await CupertinoDatePickerWidget.show(
  context: context,
  mode: CupertinoDatePickerMode.time,
  initialDateTime: DateTime.now(),
  use24hFormat: false,
  minuteInterval: 15,
  onDateTimeChanged: (newTime) {
    print('Selected time: $newTime');
  },
)

// Date and time picker
await CupertinoDatePickerWidget.show(
  context: context,
  mode: CupertinoDatePickerMode.dateAndTime,
  initialDateTime: DateTime.now(),
  minimumDate: DateTime.now(),
  showDayOfWeek: true,
  onDateTimeChanged: (newDateTime) {
    print('Selected: $newDateTime');
  },
)

// With blur barrier
await CupertinoDatePickerWidget.show(
  context: context,
  mode: CupertinoDatePickerMode.date,
  initialDateTime: DateTime.now(),
  barrierFilter: true,
  onDateTimeChanged: (newDate) {},
)
```

---

## CupertinoPickerWidget

Generic scrollable picker for custom options.

### File Location
`/lib/src/widgets/cupertino_picker_widget.dart`

### Static Method

```dart
CupertinoPickerWidget.show({
  required BuildContext context,
  required double itemExtent,
  required List<Widget> children,
  BoxConstraints? boxConstraints,
  void Function(int)? onSelectedItemChanged,
  bool useMagnifier = false,
  bool looping = false,
  double magnification = 1.0,
  double squeeze = 1.45,
  double diameterRatio = 1.07,
  double offAxisFraction = 0.0,
  bool barrierFilter = false,
  bool useRootNavigator = true,
  bool showGradient = true,
  int initialItem = 0,
})
```

### Example Usage

```dart
// Simple text picker
final options = ['Small', 'Medium', 'Large'];

await CupertinoPickerWidget.show(
  context: context,
  itemExtent: 40,
  initialItem: 1,
  children: options.map((option) {
    return Center(
      child: Text(
        option,
        style: theme.typography.bodyRegular,
      ),
    );
  }).toList(),
  onSelectedItemChanged: (index) {
    print('Selected: ${options[index]}');
  },
)

// Color picker
final colors = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.purple,
];

await CupertinoPickerWidget.show(
  context: context,
  itemExtent: 50,
  children: colors.map((color) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 100),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }).toList(),
  onSelectedItemChanged: (index) {
    print('Selected color index: $index');
  },
)

// With magnifier effect
await CupertinoPickerWidget.show(
  context: context,
  itemExtent: 40,
  useMagnifier: true,
  magnification: 1.2,
  children: List.generate(10, (i) {
    return Center(
      child: Text('Option ${i + 1}'),
    );
  }),
  onSelectedItemChanged: (index) {},
)
```

---

## Common Form Patterns

### Profile Form

```dart
Column(
  children: [
    const SizedBox(height: 24),
    GroupedTableWidget.rounded(
      title: const TitleWidget(
        text: 'NAME',
        size: TitleSize.small,
      ),
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
    ),
    const SizedBox(height: 24),
    GroupedTableWidget.rounded(
      title: const TitleWidget(
        text: 'CONTACT',
        size: TitleSize.small,
      ),
      rows: [
        const CupertinoTextFieldWidget(
          placeholder: 'Email',
          keyboardType: TextInputType.emailAddress,
        ),
        const DividerWidget(),
        const CupertinoTextFieldWidget(
          placeholder: 'Phone',
          keyboardType: TextInputType.phone,
        ),
      ],
      description: null,
    ),
  ],
)
```

### Settings Form

```dart
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
        value: _notifications,
        onChanged: (value) => setState(() => _notifications = value),
      ),
      displayDivider: true,
      onPressed: null,
      onLongPress: null,
      decorationCallback: null,
    ),
    RowWidget.standard(
      title: 'Sound',
      description: null,
      leftWidget: null,
      rightWidget: SwitchWidget(
        value: _sound,
        onChanged: (value) => setState(() => _sound = value),
      ),
      displayDivider: true,
      onPressed: null,
      onLongPress: null,
      decorationCallback: null,
    ),
    RowWidget.standard(
      title: 'Reminder Time',
      description: null,
      leftWidget: null,
      rightWidget: PickerButtonWidget.dateTime(
        dateTime: _reminderTime,
        dateFormat: DateFormat.jm(),
        onPressed: () {
          // Show time picker
        },
      ),
      displayDivider: false,
      onPressed: null,
      onLongPress: null,
      decorationCallback: null,
    ),
  ],
  description: const DescriptionWidget(
    text: 'Notification settings can be changed anytime.',
  ),
)
```

---

## Best Practices

1. **Always dispose controllers** in StatefulWidget dispose method
2. **Use const** for static placeholders
3. **Provide placeholder text** for all text fields
4. **Set appropriate keyboard types** for email, phone, etc.
5. **Use TextInputAction.next** to navigate between fields
6. **Wrap forms in SingleChildScrollView** to handle keyboard
7. **Show validation errors** in DescriptionWidget below tables
8. **Use null for onChanged** to make switches non-interactive
9. **Set initialDateTime** on pickers for better UX
10. **Group related form fields** in the same GroupedTableWidget

---

## Troubleshooting

### Clear button not showing
- Check suffixMode is set to OverlayVisibilityMode.editing
- Verify text field is focused and has text

### Keyboard not dismissing
- ScaffoldWidget handles this automatically
- Ensure you're using ScaffoldWidget as parent

### Picker not closing on selection
- CupertinoPickerWidget requires manual close
- Use Navigator.pop(context) when item is selected

### Text field background wrong color
- Check theme is properly wrapped in IosAnimatedTheme
- Verify backgroundColor is not overriding theme

### Switch not changing value
- Ensure onChanged callback updates state with setState
- Check if onChanged is null (makes switch disabled)
