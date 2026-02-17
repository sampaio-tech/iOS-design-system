# iOS Design System - Comprehensive Documentation and Examples
## Implementation Plan

---

## Progress Checklist

### Phase 1: Foundation & Infrastructure (Steps 1-6)
- [ ] Step 1: Project Setup and Directory Structure
- [ ] Step 2: Documentation Website Foundation
- [ ] Step 3: Core Component Preview System
- [ ] Step 4: Theme Provider and Switching
- [ ] Step 5: Navigation and Routing
- [ ] Step 6: Code Display and Syntax Highlighting

### Phase 2: Content Pages (Steps 7-11)
- [ ] Step 7: Homepage and Getting Started
- [ ] Step 8: Foundation - Theme Documentation
- [ ] Step 9: Foundation - Colors Documentation
- [ ] Step 10: Foundation - Typography Documentation
- [ ] Step 11: First Component Page (ButtonWidget)

### Phase 3: Search and Enhanced Features (Steps 12-15)
- [ ] Step 12: Search Functionality
- [ ] Step 13: Additional Component Pages
- [ ] Step 14: Patterns and Migration Guide
- [ ] Step 15: Mobile Responsiveness

### Phase 4: API Reference and Skills (Steps 16-19)
- [ ] Step 16: dartdoc Integration
- [ ] Step 17: Core Claude Code Skills
- [ ] Step 18: Widget-Specific Skills
- [ ] Step 19: README Update

### Phase 5: Deployment and Polish (Steps 20-22)
- [ ] Step 20: GitHub Actions CI/CD Setup
- [ ] Step 21: Performance Optimization
- [ ] Step 22: Testing, Documentation, and Launch

---

## Step 1: Project Setup and Directory Structure

**Objective**: Create the documentation project structure and configure build tools.

**Implementation Guidance**:

1. Create documentation app directory:
```bash
mkdir -p docs_app
cd docs_app
flutter create . --project-name ios_design_system_docs
```

2. Update `pubspec.yaml` with dependencies:
```yaml
name: ios_design_system_docs
description: Documentation website for iOS Design System

environment:
  sdk: ">=3.7.0 <4.0.0"

dependencies:
  flutter:
    sdk: flutter
  ios_design_system:
    path: ../
  provider: ^6.1.0
  go_router: ^14.0.0
  flutter_highlight: ^0.7.0
  shared_preferences: ^2.2.0
  url_launcher: ^6.2.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
```

3. Create directory structure:
```
docs_app/
├── lib/
│   ├── main.dart
│   ├── app.dart
│   ├── core/
│   │   ├── theme/
│   │   ├── routing/
│   │   └── services/
│   ├── shared/
│   │   ├── components/
│   │   └── widgets/
│   ├── pages/
│   │   ├── home/
│   │   ├── getting_started/
│   │   ├── foundation/
│   │   ├── components/
│   │   └── patterns/
│   └── data/
│       ├── models/
│       └── content/
├── test/
├── web/
│   └── index.html (update base href)
└── README.md
```

4. Configure `web/index.html` for GitHub Pages:
```html
<base href="/ios_design_system/">
```

**Test Requirements**:
- [ ] Project builds successfully: `flutter build web`
- [ ] No dependency conflicts
- [ ] App runs in browser: `flutter run -d chrome`
- [ ] Directory structure is correct

**Integration Notes**:
- Documentation app references main package via path dependency
- Will be deployed to `/ios_design_system/` subdirectory on GitHub Pages

**Demo**:
Run `flutter run -d chrome` and see blank Flutter app with proper configuration.

---

## Step 2: Documentation Website Foundation

**Objective**: Create the basic app shell with header, sidebar, and main content area.

**Implementation Guidance**:

1. Create `lib/app.dart`:
```dart
class DocumentationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DocumentationThemeProvider(),
      child: Consumer<DocumentationThemeProvider>(
        builder: (context, themeProvider, _) {
          return IosAnimatedTheme(
            data: themeProvider.currentTheme,
            child: CupertinoApp(
              title: 'iOS Design System',
              theme: CupertinoThemeData(
                brightness: themeProvider.brightness,
              ),
              home: DocumentationShell(
                child: HomePage(),
              ),
            ),
          );
        },
      ),
    );
  }
}
```

2. Create `lib/shared/components/documentation_shell.dart`:
```dart
class DocumentationShell extends StatelessWidget {
  final Widget child;
  final String? currentPath;

  const DocumentationShell({
    required this.child,
    this.currentPath,
  });

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      child: Row(
        children: [
          // Sidebar
          NavigationSidebar(currentPath: currentPath),

          // Main content
          Expanded(
            child: Column(
              children: [
                // Header
                DocumentationHeader(),

                // Content
                Expanded(
                  child: SingleChildScrollView(
                    child: child,
                  ),
                ),

                // Footer
                DocumentationFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

3. Create basic header component with:
   - Logo/title
   - Theme toggle button
   - GitHub link
   - Search button (placeholder for now)

4. Create basic sidebar with:
   - Navigation tree structure
   - Collapsible sections
   - Active state highlighting

5. Create basic footer with:
   - Copyright
   - Links to GitHub, pub.dev
   - Version info

**Test Requirements**:
- [ ] Widget tests for DocumentationShell
- [ ] Golden tests for header in light/dark themes
- [ ] Golden tests for sidebar
- [ ] Responsive layout tests

**Integration Notes**:
- Shell wraps all pages consistently
- Header/footer reused across all pages
- Sidebar navigation structure defined but links not yet functional

**Demo**:
App displays with header, sidebar, main content area, and footer. Theme toggle works. Sidebar shows navigation structure.

---

## Step 3: Core Component Preview System

**Objective**: Build the reusable component preview widget for interactive examples.

**Implementation Guidance**:

1. Create `lib/shared/widgets/component_preview.dart`:
```dart
class ComponentPreview extends StatefulWidget {
  final String componentName;
  final Widget Function(BuildContext, PreviewConfig) builder;
  final List<ComponentVariation> variations;
  final List<ComponentState> states;
  final bool showThemeToggle;
  final bool showDeviceFrame;

  const ComponentPreview({
    required this.componentName,
    required this.builder,
    required this.variations,
    this.states = const [],
    this.showThemeToggle = true,
    this.showDeviceFrame = false,
  });

  @override
  State<ComponentPreview> createState() => _ComponentPreviewState();
}

class _ComponentPreviewState extends State<ComponentPreview> {
  late ComponentVariation _selectedVariation;
  late ComponentState? _selectedState;
  ThemeMode _previewThemeMode = ThemeMode.light;

  @override
  void initState() {
    super.initState();
    _selectedVariation = widget.variations.first;
    _selectedState = widget.states.isNotEmpty ? widget.states.first : null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: IosTheme.of(context).defaultColors.separator,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Controls
          _buildControls(),

          // Preview canvas
          _buildPreviewCanvas(),
        ],
      ),
    );
  }

  Widget _buildControls() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: IosTheme.of(context).defaultColors.separator,
          ),
        ),
      ),
      child: Row(
        children: [
          // Variation selector
          if (widget.variations.length > 1)
            _buildVariationSelector(),

          SizedBox(width: 16),

          // State selector
          if (widget.states.isNotEmpty)
            _buildStateSelector(),

          Spacer(),

          // Theme toggle
          if (widget.showThemeToggle)
            _buildThemeToggle(),
        ],
      ),
    );
  }

  Widget _buildPreviewCanvas() {
    final theme = _previewThemeMode == ThemeMode.light
        ? IosLightThemeData()
        : IosDarkThemeData();

    return IosAnimatedTheme(
      data: theme,
      child: Container(
        padding: EdgeInsets.all(32),
        color: theme.defaultColors.systemBackground,
        child: Center(
          child: widget.builder(
            context,
            PreviewConfig(
              theme: theme,
              variation: _selectedVariation,
              state: _selectedState,
            ),
          ),
        ),
      ),
    );
  }

  // ... selector implementations
}
```

2. Create supporting models:
```dart
class PreviewConfig {
  final IosThemeData theme;
  final ComponentVariation variation;
  final ComponentState? state;

  PreviewConfig({
    required this.theme,
    required this.variation,
    this.state,
  });
}

class ComponentVariation {
  final String id;
  final String name;
  final String description;
  final Map<String, dynamic> properties;

  ComponentVariation({
    required this.id,
    required this.name,
    required this.description,
    required this.properties,
  });
}

class ComponentState {
  final String id;
  final String name;
  final bool enabled;
  final bool selected;
  final bool hovered;

  ComponentState({
    required this.id,
    required this.name,
    this.enabled = true,
    this.selected = false,
    this.hovered = false,
  });
}
```

3. Create variation and state selector widgets

**Test Requirements**:
- [ ] Unit tests for PreviewConfig, ComponentVariation, ComponentState
- [ ] Widget tests for ComponentPreview
- [ ] Test variation switching
- [ ] Test state switching
- [ ] Test theme toggle in preview
- [ ] Golden tests for preview in light/dark themes

**Integration Notes**:
- ComponentPreview will be used in all component pages
- Variations and states defined per component
- Preview isolated from global theme (has own theme toggle)

**Demo**:
Create a test page with ComponentPreview showing a ButtonWidget with multiple variations and states. Toggle theme, switch variations, observe updates.

---

## Step 4: Theme Provider and Switching

**Objective**: Implement global theme management with persistence.

**Implementation Guidance**:

1. Create `lib/core/theme/documentation_theme_provider.dart`:
```dart
class DocumentationThemeProvider extends ChangeNotifier {
  static const String _themeKey = 'theme_mode';
  ThemeMode _themeMode = ThemeMode.system;
  late SharedPreferences _prefs;

