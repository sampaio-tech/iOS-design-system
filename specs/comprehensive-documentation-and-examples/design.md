# iOS Design System - Comprehensive Documentation and Examples
## Detailed Design Document

---

## Overview

This document outlines the design for comprehensive documentation of the iOS Design System - a Flutter package that provides an extensible alternative to Flutter's built-in Cupertino components. The documentation solution includes an interactive web-based documentation site, API reference, Claude Code skills, and an updated README, all designed to help Flutter developers new to the system get started within 10 minutes.

### Project Goals

1. **Enable rapid onboarding**: Developers can set up the design system in a new Flutter project within 10 minutes
2. **Comprehensive coverage**: Document all widgets, theme system, colors, typography, and features
3. **Interactive learning**: Provide live widget previews with light/dark theme and state variations
4. **Multiple learning paths**: Support both tutorial-style learning and reference-style lookup
5. **Clear positioning**: Explain advantages over Flutter's Cupertino with migration guidance

### Target Audience

Flutter developers who are new to the iOS Design System and need:
- Quick start guides to get up and running
- Interactive examples to explore components
- Clear API documentation for reference
- Migration guidance from Flutter's Cupertino
- In-editor help via Claude Code skills

---

## Detailed Requirements

### Functional Requirements

#### FR1: Interactive Documentation Website
- **FR1.1**: Flutter web application hosted on GitHub Pages
- **FR1.2**: Interactive widget previews showing components in action
- **FR1.3**: Theme toggle for light/dark mode switching
- **FR1.4**: Variation controls (size, color, state) for each component
- **FR1.5**: Live code examples with syntax highlighting
- **FR1.6**: Progressive examples (minimal → complete)
- **FR1.7**: Responsive design for desktop, tablet, mobile
- **FR1.8**: Search functionality across all documentation
- **FR1.9**: Clear navigation with sidebar and breadcrumbs

#### FR2: Documentation Content Structure
- **FR2.1**: Getting Started section with 10-minute quick start
- **FR2.2**: Foundation section covering theme, colors, typography, spacing
- **FR2.3**: Components section with all widgets organized by category
- **FR2.4**: Patterns section with common usage patterns
- **FR2.5**: API Reference section (dartdoc integration)
- **FR2.6**: Migration guide from Flutter's Cupertino
- **FR2.7**: Comparison tables showing advantages over Cupertino

#### FR3: Component Documentation
For each component, provide:
- **FR3.1**: Brief description and purpose
- **FR3.2**: Interactive preview with variations
- **FR3.3**: Installation/import instructions
- **FR3.4**: Progressive code examples (basic → advanced)
- **FR3.5**: Properties/API table
- **FR3.6**: Usage guidelines and best practices
- **FR3.7**: Accessibility considerations
- **FR3.8**: Related components links

#### FR4: Foundation Documentation
- **FR4.1**: Theme system documentation
  - Light and dark theme setup
  - IosAnimatedTheme usage
  - Custom theme creation
  - Theme access patterns
- **FR4.2**: Color system documentation
  - All color palettes with visual swatches
  - Semantic color meanings
  - Accessibility (WCAG) compliance
  - Custom color schemes
  - Usage examples in components
- **FR4.3**: Typography documentation
  - Font weights and sizes
  - Typography hierarchy
  - Typographic properties
  - Custom font configuration
  - Responsive typography
  - TextTheme integration

#### FR5: Claude Code Skills
Create skills for:
- **FR5.1**: `ios-quick-start` - 10-minute setup guide
- **FR5.2**: `ios-theme-setup` - Theme configuration
- **FR5.3**: `ios-colors-guide` - Color system usage
- **FR5.4**: `ios-typography-guide` - Typography implementation
- **FR5.5**: `ios-button-widget` - Button widget usage
- **FR5.6**: `ios-text-fields` - Text field widgets
- **FR5.7**: `ios-navigation-bar` - Navigation bar setup
- **FR5.8**: `ios-modal-sheet` - Modal sheet implementation
- **FR5.9**: `ios-grouped-table` - Grouped table creation
- **FR5.10**: `ios-cupertino-migration` - Migration from Cupertino

#### FR6: API Reference (dartdoc)
- **FR6.1**: Generate complete API documentation using dartdoc
- **FR6.2**: Host at `/api` subdirectory
- **FR6.3**: Unified navigation between tutorial and API docs
- **FR6.4**: Category-based organization using `@category` tags
- **FR6.5**: Cross-references between related components

#### FR7: README Update
- **FR7.1**: Clear project description and positioning
- **FR7.2**: Link to comprehensive documentation
- **FR7.3**: Quick start snippet (< 5 lines)
- **FR7.4**: Keep minimal - direct users to full docs

### Non-Functional Requirements

#### NFR1: Performance
- **NFR1.1**: Documentation site loads in < 3 seconds on 3G
- **NFR1.2**: Interactive previews render in < 500ms
- **NFR1.3**: Search results appear in < 200ms
- **NFR1.4**: Page navigation is instant (no full reloads)

