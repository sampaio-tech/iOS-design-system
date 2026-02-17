# Dartdoc Integration and API Reference

## Overview

Research on using dartdoc for generating API documentation and integrating it with custom documentation.

## What is Dartdoc?

- **Description**: Non-interactive HTML documentation generator for Dart source code
- **Command**: `dart doc` (part of Dart SDK)
- **Execution**: Run from the root directory of a package
- **Output**: Static HTML files in `doc/api` directory by default

**Sources:**
- [dartdoc Package](https://pub.dev/packages/dartdoc)
- [dart doc - Dart Tools](https://dart.dev/tools/dart-doc)
- [dartdoc GitHub](https://github.com/dart-lang/dartdoc)

## Configuration

### dartdoc_options.yaml

Create `dartdoc_options.yaml` in the package root directory to customize documentation generation.

**Source:**
- [Master Flutter Documentation: A Guide to Using Dartdoc](https://www.dhiwise.com/post/getting-started-with-dartdoc-tips-for-generating-dart-api-docs)

## Customization Features

### 1. Categories

Tag libraries or top-level classes/functions/variables with `{@category YourCategory}` directive:

```dart
/// {@category Buttons}
/// A customizable button widget.
class ButtonWidget extends StatelessWidget {
  // ...
}
```

This causes items to appear in categories in the sidebar on Package and Library pages.

### 2. Tool Directives

Inject raw HTML into dartdoc output without Markdown processing:

```dart
/// {@tool snippet}
/// Custom HTML or generated content
/// {@end-tool}
```

Useful when external tool output is HTML.

### 3. Animation Support

Display videos/animations in documentation:

```dart
/// {@animation 640 480 https://example.com/video.mp4}
/// Description of the animation
/// {@end-animation}
```

Creates a simple player in the documentation.

### 4. Custom Templates

Dartdoc supports custom templates for advanced customization:
- Users can modify HTML templates
- Need to update templates when dartdoc refactors (e.g., Container class changes)
- Allows complete control over documentation appearance

**Source:**
- [Flutter Dart Documentation](https://medium.com/codex/flutter-dart-documentation-791371ff2e0f)

## Documentation Comments Best Practices

### Structure

```dart
/// Brief one-line summary.
///
/// More detailed description with multiple paragraphs if needed.
///
/// Example:
/// ```dart
/// final button = ButtonWidget(
///   label: 'Click me',
///   onPressed: () => print('Clicked'),
/// );
/// ```
///
/// See also:
/// - [RelatedWidget] for similar functionality
/// - [AnotherWidget] for alternative approach
class ButtonWidget extends StatelessWidget {
  /// Creates a button widget.
  ///
  /// The [label] parameter must not be null.
  const ButtonWidget({
    required this.label,
    this.onPressed,
  });

  /// The button label text.
  final String label;

  /// Called when the button is tapped.
  ///
  /// If null, the button will be disabled.
  final VoidCallback? onPressed;
}
```

### Key Elements

1. **Brief Summary**: First line should be a concise summary
2. **Detailed Description**: Additional paragraphs with context
3. **Code Examples**: Use triple backticks for code blocks
4. **Parameter Documentation**: Document each parameter
5. **Cross-References**: Link to related classes/methods with `[ClassName]`
6. **Sections**: Use "Example:", "See also:", "Note:" for organization

## Integration with Custom Documentation

### Approach 1: Embedded iframes

- Generate dartdoc HTML
- Embed in custom documentation using iframes
- **Pros**: Easy integration
- **Cons**: Styling inconsistency, navigation challenges

### Approach 2: Link to Separate API Docs

- Host dartdoc separately (e.g., `/api/`)
- Link from main documentation
- **Pros**: Clean separation, dartdoc optimized
- **Cons**: Context switching for users

### Approach 3: Parse and Regenerate

- Parse dartdoc JSON/HTML output
- Regenerate in custom format
- **Pros**: Consistent styling, integrated experience
- **Cons**: Complex implementation, maintenance overhead

### Approach 4: Hybrid Navigation

- Generate dartdoc as separate section
- Unified navigation/search across both
- Shared header/footer for consistency
- **Pros**: Best user experience
- **Cons**: Requires custom tooling

## pub.dev Integration

When package is published to pub.dev:
- API documentation automatically generated
- Hosted at `pub.dev/documentation/package_name/latest/`
- Uses dartdoc under the hood
- No additional configuration needed

**Note**: For unpublished packages or custom hosting, manual dartdoc generation required.

## Workflow Integration

### Local Development
```bash
# Generate docs locally
dart doc

# View docs
open doc/api/index.html
```

### CI/CD Integration
```yaml
- name: Generate API documentation
  run: dart doc

- name: Deploy API docs
  # Copy doc/api to docs website /api/ directory
```

## Recommended Approach for iOS Design System

Given requirements:
- Comprehensive documentation
- Tutorial + reference sections
- Interactive website

**Recommendation**: Hybrid Approach

1. **Generate dartdoc** for complete API reference
2. **Host at `/api/` subdirectory** on GitHub Pages
3. **Link from main docs** with clear navigation
4. **Shared navigation bar** between tutorial and API sections
5. **Unified search** across both (future enhancement)

### Benefits
- Leverage dartdoc's strengths for API reference
- Focus custom development on tutorials and interactive previews
- Lower maintenance burden
- Users can choose tutorial vs reference as needed

### Implementation
```
docs/
  ├── index.html          # Main documentation site (Flutter web)
  ├── tutorials/          # Built-in tutorial pages
  ├── components/         # Interactive component previews
  └── api/               # Generated dartdoc output
      └── index.html
```

## Documentation Quality Standards

For the iOS Design System, all public APIs should have:
- Brief summary (1 line)
- Detailed description with context
- Code example showing typical usage
- Parameter documentation
- Return value documentation (for methods)
- Category tags for organization
- Cross-references to related components

This ensures dartdoc generates comprehensive, useful API documentation.
