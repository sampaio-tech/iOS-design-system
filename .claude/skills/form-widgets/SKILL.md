---
name: form-widgets
description: Text fields, switches, pickers, date pickers, and form validation for iOS Design System
---

## Form Widgets Reference

iOS-style input controls with automatic theme adaptation and validation patterns.

## CupertinoTextFieldWidget

iOS text input with automatic clear button.

```dart
// Basic text field
const CupertinoTextFieldWidget(
  placeholder: 'Enter your name',
)

// With controller
final nameController = useTextEditingController(); // or TextEditingController()

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

// Multiline
const CupertinoTextFieldWidget(
  placeholder: 'Description',
  maxLines: 5,
  minLines: 3,
)
```

**Default Styling:**
- Padding: `EdgeInsets.only(left: 16, top: 11, bottom: 11)`
- Typography: `bodyRegular`
- Background: `primaryLight` / `primaryDarkElevated`
- Clear button: Shows when editing (suffix mode)

## CupertinoSearchTextFieldWidget

Search field with magnifying glass icon.

```dart
// Basic search
const CupertinoSearchTextFieldWidget()

// With controller
final searchController = useTextEditingController();

CupertinoSearchTextFieldWidget(
  controller: searchController,
  placeholder: 'Search contacts',
  onChanged: (value) {
    // Filter results
  },
  onSubmitted: (value) {
    // Perform search
  },
)
```

**Default Styling:**
- Border radius: 10pt
- Background: `defaultFillColors.tertiary`
- Icon size: 20pt (search), 18pt (clear)

## SwitchWidget

iOS toggle switch.

```dart
// Basic switch
SwitchWidget(
  value: true,
  onChanged: (value) {
    print('Switch toggled: $value');
  },
)

// In row
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
  displayDivider: false,
  onPressed: null,
  onLongPress: null,
  decorationCallback: null,
)

// Disabled
SwitchWidget(
  value: true,
  onChanged: null, // Disabled
)

// Custom color
SwitchWidget(
  value: true,
  onChanged: (value) {},
  activeTrackColorCallback: (theme) => theme.defaultColors.systemBlue,
)

// Stocks variant (green when on)
SwitchWidget.stocks(
  value: true,
  onChanged: (value) {},
)
```

**Default Colors:**
- Active: `systemGreen`
- Inactive: `fillColors.secondary`
- Thumb: `systemWhite`

## PickerButtonWidget

Button displaying selected picker value.

```dart
// Date picker button
PickerButtonWidget.dateTime(
  dateTime: DateTime(2020, 6, 20),
  dateFormat: DateFormat.yMMMMd('en_US'), // "June 20, 2020"
  onPressed: () {
    // Show date picker
  },
)

// Time picker button
PickerButtonWidget.dateTime(
  dateTime: DateTime(2020, 6, 20, 13, 30),
  dateFormat: DateFormat.jm(), // "1:30 PM"
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
          setState(() => _selectedDate = newDate);
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

## CupertinoDatePickerWidget

Full-screen date/time picker with gradients.

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

// Date and time
await CupertinoDatePickerWidget.show(
  context: context,
  mode: CupertinoDatePickerMode.dateAndTime,
  initialDateTime: DateTime.now(),
  minimumDate: DateTime.now(),
  showDayOfWeek: true,
  onDateTimeChanged: (newDateTime) {},
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

**Modes:**
- `time` - Hours and minutes
- `date` - Month, day, year
- `dateAndTime` - All components
- `monthYear` - Month and year only

## CupertinoPickerWidget

Generic scrollable picker for custom options.

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

// With magnifier effect
await CupertinoPickerWidget.show(
  context: context,
  itemExtent: 40,
  useMagnifier: true,
  magnification: 1.2,
  children: List.generate(10, (i) {
    return Center(child: Text('Option ${i + 1}'));
  }),
  onSelectedItemChanged: (index) {},
)
```

## Form Patterns

### Profile Form with Hooks
```dart
class ProfileForm extends HookWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
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

    return Column(
      children: [
        GroupedTableWidget(
          rows: [
            CupertinoTextFieldWidget(
              placeholder: 'Name',
              controller: nameController,
            ),
            CupertinoTextFieldWidget(
              placeholder: 'Email',
              controller: emailController,
            ),
          ],
        ),
        ButtonWidget.label(
          size: const LargeButtonSize(),
          color: const BlueButtonColor(),
          label: 'Save',
          displayCupertinoActivityIndicator: isLoading.value,
          onPressed: !isValid.value || isLoading.value
              ? null
              : () async {
                  isLoading.value = true;
                  await Future.delayed(Duration(seconds: 2));
                  isLoading.value = false;
                },
        ),
      ],
    );
  }
}
```

### Form Validation (Traditional)
```dart
class ValidatedFormScreen extends StatefulWidget {
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
                if (_emailError != null) _validate();
              },
            ),
          ],
          description: _emailError != null
            ? DescriptionWidget(text: _emailError!)
            : null,
        ),
      ],
    );
  }
}
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

## Best Practices

1. **Always dispose controllers** in dispose() method (or use hooks)
2. **Use const** for static placeholders
3. **Provide placeholder text** for all text fields
4. **Set appropriate keyboard types** (email, phone, etc.)
5. **Use TextInputAction.next** to navigate between fields
6. **Wrap forms in SingleChildScrollView** for keyboard handling
7. **Show validation errors** in DescriptionWidget below tables
8. **Use null for onChanged** to make switches non-interactive
9. **Set initialDateTime** on pickers for better UX
10. **Group related fields** in same GroupedTableWidget

## File Locations

- CupertinoTextFieldWidget: `/lib/src/widgets/cupertino_text_field_widget.dart`
- CupertinoSearchTextFieldWidget: `/lib/src/widgets/cupertino_search_text_field_widget.dart`
- SwitchWidget: `/lib/src/widgets/switch_widget.dart`
- PickerButtonWidget: `/lib/src/widgets/picker_button_widget.dart`
- CupertinoDatePickerWidget: `/lib/src/widgets/cupertino_date_picker_widget.dart`
- CupertinoPickerWidget: `/lib/src/widgets/cupertino_picker_widget.dart`
