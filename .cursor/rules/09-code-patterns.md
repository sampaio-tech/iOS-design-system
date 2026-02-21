---
description: "Common patterns, recipes, troubleshooting, and anti-patterns for the design system"
alwaysApply: false
---

# Code Patterns & Best Practices

Common patterns, recipes, and troubleshooting guide for the iOS Design System.

## Project Setup

### Import Pattern

```dart
// Single import for entire design system
import 'package:ios_design_system/ios_design_system.dart';

// Also import Flutter/Cupertino as needed
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
```

### Theme Setup

```dart
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
        title: 'My App',
        theme: CupertinoThemeData(
          brightness: themeData.brightness,
        ),
        home: IosAnimatedTheme(
          data: themeData,
          child: const HomeScreen(),
        ),
      ),
    );
  }
}
```

---

## Screen Patterns

### Standard List Screen

```dart
class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      navigationBar: CupertinoNavigatorBarWidget(
        title: 'List',
        imageFilter: NavigatorBarImageFilter.enabled,
        leading: null,
        trailing: LabelButtonWidget.label(
          label: 'Add',
          iconRight: CupertinoIcons.add,
          onPressed: () {
            // Navigate to add screen
          },
        ),
      ),
      toolBar: null,
      child: CupertinoScrollbar(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return RowWidget.standard(
              title: items[index].title,
              description: items[index].subtitle,
              leftWidget: IconWidget.background(
                iconData: CupertinoIcons.doc,
              ),
              rightWidget: const Icon(
                CupertinoIcons.chevron_right,
                color: Colors.grey,
              ),
              displayDivider: index < items.length - 1,
              onPressed: () {
                // Navigate to detail
              },
              onLongPress: null,
              decorationCallback: null,
            );
          },
        ),
      ),
    );
  }
}
```

### Settings Screen Pattern