#### NFR2: Accessibility
- **NFR2.1**: WCAG 2.1 AA compliance
- **NFR2.2**: Keyboard navigation support
- **NFR2.3**: Screen reader compatibility
- **NFR2.4**: Sufficient color contrast ratios
- **NFR2.5**: Semantic HTML structure

#### NFR3: Maintainability
- **NFR3.1**: Automated deployment via GitHub Actions
- **NFR3.2**: Documentation updates deployable in < 5 minutes
- **NFR3.3**: Content separated from presentation logic
- **NFR3.4**: Version control for all documentation

#### NFR4: Usability
- **NFR4.1**: Users find components in < 30 seconds
- **NFR4.2**: Clear visual hierarchy
- **NFR4.3**: Consistent navigation patterns
- **NFR4.4**: Mobile-friendly interface

---

## Architecture Overview

### High-Level Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                     GitHub Repository                        │
│                                                              │
│  ┌────────────────┐  ┌──────────────┐  ┌─────────────────┐ │
│  │   Source Code  │  │ Markdown     │  │ Claude Skills   │ │
│  │   (lib/)       │  │ Docs (/docs) │  │ (.claude/)      │ │
│  └────────────────┘  └──────────────┘  └─────────────────┘ │
│           │                  │                   │          │
└───────────┼──────────────────┼───────────────────┼──────────┘
            │                  │                   │
            ▼                  ▼                   ▼
    ┌───────────────┐  ┌──────────────┐  ┌─────────────────┐
    │   dart doc    │  │  Flutter Web │  │  Skills         │
    │   Generation  │  │  Build       │  │  Distribution   │
    └───────┬───────┘  └──────┬───────┘  └─────────────────┘
            │                  │
            │                  │
            ▼                  ▼
    ┌───────────────────────────────────┐
    │      GitHub Actions CI/CD         │
    │  - Build Flutter web app          │
    │  - Generate dartdoc               │
    │  - Deploy to GitHub Pages         │
    └───────────────┬───────────────────┘
                    │
                    ▼
    ┌───────────────────────────────────┐
    │       GitHub Pages (Hosting)      │
    │                                   │
    │  ┌─────────────────────────────┐ │
    │  │  Documentation Website      │ │
    │  │  (Flutter Web App)          │ │
    │  │  - Getting Started          │ │
    │  │  - Foundation               │ │
    │  │  - Components               │ │
    │  │  - Patterns                 │ │
    │  └─────────────────────────────┘ │
    │                                   │
    │  ┌─────────────────────────────┐ │
    │  │  /api/                      │ │
    │  │  (Generated dartdoc)        │ │
    │  └─────────────────────────────┘ │
    └───────────────────────────────────┘
```

### Technology Stack

| Layer | Technology | Rationale |
|-------|-----------|-----------|
| Documentation Website | Flutter Web | Native widget rendering, full control over UX, theme switching built-in |
| UI Framework | Cupertino + iOS Design System | Dogfooding our own components |
| State Management | Provider | Simple, proven, suitable for theme/navigation state |
| Routing | go_router | Declarative routing, deep linking support |
| Syntax Highlighting | flutter_highlight | Dart/Flutter code highlighting |
| API Documentation | dartdoc | Official Dart documentation tool |
| Hosting | GitHub Pages | Free, integrated with repository, CDN |
| CI/CD | GitHub Actions | Automated builds and deployments |
| Skills | Markdown (Claude Code) | Native Claude Code format |

### Component Architecture

```
Documentation Web App
│
├── Core Infrastructure
│   ├── Theme Provider (light/dark switching)
│   ├── Navigation Service (routing)
│   ├── Search Service (component/doc search)
│   └── Analytics (usage tracking)
│
├── Shared Components
│   ├── App Shell (header, sidebar, footer)
│   ├── Component Preview Widget
│   ├── Code Display Widget
│   ├── Property Table Widget
│   ├── Variation Selector Widget
│   └── Theme Toggle Widget
│
├── Pages
│   ├── Home Page
│   ├── Getting Started Pages
│   ├── Foundation Pages
│   │   ├── Theme Page
│   │   ├── Colors Page
│   │   └── Typography Page
│   ├── Component Pages (one per widget)
│   ├── Patterns Pages
│   └── Migration Guide Page
│
└── Data
    ├── Component Metadata
    ├── Code Examples
    └── Navigation Structure
```

---

## Components and Interfaces

### 1. Documentation Web App Components

#### 1.1 App Shell

**Purpose**: Provides consistent layout and navigation across all pages

**Interface**:
```dart
class DocumentationShell extends StatelessWidget {
  final Widget child;
  final String currentPath;