  DocumentationThemeProvider() {
    _loadTheme();
  }

  ThemeMode get themeMode => _themeMode;

  Brightness get brightness {
    if (_themeMode == ThemeMode.system) {
      return WidgetsBinding.instance.window.platformBrightness;
    }
    return _themeMode == ThemeMode.light ? Brightness.light : Brightness.dark;
  }

  IosThemeData get currentTheme {
    return brightness == Brightness.light
        ? IosLightThemeData()
        : IosDarkThemeData();
  }

  Future<void> _loadTheme() async {
    _prefs = await SharedPreferences.getInstance();
    final savedTheme = _prefs.getString(_themeKey);

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
    await _prefs.setString(_themeKey, mode.toString());
    notifyListeners();
  }

  void toggleTheme() {
    final newMode = brightness == Brightness.light
        ? ThemeMode.dark
        : ThemeMode.light;
    setTheme(newMode);
  }
}
```

2. Create theme toggle button component:
```dart
class ThemeToggleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DocumentationThemeProvider>(
      builder: (context, themeProvider, _) {
        final isLight = themeProvider.brightness == Brightness.light;

        return CupertinoButton(
          padding: EdgeInsets.all(8),
          onPressed: () => themeProvider.toggleTheme(),
          child: Icon(
            isLight ? CupertinoIcons.moon_fill : CupertinoIcons.sun_max_fill,
            size: 24,
          ),
        );
      },
    );
  }
}
```

3. Integrate theme toggle in header

**Test Requirements**:
- [ ] Unit tests for DocumentationThemeProvider
- [ ] Test theme persistence (mock SharedPreferences)
- [ ] Test system theme detection
- [ ] Widget tests for ThemeToggleButton
- [ ] Integration test: toggle theme, restart app, verify persisted

**Integration Notes**:
- Provider wraps entire app (already in Step 2)
- Theme toggle in header affects global theme
- Component previews have independent theme state

**Demo**:
Toggle theme in header, see entire app switch. Reload page, theme persists. Test on system with dark mode, verify auto-detection.

---

## Step 5: Navigation and Routing

**Objective**: Implement routing with go_router for deep linking and navigation.

**Implementation Guidance**:

1. Define navigation structure in `lib/data/navigation_structure.dart`:
```dart
class NavigationStructure {
  static final List<NavigationNode> nodes = [
    NavigationNode(
      id: 'home',
      label: 'Home',
      path: '/',
      icon: CupertinoIcons.home,
    ),
    NavigationNode(
      id: 'getting-started',
      label: 'Getting Started',
      icon: CupertinoIcons.rocket_fill,
      children: [
        NavigationNode(
          id: 'installation',
          label: 'Installation',
          path: '/getting-started/installation',
        ),
        NavigationNode(
          id: 'quick-start',
          label: 'Quick Start',
          path: '/getting-started/quick-start',
        ),
        NavigationNode(
          id: 'comparison',
          label: 'vs Flutter Cupertino',
          path: '/getting-started/comparison',
        ),
      ],
    ),
    NavigationNode(
      id: 'foundation',
      label: 'Foundation',
      icon: CupertinoIcons.square_grid_2x2,
      children: [
        NavigationNode(
          id: 'theme',
          label: 'Theme',
          path: '/foundation/theme',
        ),
        NavigationNode(
          id: 'colors',
          label: 'Colors',
          path: '/foundation/colors',
        ),
        NavigationNode(
          id: 'typography',
          label: 'Typography',
          path: '/foundation/typography',
        ),
      ],
    ),
    // More sections...
  ];
}
```

2. Create router configuration in `lib/core/routing/app_router.dart`:
```dart
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return DocumentationShell(
          currentPath: state.uri.path,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => HomePage(),
        ),
        GoRoute(
          path: '/getting-started/installation',
          builder: (context, state) => InstallationPage(),
        ),
        GoRoute(
          path: '/getting-started/quick-start',
          builder: (context, state) => QuickStartPage(),
        ),
        GoRoute(
          path: '/getting-started/comparison',
          builder: (context, state) => ComparisonPage(),
        ),
        GoRoute(
          path: '/foundation/theme',
          builder: (context, state) => ThemePage(),
        ),
        GoRoute(
          path: '/foundation/colors',
          builder: (context, state) => ColorsPage(),
        ),
        GoRoute(
          path: '/foundation/typography',
          builder: (context, state) => TypographyPage(),
        ),
        // More routes...
      ],
    ),
  ],
);
```

3. Update DocumentationApp to use router:
```dart
class DocumentationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DocumentationThemeProvider(),
      child: Consumer<DocumentationThemeProvider>(
        builder: (context, themeProvider, _) {
          return IosAnimatedTheme(
            data: themeProvider.currentTheme,
            child: CupertinoApp.router(
              title: 'iOS Design System',
              theme: CupertinoThemeData(
                brightness: themeProvider.brightness,
              ),
              routerConfig: appRouter,
            ),
          );
        },
      ),
    );
  }
}
```

4. Update NavigationSidebar to handle routing:
```dart
class NavigationSidebar extends StatelessWidget {
  final String? currentPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      child: ListView(
        children: NavigationStructure.nodes.map((node) {
          return NavigationNodeWidget(
            node: node,
            currentPath: currentPath,
          );
        }).toList(),
      ),
    );
  }
}

class NavigationNodeWidget extends StatefulWidget {
  final NavigationNode node;
  final String? currentPath;

  @override
  State<NavigationNodeWidget> createState() => _NavigationNodeWidgetState();
}

class _NavigationNodeWidgetState extends State<NavigationNodeWidget> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    if (widget.node.children.isEmpty) {
      return _buildLeafNode();
    }
    return _buildParentNode();
  }

  Widget _buildLeafNode() {
    final isActive = widget.currentPath == widget.node.path;

    return CupertinoButton(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      onPressed: () {
        if (widget.node.path != null) {
          context.go(widget.node.path!);
        }
      },
      child: Row(
        children: [
          if (widget.node.icon != null)
            Icon(widget.node.icon, size: 20),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              widget.node.label,
              style: TextStyle(
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ... parent node implementation with expansion
}
```

**Test Requirements**:
- [ ] Unit tests for navigation structure
- [ ] Widget tests for NavigationSidebar
- [ ] Integration tests for routing
- [ ] Test deep linking (direct URL navigation)
- [ ] Test browser back/forward buttons
- [ ] Test active state highlighting

**Integration Notes**:
- ShellRoute ensures DocumentationShell wraps all pages
- currentPath passed to sidebar for active state
- All navigation goes through go_router

**Demo**:
Click sidebar items, see URL update and page change. Copy URL, paste in new tab, see correct page load. Use browser back button, see navigation work.

---

## Step 6: Code Display and Syntax Highlighting

**Objective**: Create code display widget with syntax highlighting and copy functionality.

**Implementation Guidance**:

1. Create `lib/shared/widgets/code_display.dart`:
```dart
class CodeDisplay extends StatefulWidget {
  final String code;
  final String language;
  final bool showLineNumbers;
  final bool showCopyButton;
  final Set<int>? highlightLines;

  const CodeDisplay({
    required this.code,
    this.language = 'dart',
    this.showLineNumbers = true,
    this.showCopyButton = true,
    this.highlightLines,
  });

  @override
  State<CodeDisplay> createState() => _CodeDisplayState();
}

class _CodeDisplayState extends State<CodeDisplay> {
  bool _copied = false;

  @override
  Widget build(BuildContext context) {
    final theme = IosTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? Color(0xFF1E1E1E) : Color(0xFFF6F8FA),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.defaultColors.separator,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header with language and copy button
          if (widget.showCopyButton)
            _buildHeader(),

          // Code content
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: HighlightView(
                widget.code,
                language: widget.language,
                theme: isDark
                    ? vs2015Theme
                    : githubTheme,
                padding: EdgeInsets.zero,
                textStyle: TextStyle(
                  fontFamily: 'Courier',
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: IosTheme.of(context).defaultColors.separator,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.language.toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: IosTheme.of(context).defaultLabelColors.secondary,
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            minSize: 0,
            onPressed: _copyCode,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _copied ? CupertinoIcons.check_mark : CupertinoIcons.doc_on_doc,
                  size: 16,
                ),
                SizedBox(width: 4),
                Text(
                  _copied ? 'Copied!' : 'Copy',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _copyCode() async {
    await Clipboard.setData(ClipboardData(text: widget.code));
    setState(() => _copied = true);

    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        setState(() => _copied = false);
      }
    });
  }
}
```

2. Create progressive example widget in `lib/shared/widgets/progressive_example.dart`:
```dart
class ProgressiveExample extends StatefulWidget {
  final List<ExampleStep> steps;
  final bool showAllByDefault;

  const ProgressiveExample({
    required this.steps,
    this.showAllByDefault = false,
  });

  @override
  State<ProgressiveExample> createState() => _ProgressiveExampleState();
}

class _ProgressiveExampleState extends State<ProgressiveExample> {
  late int _currentStep;

  @override
  void initState() {
    super.initState();
    _currentStep = widget.showAllByDefault ? widget.steps.length - 1 : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Step selector
        _buildStepSelector(),

        SizedBox(height: 16),

        // Current step content
        _buildStepContent(widget.steps[_currentStep]),
      ],
    );
  }

  Widget _buildStepSelector() {
    return Row(
      children: [
        for (int i = 0; i < widget.steps.length; i++) ...[
          CupertinoButton(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            color: i == _currentStep
                ? IosTheme.of(context).defaultColors.systemBlue
                : null,
            onPressed: () => setState(() => _currentStep = i),
            child: Text(
              widget.steps[i].title,
              style: TextStyle(
                color: i == _currentStep
                    ? CupertinoColors.white
                    : IosTheme.of(context).defaultLabelColors.primary,
              ),
            ),
          ),
          if (i < widget.steps.length - 1) SizedBox(width: 8),
        ],
      ],
    );
  }

  Widget _buildStepContent(ExampleStep step) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          step.description,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 16),
        CodeDisplay(code: step.code),
        if (step.preview != null) ...[
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(
                color: IosTheme.of(context).defaultColors.separator,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: step.preview,
          ),
        ],
      ],
    );
  }
}