```dart
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
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
                        value: _notificationsEnabled,
                        onChanged: (value) {
                          setState(() => _notificationsEnabled = value);
                        },
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
                        value: _darkModeEnabled,
                        onChanged: (value) {
                          setState(() => _darkModeEnabled = value);
                        },
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
                const SizedBox(height: 24),
                GroupedTableWidget.rounded(
                  title: const TitleWidget(
                    text: 'ACCOUNT',
                    size: TitleSize.small,
                  ),
                  rows: [
                    RowWidget.standard(
                      title: 'Profile',
                      description: null,
                      leftWidget: IconWidget.background(
                        iconData: CupertinoIcons.person,
                      ),
                      rightWidget: const Icon(CupertinoIcons.chevron_right),
                      displayDivider: true,
                      onPressed: () {},
                      onLongPress: null,
                      decorationCallback: null,
                    ),
                    RowWidget.standard(
                      title: 'Privacy',
                      description: null,
                      leftWidget: IconWidget.background(
                        iconData: CupertinoIcons.lock_shield,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

### Form Screen Pattern

```dart
class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    // Validate and save
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      navigationBar: CupertinoNavigatorBarWidget(
        title: 'New Contact',
        imageFilter: NavigatorBarImageFilter.enabled,
        leading: LabelButtonWidget.label(
          label: 'Cancel',
          onPressed: () => Navigator.pop(context),
        ),
        trailing: LabelButtonWidget.label(
          label: 'Save',
          onPressed: _save,
        ),
      ),
      toolBar: null,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 24),
              GroupedTableWidget.rounded(
                title: const TitleWidget(
                  text: 'NAME',
                  size: TitleSize.small,
                ),
                rows: [
                  CupertinoTextFieldWidget(
                    placeholder: 'First Name',
                    controller: _firstNameController,
                    textInputAction: TextInputAction.next,
                  ),
                  const DividerWidget(),
                  CupertinoTextFieldWidget(
                    placeholder: 'Last Name',
                    controller: _lastNameController,
                    textInputAction: TextInputAction.next,
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
                  CupertinoTextFieldWidget(
                    placeholder: 'Email',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                  ),
                ],
                description: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

## State Management Patterns

### Simple State with StatefulWidget

```dart
class ToggleScreen extends StatefulWidget {
  const ToggleScreen({super.key});

  @override
  State<ToggleScreen> createState() => _ToggleScreenState();
}

class _ToggleScreenState extends State<ToggleScreen> {
  bool _isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return SwitchWidget(
      value: _isEnabled,
      onChanged: (value) {
        setState(() {
          _isEnabled = value;
        });
      },
    );
  }
}
```

### Loading State Pattern

```dart
class AsyncActionScreen extends StatefulWidget {
  const AsyncActionScreen({super.key});

  @override
  State<AsyncActionScreen> createState() => _AsyncActionScreenState();
}

class _AsyncActionScreenState extends State<AsyncActionScreen> {
  bool _isLoading = false;

  Future<void> _performAction() async {
    setState(() => _isLoading = true);

    try {
      await Future.delayed(const Duration(seconds: 2));
      // Actual async work
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      },
    }
  }

  @override
  Widget build(BuildContext context) {
    return ButtonWidget.label(
      size: const LargeButtonSize(),
      color: const BlueButtonColor(),
      label: 'Submit',
      displayCupertinoActivityIndicator: _isLoading,
      onPressed: _isLoading ? null : _performAction,
    );
  }
}
```

### Multi-Selection Pattern

```dart
class MultiSelectScreen extends StatefulWidget {
  final List<String> options;

  const MultiSelectScreen({
    required this.options,
    super.key,
  });

  @override
  State<MultiSelectScreen> createState() => _MultiSelectScreenState();
}

class _MultiSelectScreenState extends State<MultiSelectScreen> {
  final Set<String> _selected = {};

  void _toggle(String option) {
    setState(() {
      if (_selected.contains(option)) {
        _selected.remove(option);
      } else {
        _selected.add(option);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 4,
          runSpacing: 4,
          children: widget.options.map((option) {
            return TagWidget(
              label: option,
              selected: _selected.contains(option),
              onPressed: () => _toggle(option),
            );
          }).toList(),
        ),
        ButtonWidget.label(
          size: const LargeButtonSize(),
          color: const BlueButtonColor(),
          label: 'Done (${_selected.length})',
          onPressed: () {
            Navigator.pop(context, _selected);
          },
        ),
      ],
    );
  }
}
```

---

## Navigation Patterns

### Push New Screen

```dart
// Standard push
await Navigator.of(context).push(
  CupertinoPageRoute(
    builder: (context) => const DetailScreen(),
  ),
);

// With result
final result = await Navigator.of(context).push<String>(
  CupertinoPageRoute(
    builder: (context) => const SelectionScreen(),
  ),
);

// Full-screen modal
await Navigator.of(context).push(
  CupertinoPageRoute(
    fullscreenDialog: true,
    builder: (context) => const ModalScreen(),
  ),
);
```

### Show Modal Sheet

```dart
// Simple action sheet
final action = await CupertinoSheetWidget.showModalSheet<String>(
  context: context,
  title: TitleSheetWidget.standard(
    title: 'Choose Action',
    leading: null,
  ),
  children: (context) => [
    RowWidget.standard(
      title: 'Edit',
      description: null,
      leftWidget: null,
      rightWidget: null,
      displayDivider: true,
      onPressed: () => Navigator.pop(context, 'edit'),
      onLongPress: null,
      decorationCallback: null,
    ),
    RowWidget.standard(
      title: 'Delete',
      description: null,
      leftWidget: null,
      rightWidget: null,
      displayDivider: false,
      onPressed: () => Navigator.pop(context, 'delete'),
      onLongPress: null,
      decorationCallback: null,
    ),
  ],
);

if (action == 'delete') {
  // Handle delete
}
```

### Show Picker

```dart
// Date picker
await CupertinoDatePickerWidget.show(
  context: context,
  mode: CupertinoDatePickerMode.date,
  initialDateTime: DateTime.now(),
  onDateTimeChanged: (date) {
    setState(() => _selectedDate = date);
  },
);

// Custom picker
final selectedIndex = await CupertinoPickerWidget.show(
  context: context,
  itemExtent: 40,
  children: options.map((option) {
    return Center(child: Text(option));
  }).toList(),
  onSelectedItemChanged: (index) {
    // Real-time update
  },
);
```

---

## Theme Access Patterns

### Getting Theme Data

```dart
@override
Widget build(BuildContext context) {
  final theme = IosTheme.of(context);

  // Access colors
  final primaryColor = theme.defaultColors.systemBlue;
  final textColor = theme.defaultLabelColors.primary;
  final backgroundColor = switch (theme) {
    IosLightThemeData() => theme.defaultSystemBackgroundsColors.primaryLight,
    IosDarkThemeData() => theme.defaultSystemBackgroundsColors.primaryDarkBase,
  };

  // Access typography
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

### Theme-Aware Color Callbacks

```dart
// In widget properties
IconWidget.background(
  iconData: CupertinoIcons.star,
  backgroundColorCallback: (theme) => theme.defaultColors.systemYellow,
  iconColorCallback: (theme) => theme.defaultColors.systemWhite,
)

// Custom decoration
BoxDecoration customDecoration(IosThemeData theme) => BoxDecoration(
  color: switch (theme) {
    IosLightThemeData() => theme.defaultSystemBackgroundsColors.primaryLight,
    IosDarkThemeData() => theme.defaultSystemBackgroundsColors.primaryDarkElevated,
  },
  borderRadius: BorderRadius.circular(12),
);
```

---

## Error Handling Patterns

### Try-Catch with Loading State

```dart
Future<void> _fetchData() async {
  setState(() {
    _isLoading = true;
    _error = null;
  });

  try {
    final data = await api.fetchData();
    setState(() {
      _data = data;
      _isLoading = false;
    });
  } catch (e) {
    setState(() {
      _error = e.toString();
      _isLoading = false;
    });
  }
}

@override
Widget build(BuildContext context) {
  if (_isLoading) {
    return const Center(child: CupertinoActivityIndicator());
  }

  if (_error != null) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(_error!),
          ButtonWidget.label(
            size: const MediumButtonSize(),
            color: const BlueButtonColor(),
            label: 'Retry',
            onPressed: _fetchData,
          ),
        ],
      ),
    );
  }

  return _buildContent();
}
```

### Form Validation Pattern

```dart
class ValidatedFormScreen extends StatefulWidget {
  const ValidatedFormScreen({super.key});