  const DocumentationShell({
    required this.child,
    required this.currentPath,
  });
}
```

**Components**:
- **Header**: Logo, search, theme toggle, GitHub link
- **Sidebar**: Collapsible navigation tree with active state
- **Main Content Area**: Child page content
- **Footer**: Links, copyright, version info

#### 1.2 Component Preview Widget

**Purpose**: Reusable widget for displaying interactive component previews

**Interface**:
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
}

class PreviewConfig {
  final ThemeData theme;
  final ComponentVariation variation;
  final ComponentState state;
}

class ComponentVariation {
  final String id;
  final String name;
  final String description;
  final Map<String, dynamic> properties;
}

class ComponentState {
  final String id;
  final String name;
  final bool enabled;
  final bool selected;
  final bool hovered;
}
```

#### 1.3 Code Display Widget

**Purpose**: Display code snippets with syntax highlighting and copy button

**Interface**:
```dart
class CodeDisplay extends StatelessWidget {
  final String code;
  final String language;
  final bool showLineNumbers;
  final bool showCopyButton;
  final int? highlightLines;

  const CodeDisplay({
    required this.code,
    this.language = 'dart',
    this.showLineNumbers = true,
    this.showCopyButton = true,
    this.highlightLines,
  });
}
```

#### 1.4 Progressive Example Widget

**Purpose**: Show examples that build from simple to complex

**Interface**:
```dart
class ProgressiveExample extends StatefulWidget {
  final List<ExampleStep> steps;
  final bool showAllByDefault;

  const ProgressiveExample({
    required this.steps,
    this.showAllByDefault = false,
  });
}

class ExampleStep {
  final String title;
  final String description;
  final String code;
  final Widget? preview;
}
```

#### 1.5 Properties Table Widget

**Purpose**: Display component properties in structured format

**Interface**:
```dart
class PropertiesTable extends StatelessWidget {
  final List<PropertyDefinition> properties;

  const PropertiesTable({
    required this.properties,
  });
}

class PropertyDefinition {
  final String name;
  final String type;
  final String description;
  final String? defaultValue;
  final bool isRequired;
}
```

#### 1.6 Theme Provider

**Purpose**: Manage theme state across the application

**Interface**:
```dart
class DocumentationThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  IosThemeData get lightTheme => IosLightThemeData();
  IosThemeData get darkTheme => IosDarkThemeData();

  void setTheme(ThemeMode mode) {
    _themeMode = mode;
    _persistTheme(mode);
    notifyListeners();
  }

  Future<void> _persistTheme(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme_mode', mode.toString());
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString('theme_mode');
    if (savedTheme != null) {
      _themeMode = ThemeMode.values.firstWhere(
        (e) => e.toString() == savedTheme,
        orElse: () => ThemeMode.system,
      );
      notifyListeners();
    }
  }
}
```

### 2. Page Templates

#### 2.1 Component Page Template

**Structure**:
```dart
class ComponentPage extends StatelessWidget {
  final ComponentMetadata metadata;

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          ComponentHeader(
            name: metadata.name,
            description: metadata.description,
            versionAdded: metadata.versionAdded,
            status: metadata.status,
          ),

          // Quick Example
          QuickExample(
            code: metadata.quickExample,
            preview: metadata.quickPreview,
          ),

          // Interactive Preview
          ComponentPreview(
            componentName: metadata.name,
            builder: metadata.previewBuilder,
            variations: metadata.variations,
            states: metadata.states,
          ),

          // Installation
          InstallationSection(
            importStatement: metadata.importStatement,
          ),

          // Usage
          UsageSection(
            examples: metadata.examples,
          ),

          // API
          PropertiesTable(
            properties: metadata.properties,
          ),

          // Variants
          VariantsSection(
            variants: metadata.variants,
          ),

          // Accessibility
          AccessibilitySection(
            guidelines: metadata.accessibility,
          ),

          // Related Components
          RelatedComponentsSection(
            components: metadata.relatedComponents,
          ),
        ],
      ),
    );
  }
}
```

#### 2.2 Foundation Page Template

**Structure**:
```dart
class FoundationPage extends StatelessWidget {
  final FoundationMetadata metadata;

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Overview
          OverviewSection(
            title: metadata.title,
            description: metadata.description,
          ),

          // Visual Examples
          VisualExamplesSection(
            examples: metadata.visualExamples,
          ),

          // Usage Guide
          UsageGuideSection(
            guide: metadata.usageGuide,
          ),

          // Code Examples
          CodeExamplesSection(
            examples: metadata.codeExamples,
          ),

          // Customization
          CustomizationSection(
            guide: metadata.customization,
          ),

          // Best Practices
          BestPracticesSection(
            practices: metadata.bestPractices,
          ),
        ],
      ),
    );
  }
}
```

### 3. Claude Code Skills Structure

#### 3.1 Skill Template

Each skill follows this structure:

**SKILL.md**:
```markdown
---
name: skill-name
description: |
  Specific, action-oriented description of what the skill helps with.
  Include relevant keywords and use cases.
type: anthropic-skill
version: "1.0"
---

# Skill Name

## Overview

Brief summary (1-2 paragraphs) explaining what this skill helps accomplish.

## Important Notes

- Key considerations
- Constraints
- Prerequisites

## Steps

### Step 1: [Action]

Detailed instructions...

```dart
// Code example
```

### Step 2: [Action]

...

## Examples

### Example 1: [Use Case]

```dart
// Complete example
```

### Example 2: [Use Case]

```dart
// Complete example
```

## Troubleshooting

Common issues and solutions:

- **Issue**: Description
  - **Solution**: How to fix

## Related Skills

- [other-skill-name] - Brief description
```

---

## Data Models

### Component Metadata Model

```dart
class ComponentMetadata {
  final String id;
  final String name;
  final String category;
  final String description;
  final String importStatement;
  final String quickExample;
  final Widget quickPreview;
  final Widget Function(BuildContext, PreviewConfig) previewBuilder;
  final List<ComponentVariation> variations;
  final List<ComponentState> states;
  final List<PropertyDefinition> properties;
  final List<CodeExample> examples;
  final List<VariantInfo> variants;
  final AccessibilityInfo accessibility;
  final List<String> relatedComponents;
  final String versionAdded;
  final ComponentStatus status;

  ComponentMetadata({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.importStatement,
    required this.quickExample,
    required this.quickPreview,
    required this.previewBuilder,
    required this.variations,
    required this.states,
    required this.properties,
    required this.examples,
    required this.variants,
    required this.accessibility,
    required this.relatedComponents,
    required this.versionAdded,
    required this.status,
  });
}

enum ComponentStatus {
  stable,
  beta,
  deprecated,
}
```

### Navigation Model

```dart
class NavigationNode {
  final String id;
  final String label;
  final String? path;
  final IconData? icon;
  final List<NavigationNode> children;
  final bool collapsible;

  NavigationNode({
    required this.id,
    required this.label,
    this.path,
    this.icon,
    this.children = const [],
    this.collapsible = true,
  });
}

class NavigationStructure {
  final List<NavigationNode> nodes;

  static NavigationStructure get documentation => NavigationStructure(
    nodes: [
      NavigationNode(
        id: 'getting-started',
        label: 'Getting Started',
        icon: CupertinoIcons.rocket,
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
          // Theme, Colors, Typography, etc.
        ],
      ),
      NavigationNode(
        id: 'components',
        label: 'Components',
        icon: CupertinoIcons.rectangle_3_offgrid,
        children: [
          // Component categories
        ],
      ),
      // More sections...
    ],
  );
}
```

### Search Index Model

```dart
class SearchableItem {
  final String id;
  final String title;
  final String type; // 'component', 'foundation', 'pattern', etc.
  final String path;
  final String description;
  final List<String> keywords;
  final int priority; // For ranking

  SearchableItem({
    required this.id,
    required this.title,
    required this.type,
    required this.path,
    required this.description,
    required this.keywords,
    this.priority = 0,
  });
}

class SearchResult {
  final SearchableItem item;
  final double score;
  final String? matchedText;

  SearchResult({
    required this.item,
    required this.score,
    this.matchedText,
  });
}
```

---

## Error Handling

### Web Application Error Handling

#### Preview Rendering Errors

```dart
class ComponentPreview extends StatefulWidget {
  @override
  _ComponentPreviewState createState() => _ComponentPreviewState();
}

class _ComponentPreviewState extends State<ComponentPreview> {
  Object? _error;

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return ErrorDisplay(
        error: _error!,
        onRetry: () => setState(() => _error = null),
      );
    }

    return ErrorBoundary(
      onError: (error, stackTrace) {
        setState(() => _error = error);
        // Log to analytics
        logError('Preview rendering failed', error, stackTrace);
      },
      child: _buildPreview(),
    );
  }
}
```

#### Network/Loading Errors

```dart
class ResourceLoader<T> extends StatelessWidget {
  final Future<T> future;
  final Widget Function(T data) builder;
  final Widget Function(Object error)? errorBuilder;
  final Widget? loadingWidget;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return errorBuilder?.call(snapshot.error!) ??
              DefaultErrorWidget(error: snapshot.error!);
        }

        if (!snapshot.hasData) {
          return loadingWidget ?? const CupertinoActivityIndicator();
        }

        return builder(snapshot.data!);
      },
    );
  }
}
```

### Build/Deployment Error Handling

#### CI/CD Pipeline

```yaml
# .github/workflows/deploy.yml
on:
  push:
    branches: [main]

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Build Flutter Web
        run: flutter build web --release
        continue-on-error: false

      - name: Generate dartdoc
        run: dart doc
        continue-on-error: false

      - name: Deploy to GitHub Pages
        if: success()
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./build/web

      - name: Notify on failure
        if: failure()
        uses: actions/github-script@v6
        with:
          script: |
            github.rest.issues.create({
              owner: context.repo.owner,
              repo: context.repo.repo,
              title: 'Documentation deployment failed',
              body: 'See workflow run for details',
              labels: ['bug', 'documentation']
            })
```