class ExampleStep {
  final String title;
  final String description;
  final String code;
  final Widget? preview;

  ExampleStep({
    required this.title,
    required this.description,
    required this.code,
    this.preview,
  });
}
```

**Test Requirements**:
- [ ] Widget tests for CodeDisplay
- [ ] Test copy functionality (mock Clipboard)
- [ ] Test syntax highlighting in light/dark themes
- [ ] Widget tests for ProgressiveExample
- [ ] Test step switching
- [ ] Golden tests for code display

**Integration Notes**:
- CodeDisplay used in all documentation pages
- ProgressiveExample used for tutorial-style content
- Copy functionality requires web permissions (already in Flutter web)

**Demo**:
Create test page with multiple code examples. Copy code, verify clipboard. Switch between progressive example steps. Toggle theme, see syntax highlighting update.

---

## Step 7: Homepage and Getting Started

**Objective**: Create homepage and core Getting Started pages.

**Implementation Guidance**:

1. Create `lib/pages/home/home_page.dart`:
```dart
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hero section
          _buildHeroSection(context),

          SizedBox(height: 64),

          // Feature highlights
          _buildFeatureHighlights(context),

          SizedBox(height: 64),

          // Quick preview of components
          _buildQuickPreview(context),

          SizedBox(height: 64),

          // Get started CTA
          _buildGetStartedCTA(context),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'iOS Design System',
          style: TextStyle(
            fontSize: 56,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'An extensible, autonomous alternative to Flutter\'s Cupertino components. '
          'Build beautiful iOS apps with more flexibility and control.',
          style: TextStyle(
            fontSize: 24,
            color: IosTheme.of(context).defaultLabelColors.secondary,
          ),
        ),
        SizedBox(height: 32),
        Row(
          children: [
            ButtonWidget.label(
              size: LargeButtonSize(),
              color: BlueButtonColor(),
              onPressed: () => context.go('/getting-started/quick-start'),
              label: 'Get Started',
            ),
            SizedBox(width: 16),
            ButtonWidget.label(
              size: LargeButtonSize(),
              color: GreyTransparentButtonColor(),
              onPressed: () => launchUrl(Uri.parse('https://github.com/...')),
              label: 'View on GitHub',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFeatureHighlights(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FeatureCard(
            icon: CupertinoIcons.slider_horizontal_3,
            title: 'Extensible & Autonomous',
            description: 'Independent from Flutter\'s Cupertino core, giving you full control over customization.',
          ),
        ),
        SizedBox(width: 24),
        Expanded(
          child: FeatureCard(
            icon: CupertinoIcons.square_grid_3x2,
            title: 'Comprehensive Components',
            description: 'From basic buttons to complex navigation patterns, everything you need to build iOS apps.',
          ),
        ),
        SizedBox(width: 24),
        Expanded(
          child: FeatureCard(
            icon: CupertinoIcons.checkmark_seal,
            title: 'Production Ready',
            description: 'Battle-tested components with full theme support, accessibility, and documentation.',
          ),
        ),
      ],
    );
  }

  // ... other sections
}
```

2. Create `lib/pages/getting_started/quick_start_page.dart`:
```dart
class QuickStartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '10-Minute Quick Start',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Get up and running with iOS Design System in under 10 minutes.',
            style: TextStyle(
              fontSize: 18,
              color: IosTheme.of(context).defaultLabelColors.secondary,
            ),
          ),
          SizedBox(height: 32),

          // Step 1: Installation
          _buildStep(
            context,
            number: '1',
            title: 'Add Dependency',
            description: 'Add iOS Design System to your pubspec.yaml',
            code: '''
dependencies:
  ios_design_system:
    git:
      url: https://github.com/your-repo/ios_design_system.git
''',
          ),

          SizedBox(height: 32),

          // Step 2: Import
          _buildStep(
            context,
            number: '2',
            title: 'Import Package',
            description: 'Import the package in your Dart file',
            code: '''
import 'package:ios_design_system/ios_design_system.dart';
''',
          ),

          SizedBox(height: 32),

          // Step 3: Setup Theme
          _buildStep(
            context,
            number: '3',
            title: 'Setup Theme',
            description: 'Wrap your app with IosAnimatedTheme',
            code: '''
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData = IosLightThemeData();

    return IosAnimatedTheme(
      data: themeData,
      child: CupertinoApp(
        title: 'My App',
        theme: CupertinoThemeData(
          brightness: themeData.brightness,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
''',
          ),

          SizedBox(height: 32),

          // Step 4: Use Component
          _buildStep(
            context,
            number: '4',
            title: 'Use a Component',
            description: 'Add your first iOS Design System component',
            code: '''
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      navigationBar: CupertinoNavigatorBarWidget(
        title: 'Hello World',
      ),
      child: Center(
        child: ButtonWidget.label(
          size: LargeButtonSize(),
          color: BlueButtonColor(),
          onPressed: () {
            print('Button pressed!');
          },
          label: 'Click Me',
        ),
      ),
    );
  }
}
''',
          ),

          SizedBox(height: 32),

          // Next steps
          _buildNextSteps(context),
        ],
      ),
    );
  }

  Widget _buildStep(
    BuildContext context, {
    required String number,
    required String title,
    required String description,
    required String code,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: IosTheme.of(context).defaultColors.systemBlue,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  number,
                  style: TextStyle(
                    color: CupertinoColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Padding(
          padding: EdgeInsets.only(left: 56),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              CodeDisplay(code: code),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNextSteps(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: IosTheme.of(context).defaultColors.secondarySystemBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '🎉 You\'re all set!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Here\'s what to explore next:',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          _buildNextStepLink(
            context,
            'Foundation',
            'Learn about theme, colors, and typography',
            '/foundation/theme',
          ),
          SizedBox(height: 8),
          _buildNextStepLink(
            context,
            'Components',
            'Explore all available components',
            '/components',
          ),
          SizedBox(height: 8),
          _buildNextStepLink(
            context,
            'Comparison Guide',
            'See how it differs from Flutter Cupertino',
            '/getting-started/comparison',
          ),
        ],
      ),
    );
  }

  Widget _buildNextStepLink(
    BuildContext context,
    String title,
    String description,
    String path,
  ) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => context.go(path),
      child: Row(
        children: [
          Icon(CupertinoIcons.arrow_right_circle, size: 24),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: IosTheme.of(context).defaultLabelColors.secondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

3. Create Installation and Comparison pages similarly

**Test Requirements**:
- [ ] Widget tests for HomePage
- [ ] Widget tests for QuickStartPage
- [ ] Test navigation from homepage CTAs
- [ ] Test code copy in quick start
- [ ] Golden tests for pages
- [ ] Test responsive layout

**Integration Notes**:
- HomePage is entry point (route: '/')
- Quick Start demonstrates 10-minute setup goal
- Navigation to foundation and components from homepage

**Demo**:
Navigate to homepage, see hero section and features. Click "Get Started", land on Quick Start page. Follow steps, copy code. Click next steps links, navigate to other sections.

---

## Step 8: Foundation - Theme Documentation

**Objective**: Create comprehensive theme documentation page.

**Implementation Guidance**:

1. Create `lib/pages/foundation/theme_page.dart` with sections:
   - Overview of theme system
   - IosLightThemeData and IosDarkThemeData
   - IosAnimatedTheme usage
   - Accessing theme with IosTheme.of(context)
   - Creating custom themes
   - Interactive demo showing theme switching

2. Include progressive examples:
   - Minimal: Basic theme setup (5 lines)
   - Standard: With custom colors (15 lines)
   - Advanced: Full custom theme (30+ lines)

3. Add interactive preview showing:
   - Sample UI in light theme
   - Sample UI in dark theme
   - Toggle to switch between

4. Include properties table for IosThemeData

**Test Requirements**:
- [ ] Widget tests for ThemePage
- [ ] Test interactive theme demo
- [ ] Test code examples
- [ ] Golden tests
- [ ] Test responsive layout

**Integration Notes**:
- Route: /foundation/theme
- Linked from navigation sidebar
- Referenced in Quick Start

**Demo**:
View theme page, see explanation and examples. Toggle interactive preview between light/dark. Copy code examples. Navigate to colors page from "See also" links.

---

## Step 9: Foundation - Colors Documentation

**Objective**: Create comprehensive color system documentation.

**Implementation Guidance**:

1. Create `lib/pages/foundation/colors_page.dart` with sections:
   - Overview of color system
   - Default colors (systemBackground, label, etc.)
   - Accessible colors
   - Semantic colors (systemBlue, systemGreen, etc.)
   - Specialized palettes (weather, stocks, books, app store, neutral)
   - Accessing colors from theme
   - Creating custom color schemes
   - Accessibility and WCAG compliance

2. Create color swatch widgets:
```dart
class ColorSwatch extends StatelessWidget {
  final String name;
  final Color color;
  final String? hexValue;
  final String? usage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: IosTheme.of(context).defaultColors.separator,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          SizedBox(height: 12),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          if (hexValue != null) ...[
            SizedBox(height: 4),
            Text(
              hexValue!,
              style: TextStyle(
                fontFamily: 'Courier',
                fontSize: 12,
                color: IosTheme.of(context).defaultLabelColors.secondary,
              ),
            ),
          ],
          if (usage != null) ...[
            SizedBox(height: 8),
            Text(
              usage!,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ],
      ),
    );
  }
}
```

3. Create color palette grid:
```dart
class ColorPaletteGrid extends StatelessWidget {
  final String title;
  final List<ColorSwatchData> colors;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2,
          ),
          itemCount: colors.length,
          itemBuilder: (context, index) {
            final swatchData = colors[index];
            return ColorSwatch(
              name: swatchData.name,
              color: swatchData.color,
              hexValue: swatchData.hexValue,
              usage: swatchData.usage,
            );
          },
        ),
      ],
    );
  }
}
```

4. Include code examples for accessing colors:
```dart
// Example 1: Accessing default colors
final backgroundColor = IosTheme.of(context).defaultColors.systemBackground;

// Example 2: Accessing semantic colors
final blueColor = IosTheme.of(context).defaultColors.systemBlue;

// Example 3: Accessing accessible colors
final orangeColor = IosTheme.of(context).acessibleColors.systemOrange;

// Example 4: Custom color scheme
class MyCustomTheme extends IosLightThemeData {
  @override
  IosDefaultColors get defaultColors => IosDefaultColors(
    // Custom color values...
  );
}
```

5. Add accessibility section with WCAG contrast ratios

**Test Requirements**:
- [ ] Widget tests for ColorsPage
- [ ] Widget tests for ColorSwatch
- [ ] Test color display in light/dark themes
- [ ] Golden tests for color palettes
- [ ] Verify all colors are documented

**Integration Notes**:
- Route: /foundation/colors
- Links to theme page
- Referenced in component docs when discussing color props

**Demo**:
View colors page, see all color palettes with swatches. Toggle theme, see colors update. Copy code examples for accessing colors. Read accessibility guidance.

---

## Step 10: Foundation - Typography Documentation

**Objective**: Create comprehensive typography documentation.

**Implementation Guidance**:

1. Create `lib/pages/foundation/typography_page.dart` with sections:
   - Overview of typography system
   - SF Pro font family
   - Font weights (regular 400, medium 500, semibold 600, bold 700)
   - Typography scale
   - Line heights and spacing
   - Accessing typography from theme
   - Custom fonts
   - Responsive typography
   - Accessibility

2. Create font specimen widget:
```dart
class FontSpecimen extends StatelessWidget {
  final String name;
  final TextStyle style;
  final String sampleText;
  final String? code;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border.all(
          color: IosTheme.of(context).defaultColors.separator,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: IosTheme.of(context).defaultLabelColors.secondary,
            ),
          ),
          SizedBox(height: 12),
          Text(
            sampleText,
            style: style,
          ),
          SizedBox(height: 12),
          Text(
            'Size: ${style.fontSize?.toStringAsFixed(0)}px  •  '
            'Weight: ${style.fontWeight?.index}  •  '
            'Line height: ${(style.height ?? 1.0).toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Courier',
              color: IosTheme.of(context).defaultLabelColors.tertiary,
            ),
          ),
          if (code != null) ...[
            SizedBox(height: 12),
            CodeDisplay(
              code: code!,
              showCopyButton: false,
            ),
          ],
        ],
      ),
    );
  }
}
```

3. Display typography scale:
```dart
// Typography Scale
FontSpecimen(
  name: 'Large Title',
  sampleText: 'The quick brown fox jumps over the lazy dog',
  style: TextStyle(
    fontFamily: 'SF',
    fontSize: 34,
    fontWeight: FontWeight.w700,
    height: 1.2,
  ),
  code: '''
TextStyle(
  fontFamily: 'SF',
  fontSize: 34,
  fontWeight: FontWeight.w700,
)
''',
),

FontSpecimen(
  name: 'Title 1',
  sampleText: 'The quick brown fox jumps over the lazy dog',
  style: TextStyle(
    fontFamily: 'SF',
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 1.3,
  ),
  code: '...',
),
// ... more specimens
```

4. Show font weights:
```dart
Row(
  children: [
    FontWeightSample(
      label: 'Regular',
      weight: FontWeight.w400,
    ),
    FontWeightSample(
      label: 'Medium',
      weight: FontWeight.w500,
    ),
    FontWeightSample(
      label: 'Semibold',
      weight: FontWeight.w600,
    ),
    FontWeightSample(
      label: 'Bold',
      weight: FontWeight.w700,
    ),
  ],
)
```

5. Include examples for custom fonts and TextTheme integration

**Test Requirements**:
- [ ] Widget tests for TypographyPage
- [ ] Widget tests for FontSpecimen
- [ ] Test font display in light/dark themes
- [ ] Golden tests for typography specimens
- [ ] Verify all font weights display correctly

**Integration Notes**:
- Route: /foundation/typography
- Links to theme page
- Referenced in component docs for text styling

**Demo**:
View typography page, see all font specimens with sizes and weights. Copy code for text styles. Read about custom fonts and accessibility.

---

## Step 11: First Component Page (ButtonWidget)

**Objective**: Create complete documentation for ButtonWidget as template for other components.

**Implementation Guidance**:

1. Create `lib/data/models/component_metadata.dart` with data model (from design)

2. Create `lib/data/content/button_widget_metadata.dart`:
```dart
final buttonWidgetMetadata = ComponentMetadata(
  id: 'button-widget',
  name: 'ButtonWidget',
  category: 'Input',
  description: 'A versatile button component supporting various sizes, colors, icons, and states.',
  importStatement: "import 'package:ios_design_system/ios_design_system.dart';",
  quickExample: '''
ButtonWidget.label(
  size: LargeButtonSize(),
  color: BlueButtonColor(),
  onPressed: () => print('Tapped!'),
  label: 'Click Me',
)
''',
  quickPreview: ButtonWidget.label(
    size: LargeButtonSize(),
    color: BlueButtonColor(),
    onPressed: () {},
    label: 'Click Me',
  ),
  previewBuilder: (context, config) {
    final size = config.variation.properties['size'] as ButtonSize;
    final color = config.variation.properties['color'] as ButtonColor;
    final hasIcon = config.variation.properties['hasIcon'] as bool;

    if (hasIcon) {
      return ButtonWidget.label(
        size: size,
        color: color,
        onPressed: config.state?.enabled ?? true ? () {} : null,
        leftIcon: CupertinoIcons.star_fill,
        label: 'Button',
      );
    }

    return ButtonWidget.label(
      size: size,
      color: color,
      onPressed: config.state?.enabled ?? true ? () {} : null,
      label: 'Button',
    );
  },
  variations: [
    ComponentVariation(
      id: 'large-blue',
      name: 'Large Blue',
      description: 'Large button with blue color',
      properties: {
        'size': LargeButtonSize(),
        'color': BlueButtonColor(),
        'hasIcon': false,
      },
    ),
    ComponentVariation(
      id: 'large-blue-icon',
      name: 'Large Blue with Icon',
      description: 'Large button with blue color and left icon',
      properties: {
        'size': LargeButtonSize(),
        'color': BlueButtonColor(),
        'hasIcon': true,
      },
    ),
    ComponentVariation(
      id: 'medium-grey',
      name: 'Medium Grey',
      description: 'Medium button with transparent grey',
      properties: {
        'size': MediumButtonSize(),
        'color': GreyTransparentButtonColor(),
        'hasIcon': false,
      },
    ),
    // More variations...
  ],
  states: [
    ComponentState(
      id: 'default',
      name: 'Default',
      enabled: true,
    ),
    ComponentState(
      id: 'disabled',
      name: 'Disabled',
      enabled: false,
    ),
  ],
  properties: [
    PropertyDefinition(
      name: 'size',
      type: 'ButtonSize',
      description: 'The size of the button',
      defaultValue: 'LargeButtonSize()',
      isRequired: true,
    ),
    PropertyDefinition(
      name: 'color',
      type: 'ButtonColor',
      description: 'The color scheme of the button',
      defaultValue: 'BlueButtonColor()',
      isRequired: true,
    ),
    PropertyDefinition(
      name: 'onPressed',
      type: 'VoidCallback?',
      description: 'Callback when button is tapped. If null, button is disabled.',
      isRequired: false,
    ),
    PropertyDefinition(
      name: 'label',
      type: 'String',
      description: 'The text label displayed on the button',
      isRequired: true,
    ),
    PropertyDefinition(
      name: 'leftIcon',
      type: 'IconData?',
      description: 'Optional icon displayed to the left of the label',
      isRequired: false,
    ),
    PropertyDefinition(
      name: 'rightIcon',
      type: 'IconData?',
      description: 'Optional icon displayed to the right of the label',
      isRequired: false,
    ),
  ],
  examples: [
    CodeExample(
      title: 'Basic Button',
      description: 'A simple button with label',
      code: '''
ButtonWidget.label(
  size: LargeButtonSize(),
  color: BlueButtonColor(),
  onPressed: () {
    print('Button pressed');
  },
  label: 'Click Me',
)
''',
    ),
    CodeExample(
      title: 'Button with Icon',
      description: 'A button with left icon',
      code: '''
ButtonWidget.label(
  size: MediumButtonSize(),
  color: BlueButtonColor(),
  onPressed: () {},
  leftIcon: CupertinoIcons.add,
  label: 'Add Item',
)
''',
    ),
    CodeExample(
      title: 'Disabled Button',
      description: 'A button in disabled state',
      code: '''
ButtonWidget.label(
  size: LargeButtonSize(),
  color: BlueButtonColor(),
  onPressed: null, // null = disabled
  label: 'Disabled',
)
''',
    ),
  ],
  variants: [
    VariantInfo(
      name: 'ButtonWidget.label',
      description: 'Creates a button with text label',
    ),
    VariantInfo(
      name: 'ButtonWidget.icon',
      description: 'Creates an icon-only button',
    ),
  ],
  accessibility: AccessibilityInfo(
    guidelines: '''
- Always provide meaningful labels
- Ensure sufficient color contrast (4.5:1 minimum)
- Support keyboard navigation
- Include semantic labels for screen readers
- Disabled buttons should have appropriate ARIA attributes
''',
  ),
  relatedComponents: [
    'LabelButtonWidget',
    'CupertinoButtonWidget',
    'CloseButtonWidget',
  ],
  versionAdded: '1.0.0',
  status: ComponentStatus.stable,
);
```

3. Create `lib/pages/components/component_page.dart` as reusable template (from design)

4. Create `lib/pages/components/button_widget_page.dart`:
```dart
class ButtonWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ComponentPage(metadata: buttonWidgetMetadata);
  }
}
```

5. Add route for /components/button-widget

**Test Requirements**:
- [ ] Widget tests for ComponentPage template
- [ ] Test with ButtonWidget metadata
- [ ] Test all preview variations
- [ ] Test state switching (enabled/disabled)
- [ ] Test code copy
- [ ] Golden tests for component page
- [ ] Test navigation to related components

**Integration Notes**:
- ComponentPage is template for all component docs
- ButtonWidget is first, serves as reference
- Pattern repeatable for all other widgets

**Demo**:
Navigate to ButtonWidget page. See description and quick example. Interact with preview - change variations, toggle theme, switch states. Copy code examples. Click related component links.

---

## Step 12: Search Functionality

**Objective**: Implement search functionality for finding components and content.

**Implementation Guidance**:

1. Create `lib/core/services/search_service.dart`:
```dart
class SearchService {
  static final SearchService _instance = SearchService._internal();
  factory SearchService() => _instance;
  SearchService._internal();

  final List<SearchableItem> _searchIndex = [];

  void initialize(List<SearchableItem> items) {
    _searchIndex.clear();
    _searchIndex.addAll(items);
  }

  List<SearchResult> search(String query) {
    if (query.isEmpty) return [];

    final lowercaseQuery = query.toLowerCase();
    final results = <SearchResult>[];

    for (final item in _searchIndex) {
      double score = 0;

      // Title match (highest priority)
      if (item.title.toLowerCase().contains(lowercaseQuery)) {
        score += 100;
        if (item.title.toLowerCase().startsWith(lowercaseQuery)) {
          score += 50; // Boost for starts-with
        }
      }

      // Description match
      if (item.description.toLowerCase().contains(lowercaseQuery)) {
        score += 50;
      }

      // Keyword match
      for (final keyword in item.keywords) {
        if (keyword.toLowerCase().contains(lowercaseQuery)) {
          score += 25;
        }
      }

      // Type boost (prioritize components)
      if (item.type == 'component') {
        score *= 1.2;
      }

      if (score > 0) {
        results.add(SearchResult(
          item: item,
          score: score,
          matchedText: _findMatchedText(item, lowercaseQuery),
        ));
      }
    }

    // Sort by score descending
    results.sort((a, b) => b.score.compareTo(a.score));

    return results;
  }

  String? _findMatchedText(SearchableItem item, String query) {
    if (item.title.toLowerCase().contains(query)) {
      return item.title;
    }
    if (item.description.toLowerCase().contains(query)) {
      final index = item.description.toLowerCase().indexOf(query);
      final start = (index - 20).clamp(0, item.description.length);
      final end = (index + query.length + 20).clamp(0, item.description.length);
      return '...' + item.description.substring(start, end) + '...';
    }
    return null;
  }
}
```

2. Build search index:
```dart
// lib/data/content/search_index.dart
final searchIndex = [
  SearchableItem(
    id: 'button-widget',
    title: 'ButtonWidget',
    type: 'component',
    path: '/components/button-widget',
    description: 'A versatile button component supporting various sizes, colors, icons, and states.',
    keywords: ['button', 'tap', 'click', 'action', 'cta'],
    priority: 10,
  ),
  // ... all components, pages, etc.
];
```

3. Create search UI:
```dart
class SearchBar extends StatefulWidget {
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  List<SearchResult> _results = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
      _isSearching = _controller.text.isNotEmpty;
      _results = SearchService().search(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoSearchTextFieldWidget(
          controller: _controller,
          focusNode: _focusNode,
          placeholder: 'Search documentation...',
        ),
        if (_isSearching)
          _buildSearchResults(),
      ],
    );
  }

  Widget _buildSearchResults() {
    if (_results.isEmpty) {
      return Padding(
        padding: EdgeInsets.all(16),
        child: Text('No results found'),
      );
    }

    return Container(
      constraints: BoxConstraints(maxHeight: 400),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _results.length,
        itemBuilder: (context, index) {
          final result = _results[index];
          return SearchResultTile(
            result: result,
            onTap: () {
              _controller.clear();
              _focusNode.unfocus();
              context.go(result.item.path);
            },
          );
        },
      ),
    );
  }
}

class SearchResultTile extends StatelessWidget {
  final SearchResult result;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.all(12),
      onPressed: onTap,
      child: Row(
        children: [
          Icon(_getIconForType(result.item.type)),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  result.item.title,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                if (result.matchedText != null)
                  Text(
                    result.matchedText!,
                    style: TextStyle(
                      fontSize: 14,
                      color: IosTheme.of(context).defaultLabelColors.secondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
          Text(
            result.item.type,
            style: TextStyle(
              fontSize: 12,
              color: IosTheme.of(context).defaultLabelColors.tertiary,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForType(String type) {
    switch (type) {
      case 'component':
        return CupertinoIcons.cube_box;
      case 'foundation':
        return CupertinoIcons.square_grid_2x2;
      case 'pattern':
        return CupertinoIcons.layers;
      default:
        return CupertinoIcons.doc;
    }
  }
}
```

4. Add search to header
5. Initialize search index in main.dart

**Test Requirements**:
- [ ] Unit tests for SearchService
- [ ] Test search algorithm (exact, partial, fuzzy)
- [ ] Test ranking/scoring
- [ ] Widget tests for SearchBar
- [ ] Test search results display
- [ ] Performance test (search in < 200ms)
- [ ] Test keyboard shortcuts (Cmd+K to focus search)

**Integration Notes**:
- Search index built from all components and pages
- SearchService singleton accessible throughout app
- Search bar in header, always accessible

**Demo**:
Type "button" in search, see results instantly. Click result, navigate to page. Try partial matches, see ranked results. Test performance with various queries.

---

## Step 13: Additional Component Pages

**Objective**: Document remaining high-priority components using the established template.

**Implementation Guidance**:

Priority components to document (in order):
1. CupertinoTextFieldWidget
2. CupertinoSearchTextFieldWidget
3. CupertinoNavigatorBarWidget
4. ModalSheetWidget
5. GroupedTableWidget
6. TagWidget
7. IconWidget
8. SwitchWidget
9. RowWidget
10. ScaffoldWidget

For each component:
1. Create metadata file (following buttonWidgetMetadata pattern)
2. Create page file (using ComponentPage template)
3. Add to search index
4. Add route
5. Update navigation structure
6. Add tests

**Test Requirements**:
- [ ] Widget tests for each component page
- [ ] Test previews for each component
- [ ] Golden tests for each component page
- [ ] Verify all variations work
- [ ] Test search finds each component

**Integration Notes**:
- Follow exact same pattern as ButtonWidget
- Reuse ComponentPage template
- Group by category in navigation

**Demo**:
Navigate to any component page, see consistent structure. All features work (preview, variations, states, code copy). Search finds all components.

---

## Step 14: Patterns and Migration Guide

**Objective**: Create patterns documentation and migration guide from Cupertino.

**Implementation Guidance**:

1. Create patterns pages:
   - Forms pattern
   - Lists and tables pattern
   - Modals and sheets pattern
   - Navigation patterns
   - Search and filter pattern

2. Create `lib/pages/getting_started/comparison_page.dart`:
```dart
class ComparisonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'iOS Design System vs Flutter Cupertino',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 32),

          // Why choose iOS Design System
          _buildWhySection(context),

          SizedBox(height: 48),

          // Comparison table
          _buildComparisonTable(context),

          SizedBox(height: 48),

          // Migration guide
          _buildMigrationGuide(context),
        ],
      ),
    );
  }

  Widget _buildComparisonTable(BuildContext context) {
    return ComparisonTable(
      rows: [
        ComparisonRow(
          feature: 'Extensibility',
          cupertino: 'Tightly coupled to Flutter SDK',
          iosDesignSystem: 'Fully independent, easily customizable',
          advantage: Advantage.iosDesignSystem,
        ),
        ComparisonRow(
          feature: 'Theme System',
          cupertino: 'Limited theming options',
          iosDesignSystem: 'Comprehensive theme system with IosAnimatedTheme',
          advantage: Advantage.iosDesignSystem,
        ),
        ComparisonRow(
          feature: 'Color Palettes',
          cupertino: 'System colors only',
          iosDesignSystem: 'Multiple palettes (system, accessible, weather, stocks, etc.)',
          advantage: Advantage.iosDesignSystem,
        ),
        // More rows...
      ],
    );
  }

  Widget _buildMigrationGuide(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Migration Guide',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 16),

        MigrationExample(
          fromWidget: 'CupertinoButton',
          toWidget: 'ButtonWidget',
          fromCode: '''
CupertinoButton(
  color: CupertinoColors.activeBlue,
  onPressed: () {},
  child: Text('Click Me'),
)
''',
          toCode: '''
ButtonWidget.label(
  size: LargeButtonSize(),
  color: BlueButtonColor(),
  onPressed: () {},
  label: 'Click Me',
)
''',
          notes: 'ButtonWidget provides more size and color options',
        ),

        SizedBox(height: 24),

        MigrationExample(
          fromWidget: 'CupertinoNavigationBar',
          toWidget: 'CupertinoNavigatorBarWidget',
          fromCode: '''
CupertinoNavigationBar(
  middle: Text('Title'),
)
''',
          toCode: '''
CupertinoNavigatorBarWidget(
  title: 'Title',
  imageFilter: NavigatorBarImageFilter.enabled,
)
''',
          notes: 'Enhanced with image filter support and more customization',
        ),

        // More examples...
      ],
    );
  }
}
```

3. Create pattern pages with:
   - When to use this pattern
   - Code examples
   - Best practices
   - Common pitfalls
   - Related components

**Test Requirements**:
- [ ] Widget tests for comparison page
- [ ] Widget tests for pattern pages
- [ ] Test comparison table display
- [ ] Test migration examples
- [ ] Golden tests

**Integration Notes**:
- Routes: /getting-started/comparison, /patterns/*
- Linked from navigation
- Referenced in component docs where relevant

**Demo**:
View comparison page, see feature comparison table. Read migration examples. Navigate to pattern pages, see practical examples.

---

## Step 15: Mobile Responsiveness

**Objective**: Ensure documentation site works well on mobile and tablet.

**Implementation Guidance**:

1. Create responsive breakpoints:
```dart
enum ScreenSize {
  mobile,   // < 768px
  tablet,   // 768-1024px
  desktop,  // > 1024px
}

extension BuildContextExt on BuildContext {
  ScreenSize get screenSize {
    final width = MediaQuery.of(this).size.width;
    if (width < 768) return ScreenSize.mobile;
    if (width < 1024) return ScreenSize.tablet;
    return ScreenSize.desktop;
  }
}
```

2. Update DocumentationShell for responsive layout:
```dart
class DocumentationShell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = context.screenSize;

    return ScaffoldWidget(
      child: screenSize == ScreenSize.desktop
          ? _buildDesktopLayout()
          : _buildMobileLayout(),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        NavigationSidebar(...),
        Expanded(child: _buildMainContent()),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        MobileHeader(
          onMenuTap: () => _openDrawer(),
        ),
        Expanded(child: _buildMainContent()),
      ],
    );
  }
}
```

3. Create mobile navigation drawer:
```dart
class MobileNavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        children: [
          DrawerHeader(),
          Expanded(
            child: NavigationSidebar(...),
          ),
        ],
      ),
    );
  }
}
```

4. Make component previews responsive:
   - Stack vertically on mobile
   - Show controls at top
   - Reduce padding

5. Make code displays scrollable horizontally on mobile

6. Make comparison tables scrollable on mobile

**Test Requirements**:
- [ ] Widget tests for responsive layouts
- [ ] Test at mobile breakpoint (375px)
- [ ] Test at tablet breakpoint (768px)
- [ ] Test at desktop breakpoint (1280px)
- [ ] Test drawer opening/closing on mobile
- [ ] Golden tests at different breakpoints
- [ ] Test touch interactions on mobile

**Integration Notes**:
- All pages automatically responsive via DocumentationShell
- Component previews adapt to screen size
- Navigation drawer for mobile

**Demo**:
Resize browser from desktop to mobile, see layout adapt. On mobile, open drawer, navigate pages. View component previews on mobile, verify usable.

---

## Step 16: dartdoc Integration

**Objective**: Generate and integrate dartdoc API reference.

**Implementation Guidance**:

1. Add comprehensive dartdoc comments to all public APIs in main package:
```dart
/// A versatile button component supporting various sizes, colors, icons, and states.
///
/// The [ButtonWidget] provides a flexible button implementation with multiple
/// factory constructors for different use cases.
///
/// ## Example
///
/// ```dart
/// ButtonWidget.label(
///   size: LargeButtonSize(),
///   color: BlueButtonColor(),
///   onPressed: () => print('Tapped'),
///   label: 'Click Me',
/// )
/// ```
///
/// See also:
/// - [LabelButtonWidget] for text-only buttons
/// - [CupertinoButtonWidget] for Cupertino-style buttons
///
/// {@category Input}
class ButtonWidget extends StatelessWidget {
  /// Creates a button with a text label.
  ///
  /// The [size], [color], and [label] parameters must not be null.
  ///
  /// If [onPressed] is null, the button will be disabled.
  const ButtonWidget.label({
    required this.size,
    required this.color,
    required this.onPressed,
    required this.label,
    this.leftIcon,
    this.rightIcon,
    Key? key,
  }) : super(key: key);

  /// The size of the button.
  ///
  /// Determines the height, padding, and font size of the button.
  final ButtonSize size;

  /// The color scheme of the button.
  ///
  /// Defines the background color, text color, and pressed state colors.
  final ButtonColor color;

  /// Called when the button is tapped.
  ///
  /// If null, the button will be disabled and appear with reduced opacity.
  final VoidCallback? onPressed;

  /// The text label displayed on the button.
  final String label;

  /// Optional icon displayed to the left of the label.
  final IconData? leftIcon;

  /// Optional icon displayed to the right of the label.
  final IconData? rightIcon;

  // ... implementation
}
```

2. Add category tags to organize documentation:
```dart
/// {@category Input}
class ButtonWidget extends StatelessWidget { }

/// {@category Navigation}
class CupertinoNavigatorBarWidget extends StatelessWidget { }

/// {@category Theme}
class IosAnimatedTheme extends StatefulWidget { }
```

3. Create `dartdoc_options.yaml` in package root:
```yaml
dartdoc:
  categoryOrder:
    - "Theme"
    - "Colors"
    - "Typography"
    - "Layout"
    - "Navigation"
    - "Input"
    - "Display"
    - "Feedback"

  exclude:
    - 'lib/src/assets_gen/**'
    - 'lib/src/internal/**'

  showUndocumentedCategories: false
```

4. Create script to generate dartdoc:
```bash
# scripts/generate_docs.sh
#!/bin/bash

echo "Generating dartdoc..."
cd ..
dart doc --output docs_app/web/api

echo "dartdoc generated at docs_app/web/api"
```

5. Update GitHub Actions workflow to generate dartdoc:
```yaml
- name: Generate dartdoc
  run: |
    cd /path/to/package
    dart doc --output ../docs_app/web/api
```

6. Add link to API reference in documentation site header:
```dart
CupertinoButton(
  onPressed: () => launchUrl(Uri.parse('/api/index.html')),
  child: Text('API Reference'),
)
```

7. Create `/api` redirect page if needed

**Test Requirements**:
- [ ] Verify all public APIs have dartdoc comments
- [ ] Test dartdoc generation locally
- [ ] Verify categories work correctly
- [ ] Test links between tutorial docs and API docs
- [ ] Verify dartdoc displays correctly in browser

**Integration Notes**:
- dartdoc generated during build process
- Hosted at /api subdirectory
- Linked from main documentation site
- Shares same domain (no CORS issues)

**Demo**:
Click "API Reference" in header, see dartdoc. Browse categories, find ButtonWidget. See comprehensive documentation with examples. Click "See also" links, navigate to related classes.

---

## Step 17: Core Claude Code Skills

**Objective**: Create foundational Claude Code skills for quick start, theme, colors, and typography.

**Implementation Guidance**:

1. Create `.claude/skills/ios-quick-start/SKILL.md`:
```markdown
---
name: ios-quick-start
description: |
  Guide developers through setting up iOS Design System in a new Flutter
  project within 10 minutes, including installation, basic configuration,
  and first component implementation.
type: anthropic-skill
version: "1.0"
---

# iOS Design System - Quick Start

## Overview

This skill helps you set up iOS Design System in a Flutter project in under 10 minutes.
By the end, you'll have the package installed, theme configured, and your first component working.

## Prerequisites

- Flutter SDK (>=3.7.0)
- An existing Flutter project or willingness to create one

## Steps

### Step 1: Add Dependency

Add iOS Design System to your `pubspec.yaml`:

```yaml
dependencies:
  ios_design_system:
    git:
      url: https://github.com/your-org/ios_design_system.git
```

Then run:
```bash
flutter pub get
```

### Step 2: Import Package

In your Dart file (usually `lib/main.dart`):

```dart
import 'package:ios_design_system/ios_design_system.dart';
```

### Step 3: Setup Theme

Wrap your app with `IosAnimatedTheme`:

```dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData = IosLightThemeData();

    return IosAnimatedTheme(
      data: themeData,
      child: CupertinoApp(
        title: 'My App',
        theme: CupertinoThemeData(
          brightness: themeData.brightness,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
```

### Step 4: Use Your First Component

Add a button to your page:

```dart
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      navigationBar: CupertinoNavigatorBarWidget(
        title: 'Hello World',
      ),
      child: Center(
        child: ButtonWidget.label(
          size: LargeButtonSize(),
          color: BlueButtonColor(),
          onPressed: () {
            print('Button pressed!');
          },
          label: 'Click Me',
        ),
      ),
    );
  }
}
```

### Step 5: Run Your App

```bash
flutter run
```

You should see your app with a navigation bar and a blue button!

## Next Steps

- Explore more components: `/components`
- Learn about theme customization: `/foundation/theme`
- Understand the color system: `/foundation/colors`
- Read typography docs: `/foundation/typography`

## Troubleshooting

**Issue**: Package not found or version conflict
- **Solution**: Ensure Flutter SDK version is >=3.7.0. Run `flutter doctor` to check.

**Issue**: Theme not applying
- **Solution**: Make sure `IosAnimatedTheme` wraps `CupertinoApp`, not inside it.

**Issue**: Button not showing
- **Solution**: Verify you imported the package correctly and wrapped app with theme.

## Related Skills

- `ios-theme-setup` - Deeper dive into theme configuration
- `ios-button-widget` - Learn more about ButtonWidget options
```

2. Create `.claude/skills/ios-theme-setup/SKILL.md` (similar structure)
3. Create `.claude/skills/ios-colors-guide/SKILL.md` (similar structure)
4. Create `.claude/skills/ios-typography-guide/SKILL.md` (similar structure)

5. Create validation script:
```python
# scripts/validate_skills.py
import yaml
import os
import sys

def validate_skill(skill_path):
    """Validate skill structure and content"""
    skill_md_path = os.path.join(skill_path, 'SKILL.md')

    if not os.path.exists(skill_md_path):
        print(f"❌ {skill_path}: Missing SKILL.md")
        return False

    with open(skill_md_path, 'r') as f:
        content = f.read()

    # Check frontmatter
    if not content.startswith('---'):
        print(f"❌ {skill_path}: Missing frontmatter")
        return False

    try:
        parts = content.split('---')
        frontmatter = yaml.safe_load(parts[1])
    except:
        print(f"❌ {skill_path}: Invalid YAML frontmatter")
        return False

    # Check required fields
    required_fields = ['name', 'description', 'type', 'version']
    for field in required_fields:
        if field not in frontmatter:
            print(f"❌ {skill_path}: Missing '{field}' in frontmatter")
            return False

    # Check description length
    if len(frontmatter['description']) < 50:
        print(f"❌ {skill_path}: Description too short (< 50 chars)")
        return False

    # Check content sections
    required_sections = ['## Overview', '## Steps']
    for section in required_sections:
        if section not in content:
            print(f"❌ {skill_path}: Missing '{section}' section")
            return False

    # Check code blocks
    code_blocks = content.count('```dart') + content.count('```yaml') + content.count('```bash')
    if code_blocks < 2:
        print(f"⚠️  {skill_path}: Only {code_blocks} code blocks (recommend >= 2)")

    # Check file size
    if len(content) > 5000 * 10:  # 5000 words ~= 50,000 chars
        print(f"⚠️  {skill_path}: Content may be too long (> 5000 words)")

    print(f"✓ {skill_path}: Valid")
    return True

if __name__ == '__main__':
    skills_dir = '.claude/skills'

    if not os.path.exists(skills_dir):
        print(f"❌ Skills directory not found: {skills_dir}")
        sys.exit(1)

    all_valid = True
    for skill_name in os.listdir(skills_dir):
        skill_path = os.path.join(skills_dir, skill_name)
        if os.path.isdir(skill_path):
            if not validate_skill(skill_path):
                all_valid = False

    if all_valid:
        print("\n✓ All skills validated successfully!")
        sys.exit(0)
    else:
        print("\n❌ Some skills failed validation")
        sys.exit(1)
```

6. Run validation: `python scripts/validate_skills.py`

**Test Requirements**:
- [ ] Validate all skills with validation script
- [ ] Manual testing: invoke each skill in Claude Code
- [ ] Verify code examples work when copied
- [ ] Test links to documentation
- [ ] Verify troubleshooting sections are helpful
- [ ] Check frontmatter descriptions are specific

**Integration Notes**:
- Skills stored in `.claude/skills/` directory
- Each skill in its own subdirectory
- Validation runs in CI/CD
- Documentation site links to skills

**Demo**:
In Claude Code, ask "how do I set up ios design system?" Verify skill loads. Follow instructions, verify they work. Test other skills similarly.

---

## Step 18: Widget-Specific Skills

**Objective**: Create Claude Code skills for specific widgets.

**Implementation Guidance**:

Create skills for these widgets (following same pattern as Step 17):
1. `ios-button-widget`
2. `ios-text-fields`
3. `ios-navigation-bar`
4. `ios-modal-sheet`
5. `ios-grouped-table`
6. `ios-cupertino-migration`

Each skill should include:
- Clear description in frontmatter
- Overview section
- Steps/usage section
- Multiple code examples
- Common variations
- Troubleshooting section
- Related skills/docs links

**Test Requirements**:
- [ ] Run validation script on all skills
- [ ] Manual test each skill in Claude Code
- [ ] Verify examples are correct and complete
- [ ] Test in real development scenario

**Integration Notes**:
- Skills complement web documentation
- Provide quick, in-editor help
- Link to full docs for deep dives

**Demo**:
Ask Claude Code about specific widgets, see appropriate skill load. Follow guidance, successfully implement widget.

---

## Step 19: README Update

**Objective**: Update main package README to be minimal and direct users to documentation.

**Implementation Guidance**:

1. Update `README.md`:
```markdown
# iOS Design System

An extensible, autonomous alternative to Flutter's Cupertino components. Build beautiful iOS apps with more flexibility and control.

## Quick Start

```dart
import 'package:ios_design_system/ios_design_system.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IosAnimatedTheme(
      data: IosLightThemeData(),
      child: CupertinoApp(
        home: ScaffoldWidget(
          child: ButtonWidget.label(
            size: LargeButtonSize(),
            color: BlueButtonColor(),
            onPressed: () {},
            label: 'Hello World',
          ),
        ),
      ),
    );
  }
}
```

## Documentation

📚 **[View Full Documentation](https://your-org.github.io/ios_design_system/)**

- [Quick Start Guide](https://your-org.github.io/ios_design_system/getting-started/quick-start)
- [Foundation (Theme, Colors, Typography)](https://your-org.github.io/ios_design_system/foundation/theme)
- [Components Reference](https://your-org.github.io/ios_design_system/components)
- [API Reference](https://your-org.github.io/ios_design_system/api)
- [Migration from Flutter Cupertino](https://your-org.github.io/ios_design_system/getting-started/comparison)

## Features

- 🎨 **Comprehensive Theme System** - Full light/dark mode support with IosAnimatedTheme
- 🎯 **Extensible Components** - Independent from Flutter's core, fully customizable
- 🌈 **Rich Color Palettes** - System, accessible, and specialized color schemes
- ✍️ **SF Pro Typography** - Authentic iOS typography with multiple weights
- ♿ **Accessibility First** - WCAG compliant with screen reader support
- 📦 **Production Ready** - Battle-tested components with comprehensive tests

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  ios_design_system:
    git:
      url: https://github.com/your-org/ios_design_system.git
```

Then run:
```bash
flutter pub get
```

## Why iOS Design System?

Unlike Flutter's built-in Cupertino widgets, iOS Design System is:
- **Autonomous** - Independent from Flutter SDK, update on your schedule
- **Extensible** - Easy to customize and extend without forking
- **Comprehensive** - More components, themes, and patterns out of the box

[See detailed comparison →](https://your-org.github.io/ios_design_system/getting-started/comparison)

## Development

### Development Setup

See [Development Setup](./docs/development-setup.md) for MCP and Ralph configuration.

### Contributing

Contributions are welcome! Please read our [Contributing Guide](./CONTRIBUTING.md).

## License

[Your License Here]

## Support

- 📖 [Documentation](https://your-org.github.io/ios_design_system/)
- 🐛 [Issue Tracker](https://github.com/your-org/ios_design_system/issues)
- 💬 [Discussions](https://github.com/your-org/ios_design_system/discussions)
```

2. Keep existing Development Setup section (MCP, Ralph) as-is

**Test Requirements**:
- [ ] Verify all links work
- [ ] Test code example
- [ ] Ensure minimal (<200 lines)
- [ ] Check formatting in GitHub

**Integration Notes**:
- README is entry point for new users
- Directs to comprehensive documentation
- Quick example shows simplicity

**Demo**:
View README on GitHub, see clear description. Click documentation link, land on docs site. Copy quick start code, verify it works.

---

## Step 20: GitHub Actions CI/CD Setup

**Objective**: Automate build and deployment to GitHub Pages.

**Implementation Guidance**:

1. Create `.github/workflows/deploy-docs.yml`:
```yaml
name: Deploy Documentation

on:
  push:
    branches: [main]
  workflow_dispatch:

permissions:
  contents: write
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: true

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Setup Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.27.x'
          channel: 'stable'
          cache: true

      - name: Install dependencies
        run: |
          cd docs_app
          flutter pub get

      - name: Build Flutter web app
        run: |
          cd docs_app
          flutter build web --release --base-href "/ios_design_system/"

      - name: Generate dartdoc
        run: |
          dart doc --output docs_app/build/web/api

      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./docs_app/build/web
          cname: # Add custom domain if needed

      - name: Create issue on failure
        if: failure()
        uses: actions/github-script@v6
        with:
          script: |
            await github.rest.issues.create({
              owner: context.repo.owner,
              repo: context.repo.repo,
              title: '📚 Documentation deployment failed',
              body: `Documentation deployment failed in workflow run: ${context.serverUrl}/${context.repo.owner}/${context.repo.repo}/actions/runs/${context.runId}`,
              labels: ['bug', 'documentation', 'ci/cd']
            })
```

2. Configure GitHub Pages settings:
   - Go to repository Settings > Pages
   - Source: "GitHub Actions"
   - Save

3. Create workflow for PR previews (optional):
```yaml
name: Preview Documentation

on:
  pull_request:
    paths:
      - 'docs_app/**'
      - 'lib/**'
      - '.github/workflows/preview-docs.yml'

jobs:
  preview:
    runs-on: ubuntu-latest
    steps:
      # Similar to deploy workflow but with preview comment
      # ... build steps ...

      - name: Comment preview URL
        uses: actions/github-script@v6
        with:
          script: |
            await github.rest.issues.createComment({
              owner: context.repo.owner,
              repo: context.repo.repo,
              issue_number: context.issue.number,
              body: '📚 Documentation preview: [View Preview](preview-url)'
            })
```

4. Add build status badge to README:
```markdown
[![Documentation](https://github.com/your-org/ios_design_system/workflows/Deploy%20Documentation/badge.svg)](https://github.com/your-org/ios_design_system/actions)
```

**Test Requirements**:
- [ ] Test workflow runs successfully
- [ ] Verify deployment to GitHub Pages
- [ ] Test build time (< 5 minutes)
- [ ] Test failure handling (create test failure)
- [ ] Verify issue created on failure
- [ ] Test PR preview workflow (if implemented)

**Integration Notes**:
- Workflow triggers on push to main
- Can be triggered manually
- Creates issue on failure for visibility
- Deploys to gh-pages branch

**Demo**:
Push changes to main branch. Watch GitHub Actions run. Once complete, visit GitHub Pages URL. See updated documentation. Test with intentional failure, verify issue created.

---

## Step 21: Performance Optimization

**Objective**: Optimize documentation site for fast loading and smooth interaction.

**Implementation Guidance**:

1. Implement lazy loading for component previews:
```dart
class LazyComponentPreview extends StatefulWidget {
  final Widget Function() builder;

  @override
  State<LazyComponentPreview> createState() => _LazyComponentPreviewState();
}

class _LazyComponentPreviewState extends State<LazyComponentPreview> {
  Widget? _preview;

  @override
  void initState() {
    super.initState();
    // Load preview after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => _preview = widget.builder());
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_preview == null) {
      return Center(child: CupertinoActivityIndicator());
    }
    return _preview!;
  }
}
```

2. Optimize images:
   - Compress screenshots
   - Use WebP format where supported
   - Lazy load images

3. Implement code splitting (if supported):
   - Split large component metadata into separate files
   - Load on-demand

4. Add caching:
```dart
class SearchService {
  final Map<String, List<SearchResult>> _cache = {};

  List<SearchResult> search(String query) {
    if (_cache.containsKey(query)) {
      return _cache[query]!;
    }

    final results = _performSearch(query);
    _cache[query] = results;
    return results;
  }
}
```

5. Optimize Flutter web build:
```bash
flutter build web \
  --release \
  --web-renderer canvaskit \
  --dart-define=FLUTTER_WEB_USE_SKIA=true \
  --source-maps \
  --pwa-strategy offline-first
```

6. Add loading indicators for slow operations

7. Implement virtual scrolling for long lists

**Test Requirements**:
- [ ] Measure load time (should be < 3 seconds on 3G)
- [ ] Test Lighthouse score (aim for > 90)
- [ ] Test Time to Interactive
- [ ] Test First Contentful Paint
- [ ] Profile with Flutter DevTools
- [ ] Test on slow connection
- [ ] Test on mobile device

**Integration Notes**:
- Performance optimizations applied throughout app
- No functional changes, only performance improvements
- Trade-offs documented (e.g., CanvasKit vs HTML renderer)

**Demo**:
Run Lighthouse audit, see improved scores. Test on throttled connection, verify acceptable load time. Navigate between pages, verify smooth transitions.

---

## Step 22: Testing, Documentation, and Launch

**Objective**: Final testing, documentation polish, and launch preparation.

**Implementation Guidance**:

1. **Comprehensive Testing**:
   - Run all unit tests: `flutter test`
   - Run widget tests with coverage
   - Run integration tests
   - Manual testing checklist:
     - [ ] Test all navigation paths
     - [ ] Test all component previews
     - [ ] Test theme switching throughout
     - [ ] Test search functionality
     - [ ] Test code copy on all pages
     - [ ] Test on mobile devices
     - [ ] Test on different browsers (Chrome, Safari, Firefox)
     - [ ] Test keyboard navigation
     - [ ] Test screen reader compatibility
     - [ ] Test all links (internal and external)

2. **Validate Claude Code Skills**:
   - Run validation script
   - Manual test each skill
   - Verify examples are current

3. **Content Review**:
   - Proofread all documentation pages
   - Verify code examples are correct
   - Check for broken links
   - Verify images/screenshots are current
   - Ensure consistent voice and style

4. **Performance Validation**:
   - Run Lighthouse audit on key pages
   - Verify load times meet requirements
   - Test on slow connections

5. **Accessibility Audit**:
   - Run automated accessibility checks
   - Manual testing with screen reader
   - Verify WCAG 2.1 AA compliance
   - Test keyboard navigation

6. **Create Launch Checklist**:
```markdown
## Pre-Launch Checklist

### Documentation Site
- [ ] All pages load correctly
- [ ] All component previews work
- [ ] Search returns accurate results
- [ ] Theme switching works everywhere
- [ ] Mobile layout is usable
- [ ] All code examples are copy-able
- [ ] dartdoc API reference is accessible
- [ ] Performance meets requirements (< 3s load)
- [ ] Lighthouse score > 90
- [ ] No console errors

### Claude Code Skills
- [ ] All skills validate successfully
- [ ] Skills load when expected
- [ ] Code examples work when copied
- [ ] Troubleshooting sections are helpful

### README
- [ ] Links work
- [ ] Quick start example works
- [ ] Badges display correctly

### CI/CD
- [ ] Workflow runs successfully
- [ ] Deployment completes in < 5 minutes
- [ ] Failure creates issue automatically

### Content
- [ ] All components documented
- [ ] Foundation pages complete
- [ ] Getting Started guide accurate
- [ ] Comparison guide comprehensive
- [ ] Migration examples tested

### Accessibility
- [ ] WCAG 2.1 AA compliant
- [ ] Screen reader compatible
- [ ] Keyboard navigable
- [ ] Sufficient color contrast

### Cross-Browser
- [ ] Tested in Chrome
- [ ] Tested in Safari
- [ ] Tested in Firefox
- [ ] Tested in Edge (if applicable)

### Mobile
- [ ] Tested on iOS device
- [ ] Tested on Android device
- [ ] Touch interactions work
- [ ] Mobile layout is usable
```

7. **Soft Launch**:
   - Deploy to GitHub Pages
   - Share with internal team
   - Gather feedback
   - Make adjustments

8. **Public Launch**:
   - Announce on relevant channels
   - Update package description to link to docs
   - Publish blog post (optional)
   - Share on social media (optional)

9. **Post-Launch Monitoring**:
   - Monitor GitHub Actions for deployment issues
   - Watch for bug reports
   - Track analytics (if implemented)
   - Collect user feedback

**Test Requirements**:
- [ ] All tests pass
- [ ] Coverage > 80%
- [ ] No known critical bugs
- [ ] Performance requirements met
- [ ] Accessibility requirements met

**Integration Notes**:
- This is final validation before launch
- All previous steps should be complete
- Focus on polish and quality

**Demo**:
Walk through entire documentation site as a new user. Follow Quick Start guide. Explore components. Use search. Test on mobile. Verify everything works perfectly.

---

## Completion Criteria

The project is complete when:

✅ All 22 steps are checked off
✅ Pre-launch checklist is fully satisfied
✅ Documentation site is live on GitHub Pages
✅ Users can set up iOS Design System in < 10 minutes
✅ All components are documented with interactive previews
✅ Claude Code skills are functional and helpful
✅ README directs users to comprehensive documentation
✅ CI/CD automatically deploys changes
✅ Site is accessible, performant, and mobile-friendly

---

**Estimated Timeline**: 4-6 weeks with dedicated effort

**Priority**: Foundation → Components → Polish

**Guiding Principle**: Each step delivers working, demoable functionality. No orphaned code. Build incrementally with continuous integration and testing.

---

**Version**: 1.0
**Date**: 2026-02-17
