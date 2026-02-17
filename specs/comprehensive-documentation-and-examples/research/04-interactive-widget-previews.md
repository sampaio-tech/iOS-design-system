# Interactive Widget Preview Implementation

## Overview

Research on implementing interactive widget previews with theme switching, variations, and state management for Flutter web documentation.

## Flutter Widget Previewer (Official Experimental Feature)

### Capabilities

- **Real-time Rendering**: Widgets render in Chrome browser separate from full app
- **Theme Toggle**: Built-in toggle between light and dark mode
- **Annotation-Based**: Use `@Preview` annotation to wrap widgets
- **Browser-Based**: Runs in Chrome with preview controls

### Theme Support

Custom theme data can be provided through theme functions:

```dart
@Preview(theme: customThemeBuilder)
Widget myWidgetPreview() {
  return MyWidget();
}

ThemeData customThemeBuilder(BuildContext context) {
  return ThemeData(/* custom theme */);
}
```

**Sources:**
- [Flutter Widget Previewer](https://docs.flutter.dev/tools/widget-previewer)
- [Look at Experimental Flutter Widget Previews](https://tomasrepcik.dev/blog/2025/2025-08-16-flutter-widget-preview/)
- [A Comprehensive Guide to Flutter Widget Previews](https://tech-andgar.me/posts/flutter-widget-previews-guide/)

### Limitations

- **IDE-Focused**: Primarily designed for development, not end-user documentation
- **Experimental**: Still in beta, subject to changes
- **Browser Dependency**: Requires Chrome
- **Not Standalone**: Can't be easily embedded in custom documentation websites

## Theme Switcher Implementation Approaches

### 1. animated_theme_switcher Package

- **Features**: Beautiful transitions during theme switches
- **Web Rendering**: Recommends CanvasKit rendering engine
- **Animation**: Smooth transitions between themes

**Sources:**
- [animated_theme_switcher Package](https://pub.dev/packages/animated_theme_switcher)
- [animated_theme_switcher GitHub](https://github.com/kherel/animated_theme_switcher)

### 2. Provider Pattern

Most common approach for state management:

```dart
class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void setTheme(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}

// In app:
ChangeNotifierProvider<ThemeProvider>(
  create: (_) => ThemeProvider(),
  child: Consumer<ThemeProvider>(
    builder: (context, themeProvider, _) {
      return MaterialApp(
        themeMode: themeProvider.themeMode,
        theme: lightTheme,
        darkTheme: darkTheme,
        // ...
      );
    },
  ),
)
```

**Sources:**
- [Create a Theme and Primary Color Switcher](https://medium.com/flutter-community/create-a-theme-and-primary-color-switcher-for-your-app-using-provider-fd334dd7d761)
- [How to create a dynamic theme switcher in Flutter](https://blog.logrocket.com/dynamic-theme-switcher-flutter/)

### 3. StatefulWidget Approach

For simpler cases without Provider:

```dart
class DocumentationApp extends StatefulWidget {
  @override
  _DocumentationAppState createState() => _DocumentationAppState();
}

class _DocumentationAppState extends State<DocumentationApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: _themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
      // ...
    );
  }
}
```

**Source:**
- [Use themes to share colors and font styles](https://docs.flutter.dev/cookbook/design/themes)

### 4. Persistence

For persisting theme selection:

```dart
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  static const String _key = 'theme_mode';
  ThemeMode _themeMode = ThemeMode.system;

  ThemeProvider() {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString(_key);
    if (savedTheme != null) {
      _themeMode = ThemeMode.values.firstWhere(
        (e) => e.toString() == savedTheme,
        orElse: () => ThemeMode.system,
      );
      notifyListeners();
    }
  }

  Future<void> setTheme(ThemeMode mode) async {
    _themeMode = mode;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, mode.toString());
  }
}
```

**Source:**
- [Theming and Customization in Flutter: A Handbook](https://www.freecodecamp.org/news/theming-and-customization-in-flutter-a-handbook-for-developers/)

## Interactive Preview Architecture

### Component Isolation

For documentation website, each component should be:

```dart
class ComponentPreview extends StatefulWidget {
  final Widget Function(BuildContext, ThemeData) builder;
  final String componentName;
  final List<ComponentVariation> variations;

  const ComponentPreview({
    required this.builder,
    required this.componentName,
    required this.variations,
  });

  @override
  _ComponentPreviewState createState() => _ComponentPreviewState();
}

class _ComponentPreviewState extends State<ComponentPreview> {
  ThemeMode _themeMode = ThemeMode.light;
  ComponentVariation _selectedVariation = variations.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Theme switcher controls
        ThemeToggle(
          mode: _themeMode,
          onChanged: (mode) => setState(() => _themeMode = mode),
        ),

        // Variation selector
        VariationSelector(
          variations: widget.variations,
          selected: _selectedVariation,
          onChanged: (variation) => setState(() => _selectedVariation = variation),
        ),

        // Preview area
        PreviewCanvas(
          theme: _themeMode == ThemeMode.light ? lightTheme : darkTheme,
          child: widget.builder(context, theme),
        ),

        // Code snippet
        CodeSnippet(code: _selectedVariation.code),
      ],
    );
  }
}
```

### State Management for Previews

Each preview needs to manage:
1. **Theme state** (light/dark)
2. **Variation state** (size, color, etc.)
3. **Component state** (enabled/disabled, selected, etc.)
4. **Interaction state** (hover, pressed, focused)

### Preview Controls

Standard controls for each preview:
- **Theme Toggle**: Switch between light/dark
- **Variation Dropdown**: Select size, color variants
- **State Buttons**: Show different states (default, hover, disabled, etc.)
- **Device Frame Toggle**: Show with/without device frame
- **Background Options**: Transparent, white, black, custom
- **Zoom Controls**: Adjust preview scale

## Web-Specific Considerations

### Performance

- **Lazy Loading**: Load preview widgets on-demand
- **Code Splitting**: Separate bundles for each component
- **Asset Optimization**: Compress images and fonts
- **Rendering**: Consider CanvasKit vs HTML renderer tradeoffs

### Responsive Previews

```dart
class ResponsivePreview extends StatelessWidget {
  final Widget child;
  final List<DeviceSize> sizes;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: sizes.map((size) =>
        DeviceFrame(
          size: size,
          child: child,
        ),
      ).toList(),
    );
  }
}
```

### Complex Widget Dependencies

For widgets with dependencies (providers, themes, etc.):

```dart
class PreviewWrapper extends StatelessWidget {
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        // Other providers as needed
      ],
      child: IosAnimatedTheme(
        data: IosLightThemeData(),
        child: CupertinoApp(
          home: CupertinoPageScaffold(
            child: child,
          ),
        ),
      ),
    );
  }
}
```

**Source:**
- [A Comprehensive Guide to Flutter Widget Previews](https://tech-andgar.me/posts/flutter-widget-previews-guide/)

## Recommended Implementation for iOS Design System

### Architecture

1. **Preview Component System**
   - Reusable `ComponentPreview` widget
   - Standard controls (theme, variation, state)
   - Consistent preview canvas styling

2. **Theme Management**
   - Provider-based theme switching
   - Support for `IosLightThemeData` and `IosDarkThemeData`
   - Persistence of user preference

3. **Variation System**
   ```dart
   class ComponentVariation {
     final String name;
     final String description;
     final Widget widget;
     final String code;

     ComponentVariation({
       required this.name,
       required this.description,
       required this.widget,
       required this.code,
     });
   }
   ```

4. **Code Display**
   - Syntax highlighting (e.g., `flutter_highlight` package)
   - Copy to clipboard button
   - Progressive examples (minimal → complete)

5. **Interactive States**
   - Hover states (where applicable)
   - Pressed/active states
   - Disabled states
   - Error states
   - Loading states

### Example Preview Page Structure

```
Component Page
├── Header (name, description)
├── Quick Example (minimal code)
├── Interactive Preview
│   ├── Controls (theme, variation, state)
│   ├── Preview Canvas
│   └── Code Display
├── Properties Table
├── Examples Section
│   ├── Basic Usage
│   ├── Advanced Usage
│   └── Common Patterns
└── Related Components
```

## Inspiration from Primer

Primer's approach includes:
- Clean, minimal interface
- Side-by-side code and preview
- Clear variation toggles
- Inline documentation
- Accessibility information
- Related components section

**Source:**
- [Primer Components](https://primer.style/components/)

## Tools & Packages

Recommended packages for implementation:
- `provider` or `riverpod`: State management
- `flutter_highlight`: Syntax highlighting
- `shared_preferences`: Theme persistence
- `url_launcher`: Link to related docs
- `flutter_svg`: For icon examples
- Custom widgets for preview controls

## Conclusion

For iOS Design System documentation:
- Build custom preview component system
- Use Provider for theme management
- Create reusable variation system
- Focus on clean, intuitive controls
- Ensure previews work well on web
- Optimize for performance and loading