### Graceful Degradation

- **Search unavailable**: Show browse-by-category fallback
- **Preview fails**: Show static screenshot + code
- **Theme switching fails**: Default to light theme
- **Navigation fails**: Show sitemap/breadcrumbs

---

## Acceptance Criteria

### AC1: Quick Start Success
**Given** a Flutter developer new to iOS Design System
**When** they follow the Quick Start guide
**Then** they should have a working app with at least one iOS Design System component rendering correctly within 10 minutes

### AC2: Interactive Preview Functionality
**Given** a user viewing a component page
**When** they toggle between light and dark themes
**Then** the component preview should update instantly to reflect the selected theme
**And** all variations should be viewable in both themes

### AC3: Progressive Examples
**Given** a user viewing a component's usage section
**When** they view the code examples
**Then** examples should progress from minimal (5-10 lines) to complete (full implementation)
**And** each example should be runnable when copied

### AC4: Search Functionality
**Given** a user needs to find a specific component
**When** they search for the component name or related keyword
**Then** relevant results should appear within 200ms
**And** the top result should be the most relevant match

### AC5: Mobile Responsiveness
**Given** a user viewing documentation on a mobile device
**When** they navigate through pages
**Then** all content should be readable and usable
**And** navigation should be accessible via hamburger menu

### AC6: API Reference Integration
**Given** a user viewing a component tutorial
**When** they click on an API reference link
**Then** they should navigate to the corresponding dartdoc page
**And** navigation should remain consistent between sections

### AC7: Claude Code Skill Functionality
**Given** a developer using Claude Code
**When** they ask "how do I use the iOS Design System button"
**Then** the `ios-button-widget` skill should be invoked
**And** step-by-step guidance with code examples should be provided

### AC8: Color Documentation Completeness
**Given** a user viewing the Colors page
**When** they browse color palettes
**Then** all color schemes should be displayed with visual swatches
**And** each color should show hex/RGB values and usage guidelines
**And** WCAG contrast ratios should be documented

### AC9: Typography Specimens
**Given** a user viewing the Typography page
**When** they view font examples
**Then** all font weights (regular, medium, semibold, bold) should be displayed
**And** typography scale should show all available sizes
**And** code examples for each style should be provided

### AC10: Migration Guide Effectiveness
**Given** a developer currently using Flutter's Cupertino
**When** they follow the migration guide
**Then** they should understand key differences
**And** they should have code examples for common component migrations
**And** they should know when to use iOS Design System vs Cupertino

### AC11: Automated Deployment
**Given** documentation content is updated in the repository
**When** changes are pushed to the main branch
**Then** GitHub Actions should automatically build and deploy
**And** the live site should update within 5 minutes
**And** build failures should create GitHub issues automatically

### AC12: README Clarity
**Given** a developer discovers the iOS Design System repository
**When** they read the README
**Then** they should understand what the project is
**And** they should know where to find comprehensive documentation
**And** they should see a minimal code example (< 5 lines)

---

## Testing Strategy

### Unit Testing

#### Component Tests
```dart
testWidgets('ComponentPreview displays widget correctly', (tester) async {
  await tester.pumpWidget(
    TestApp(
      child: ComponentPreview(
        componentName: 'ButtonWidget',
        builder: (context, config) => ButtonWidget.label(
          label: 'Test',
          onPressed: () {},
        ),
        variations: [],
      ),
    ),
  );

  expect(find.byType(ButtonWidget), findsOneWidget);
  expect(find.text('Test'), findsOneWidget);
});

testWidgets('Theme toggle updates preview', (tester) async {
  await tester.pumpWidget(TestApp(child: ComponentPreview(...)));

  // Find and tap theme toggle
  await tester.tap(find.byIcon(CupertinoIcons.moon));
  await tester.pumpAndSettle();

  // Verify theme changed
  final theme = IosTheme.of(tester.element(find.byType(ButtonWidget)));
  expect(theme, isA<IosDarkThemeData>());
});
```

#### Search Tests
```dart
test('Search returns relevant results', () {
  final searchService = SearchService();
  final results = searchService.search('button');

  expect(results, isNotEmpty);
  expect(results.first.item.title, contains('Button'));
  expect(results.first.score, greaterThan(0.5));
});

test('Search handles special characters', () {
  final searchService = SearchService();
  final results = searchService.search('cupertino-button');

  expect(results, isNotEmpty);
});
```

### Integration Testing

#### Navigation Flow
```dart
testWidgets('User can navigate from home to component', (tester) async {
  await tester.pumpWidget(DocumentationApp());

  // Start at home
  expect(find.text('iOS Design System'), findsOneWidget);

  // Click on Getting Started
  await tester.tap(find.text('Getting Started'));
  await tester.pumpAndSettle();

  // Click on Quick Start
  await tester.tap(find.text('Quick Start'));
  await tester.pumpAndSettle();

  // Verify content loaded
  expect(find.text('10-Minute Quick Start'), findsOneWidget);
});
```