  @override
  State<ValidatedFormScreen> createState() => _ValidatedFormScreenState();
}

class _ValidatedFormScreenState extends State<ValidatedFormScreen> {
  final _emailController = TextEditingController();
  String? _emailError;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  bool _validate() {
    setState(() {
      if (!_emailController.text.contains('@')) {
        _emailError = 'Please enter a valid email address';
      } else {
        _emailError = null;
      }
    });

    return _emailError == null;
  }

  Future<void> _submit() async {
    if (!_validate()) return;

    // Proceed with submission
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GroupedTableWidget.rounded(
          title: const TitleWidget(
            text: 'EMAIL',
            size: TitleSize.small,
          ),
          rows: [
            CupertinoTextFieldWidget(
              placeholder: 'Email',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (_) {
                if (_emailError != null) {
                  _validate(); // Real-time validation after first error
                }
              },
            ),
          ],
          description: _emailError != null
            ? DescriptionWidget(text: _emailError!)
            : null,
        ),
        ButtonWidget.label(
          size: const LargeButtonSize(),
          color: const BlueButtonColor(),
          label: 'Submit',
          onPressed: _submit,
        ),
      ],
    );
  }
}
```

---

## Performance Patterns

### Use Const Constructors

```dart
// Good
const TitleWidget(
  text: 'SETTINGS',
  size: TitleSize.small,
)

const DividerWidget()

const SizedBox(height: 24)

// Avoid (if possible)
TitleWidget(
  text: 'SETTINGS',
  size: TitleSize.small,
)
```

### ListView.builder for Long Lists

```dart
// Good - lazy loading
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return _buildItem(items[index]);
  },
)

// Avoid for large lists
ListView(
  children: items.map((item) => _buildItem(item)).toList(),
)
```

### Dispose Controllers

```dart
class MyScreen extends StatefulWidget {
  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose(); // Always dispose!
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextFieldWidget(
      controller: _controller,
    );
  }
}
```

---

## Common Troubleshooting

### Issue: Theme colors not showing

**Solution:**
```dart
// Ensure IosAnimatedTheme wraps your widget tree
IosAnimatedTheme(
  data: IosDarkThemeData(),
  child: YourWidget(),
)
```

### Issue: Keyboard covering text field

**Solution:**
```dart
// ScaffoldWidget handles this automatically
// Or use MediaQuery
final viewInsets = MediaQuery.viewInsetsOf(context);
SizedBox(height: viewInsets.bottom)
```

### Issue: setState called after dispose

**Solution:**
```dart
// Check mounted before setState
if (mounted) {
  setState(() {
    // Update state
  });
}
```

### Issue: Navigation bar title cut off

**Solution:**
```dart
// Use shorter title or adjust text scaler
CupertinoNavigatorBarWidget(
  title: 'Short Title', // Keep concise
  // ...
)
```

### Issue: Button not clickable

**Solution:**
```dart
// Ensure onPressed is not null
ButtonWidget.label(
  onPressed: () {}, // Not null
  // ...
)

// Check parent widget isn't intercepting touches
// Ensure button is not obscured by other widgets
```

---

## Quick Checklist

**Before committing code:**

- [ ] All controllers disposed
- [ ] Used const where possible
- [ ] Wrapped screens in SafeArea
- [ ] Tested light and dark modes
- [ ] Added displayDivider: false to last rows
- [ ] Used proper spacing (8pt, 16pt, 24pt)
- [ ] Touch targets at least 44pt
- [ ] No hardcoded colors (use theme)
- [ ] Proper keyboard handling
- [ ] Error states handled
- [ ] Loading states shown
- [ ] Used theme typography
- [ ] Tested on different screen sizes
- [ ] Checked accessibility/text scaling
- [ ] No memory leaks (dispose called)