#### Preview Interaction
```dart
testWidgets('Interactive preview workflow', (tester) async {
  await tester.pumpWidget(DocumentationApp());

  // Navigate to ButtonWidget page
  await navigateToComponent(tester, 'ButtonWidget');

  // Verify preview exists
  expect(find.byType(ComponentPreview), findsOneWidget);

  // Change variation
  await tester.tap(find.text('Large'));
  await tester.pumpAndSettle();

  // Verify variation changed
  expect(find.byType(LargeButtonSize), findsOneWidget);

  // Toggle theme
  await tester.tap(find.byIcon(CupertinoIcons.moon));
  await tester.pumpAndSettle();

  // Verify dark theme applied
  // ... assertions
});
```

### Golden Testing

```dart
testWidgets('Component page golden test - light theme', (tester) async {
  await tester.pumpWidget(
    TestApp(
      theme: IosLightThemeData(),
      child: ComponentPage(metadata: buttonMetadata),
    ),
  );

  await expectLater(
    find.byType(ComponentPage),
    matchesGoldenFile('goldens/component_page_light.png'),
  );
});

testWidgets('Component page golden test - dark theme', (tester) async {
  await tester.pumpWidget(
    TestApp(
      theme: IosDarkThemeData(),
      child: ComponentPage(metadata: buttonMetadata),
    ),
  );

  await expectLater(
    find.byType(ComponentPage),
    matchesGoldenFile('goldens/component_page_dark.png'),
  );
});
```

### E2E Testing

Use Flutter integration tests for critical user journeys:

1. **First-time user journey**
   - Land on homepage
   - Read overview
   - Navigate to Quick Start
   - Copy first example
   - Verify example code

2. **Component exploration journey**
   - Search for "button"
   - Select ButtonWidget
   - View preview
   - Toggle theme
   - Change variation
   - Copy code example

3. **Migration journey**
   - Navigate to migration guide
   - Read comparison table
   - Follow migration example
   - Navigate to related component

### Claude Code Skills Testing

#### Manual Testing Checklist
For each skill:
- [ ] Skill loads when expected keywords are mentioned
- [ ] Instructions are clear and actionable
- [ ] Code examples are complete and correct
- [ ] Examples work when copied
- [ ] Links to documentation are valid
- [ ] Troubleshooting section addresses common issues

#### Automated Skill Validation
```python
# scripts/validate_skills.py
import yaml
import os

def validate_skill(skill_path):
    """Validate skill structure and content"""
    with open(os.path.join(skill_path, 'SKILL.md'), 'r') as f:
        content = f.read()

    # Check frontmatter
    assert content.startswith('---')
    frontmatter = yaml.safe_load(content.split('---')[1])
    assert 'name' in frontmatter
    assert 'description' in frontmatter
    assert len(frontmatter['description']) > 50  # Meaningful description

    # Check content sections
    assert '## Overview' in content
    assert '## Steps' in content or '## Usage' in content
    assert '## Examples' in content

    # Check code blocks
    code_blocks = content.count('```dart')
    assert code_blocks >= 2  # At least 2 examples

    print(f"✓ {frontmatter['name']} validated")

# Run for all skills
for skill_dir in os.listdir('.claude/skills/'):
    validate_skill(f'.claude/skills/{skill_dir}')
```

### Performance Testing

#### Load Time Testing
```dart
test('Documentation site loads within 3 seconds', () async {
  final stopwatch = Stopwatch()..start();

  await loadDocumentationSite();

  stopwatch.stop();
  expect(stopwatch.elapsedMilliseconds, lessThan(3000));
});
```

#### Preview Rendering Performance
```dart
test('Preview renders within 500ms', () async {
  final stopwatch = Stopwatch()..start();

  await renderPreview(ButtonWidget.label(label: 'Test', onPressed: () {}));

  stopwatch.stop();
  expect(stopwatch.elapsedMilliseconds, lessThan(500));
});
```

### Accessibility Testing

#### Screen Reader Testing
- Manual testing with VoiceOver (macOS) and TalkBack (Android)
- All interactive elements have semantic labels
- Navigation order is logical
- ARIA labels present where needed

#### Keyboard Navigation Testing
```dart
testWidgets('All interactive elements are keyboard accessible', (tester) async {
  await tester.pumpWidget(DocumentationApp());

  // Tab through all focusable elements
  for (int i = 0; i < 10; i++) {
    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pumpAndSettle();

    // Verify focus indicator visible
    expect(find.byType(FocusIndicator), findsOneWidget);
  }
});
```

#### Contrast Ratio Testing
- Automated tools: axe DevTools
- Manual verification of all color combinations
- Ensure WCAG 2.1 AA compliance (4.5:1 for normal text)

---

## Appendices

### Appendix A: Technology Choices

#### Flutter Web vs Alternatives

**Decision**: Build custom Flutter web documentation app

**Alternatives Considered**:
1. **Widgetbook** - Component development tool
   - Pros: Purpose-built, 2000+ teams use it, proven
   - Cons: Focused on development, not end-user docs; limited customization for Primer-like UX
   - Verdict: Great for development, but doesn't meet our web documentation requirements

2. **Static Site Generator (Docusaurus, VitePress)**
   - Pros: Fast, SEO-friendly, many templates
   - Cons: Can't run Flutter widgets natively; would need iframes or screenshots; limits interactivity
   - Verdict: Good for general docs, but can't provide live Flutter widget previews

3. **Flutter Official Widget Previewer**
   - Pros: Official tool, IDE integration
   - Cons: Experimental, IDE-focused, not for end users, can't embed in website
   - Verdict: Useful for development, not for documentation delivery

**Why Flutter Web**:
- Native Flutter widget rendering (no iframe hacks)
- Full control over UX to achieve Primer-like experience
- Theme switching built-in (IosAnimatedTheme)
- Can dogfood our own design system
- Mature in 2026 (WebAssembly GC, Hot Reload on web)
- Performance sufficient for documentation use case

#### Provider vs Riverpod vs Bloc

**Decision**: Provider for state management

**Rationale**:
- Simple use case (theme, navigation state)
- Well-documented, widely understood
- No need for Riverpod's advanced features
- Bloc would be overkill for this application
- Provider has great Flutter web support

#### GitHub Pages vs Alternatives

**Decision**: GitHub Pages for hosting

**Alternatives Considered**:
1. **Netlify** - Great CI/CD, preview builds
   - Pros: Excellent developer experience
   - Cons: Another service to manage; GitHub Pages is free and integrated
   - Verdict: Netlify is great but GitHub Pages meets all requirements

2. **Vercel** - Optimized for Next.js/React
   - Pros: Fast CDN, good DX
   - Cons: Flutter web not primary use case; extra service
   - Verdict: Not needed for our static site

3. **Firebase Hosting** - Google's hosting
   - Pros: Good Flutter integration
   - Cons: Overkill for static site; costs money at scale
   - Verdict: Unnecessary complexity

**Why GitHub Pages**:
- Free for open source
- Integrated with repository
- CDN included
- GitHub Actions integration
- Simple deployment workflow
- No external dependencies

#### dartdoc Integration Approach

**Decision**: Hybrid approach (separate dartdoc, unified navigation)

**Alternatives Considered**:
1. **Embedded iframes** - Iframe dartdoc into custom site
   - Pros: Easy integration
   - Cons: Styling inconsistency, navigation issues, SEO problems
   - Verdict: Poor user experience

2. **Link to pub.dev** - Just link to pub.dev docs
   - Pros: Zero maintenance
   - Cons: Inconsistent UX, no control, requires package publishing
   - Verdict: Not suitable for comprehensive docs

3. **Parse and regenerate** - Parse dartdoc output, regenerate in custom format
   - Pros: Complete control, consistent styling
   - Cons: Complex, high maintenance, reinventing wheel
   - Verdict: Too much effort for minimal gain

**Why Hybrid**:
- Generate dartdoc at `/api` subdirectory
- Link from main docs with clear navigation
- Shared header/footer for consistency
- Leverages dartdoc's strengths
- Low maintenance burden
- Users can choose tutorial vs API reference

### Appendix B: Research Findings Summary

**1. Flutter Web Documentation Frameworks**
- Widgetbook is most popular (2000+ teams) but for development
- Custom Flutter web app provides best control for end-user docs
- Flutter web mature in 2026 (WebAssembly improvements)

**2. GitHub Pages Deployment**
- Mature since 2022 (left beta)
- Multiple ready-to-use GitHub Actions
- Typical build time: 2-5 minutes
- Simple, automated workflow

**3. Dartdoc Integration**
- Official Dart documentation tool
- Supports categories, animations, custom templates
- Best as separate section with unified navigation
- Generate to `/api` subdirectory

**4. Interactive Widget Previews**
- Provider pattern for theme management
- Reusable ComponentPreview widget system
- Support variations (size, color, state)
- Syntax highlighting with flutter_highlight
- Progressive examples pattern

**5. Documentation Structure**
- Clear left sidebar, avoid deep hierarchies
- Getting Started → Foundation → Components → Patterns → API
- Search as primary discovery method
- Component pages: Description, Preview, Usage, API, Accessibility
- Mobile-responsive design essential

**6. Claude Code Skills**
- Markdown-based guides with YAML frontmatter
- Keep SKILL.md under 5,000 words
- Use REFERENCE.md for supplemental content
- Focus on specific, action-oriented descriptions
- Progressive disclosure with bundled resources

### Appendix C: Alternative Approaches Considered

#### Alternative 1: Widgetbook Cloud + Markdown Docs

**Approach**: Use Widgetbook Cloud for previews, separate markdown docs for guides

**Pros**:
- Fast to implement
- Proven component preview tool
- Good developer experience

**Cons**:
- Split experience (Widgetbook + docs site)
- Limited customization
- May require paid Widgetbook Cloud plan
- Can't achieve Primer-like integrated experience
- External dependency

**Why Not Chosen**: Doesn't meet requirement for integrated, Primer-like documentation website

#### Alternative 2: Storybook-style Static Site

**Approach**: Generate static HTML/JS site with embedded screenshots

**Pros**:
- Fast loading
- SEO-friendly
- Proven pattern

**Cons**:
- No live Flutter widgets (screenshots only)
- Can't show interactive theme switching
- Limited to static examples
- More work to update (regenerate screenshots)

**Why Not Chosen**: Doesn't meet requirement for interactive, live previews with theme variations

#### Alternative 3: Documentation Website + Separate Example App

**Approach**: Documentation website (Docusaurus) + downloadable example Flutter app

**Pros**:
- Clear separation of concerns
- Example app can showcase everything
- Fast documentation site

**Cons**:
- Users must download and run app to see components
- Doesn't provide web-based previews
- Friction in exploration process

**Why Not Chosen**: Fails 10-minute setup goal; users want to explore before installing

### Appendix D: Limitations and Constraints

#### Technical Limitations

1. **Flutter Web Performance**
   - Initial load time higher than pure HTML/CSS sites
   - Mitigation: Optimize bundle size, lazy loading, caching

2. **Search Functionality**
   - Client-side search may be slower with large doc sets
   - Mitigation: Pre-built search index, efficient algorithms, consider Algolia for future

3. **Mobile Preview Fidelity**
   - Web-based previews don't perfectly match native iOS
   - Mitigation: Clearly document this, encourage testing on real devices

4. **Browser Compatibility**
   - Flutter web requires modern browsers
   - Mitigation: Document browser requirements, provide fallback messaging

#### Content Limitations

1. **Maintenance Burden**
   - Documentation must be updated with every component change
   - Mitigation: Documentation as part of definition of done, automated checks

2. **Skill Coverage**
   - Can't create skills for every possible use case
   - Mitigation: Focus on most common use cases, provide general patterns

3. **Example Complexity**
   - Hard to show very complex, real-world usage in simple examples
   - Mitigation: Progressive examples, link to real projects using the system

#### Process Limitations

1. **Initial Implementation Time**
   - Building custom documentation app is significant effort
   - Mitigation: Phased rollout, start with foundation + key components

2. **Content Creation Time**
   - Writing comprehensive documentation for all components is time-consuming
   - Mitigation: Start with priority components, iterate based on usage

3. **CI/CD Dependency**
   - Deployment requires GitHub Actions to work
   - Mitigation: Document manual deployment process as backup

### Appendix E: Future Enhancements

#### Phase 2 Features (Post-Launch)

1. **Advanced Search**
   - Algolia DocSearch integration
   - Fuzzy matching
   - Search suggestions
   - Recent searches

2. **Code Playground**
   - DartPad integration for live editing
   - Fork and share examples
   - Embed playgrounds in component pages

3. **Component Generator**
   - CLI tool to scaffold new components
   - Includes tests, documentation template
   - Follows design system patterns

4. **Design Tokens Export**
   - Export colors, typography, spacing to JSON
   - Figma plugin integration
   - Design-dev workflow automation

5. **Analytics Dashboard**
   - Track most-viewed components
   - Search analytics
   - User journey insights
   - Documentation effectiveness metrics

6. **Internationalization**
   - Multi-language support
   - Start with Portuguese, Spanish
   - Community translations

7. **Version Selector**
   - Document multiple versions
   - Version-specific docs
   - Migration guides between versions

8. **Contribution Guide**
   - How to contribute components
   - Style guide for documentation
   - Review process

#### Phase 3 Features (Future)

1. **AI-Powered Documentation Assistant**
   - Answer questions about components
   - Generate example code
   - Suggest related components

2. **Visual Regression Testing**
   - Automated screenshot comparisons
   - Detect unintended visual changes
   - Integration with CI/CD

3. **Accessibility Checker**
   - Automated a11y testing
   - Real-time feedback in previews
   - WCAG compliance reporting

4. **Component Usage Analytics**
   - Track which components are actually used
   - Deprecation planning
   - Priority for improvements

---

## Design Review Checklist

Before proceeding to implementation plan:

- [ ] All requirements from requirements.md incorporated
- [ ] Architecture addresses all functional requirements
- [ ] Component interfaces are well-defined
- [ ] Data models support all use cases
- [ ] Error handling covers critical paths
- [ ] Acceptance criteria are testable and specific
- [ ] Testing strategy is comprehensive
- [ ] Technology choices are justified
- [ ] Research findings are incorporated
- [ ] Alternative approaches are documented
- [ ] Limitations are acknowledged
- [ ] Future enhancements are identified

---

**Version**: 1.0
**Status**: Ready for Review
**Date**: 2026-02-17
