# iOS Design System

iOS Design System package for Flutter applications.

## Features

- iOS design system components
- Custom fonts and assets
- SVG support
- Flutter hooks integration

## Getting Started

### Prerequisites

- Flutter SDK (>=3.7.0 <4.0.0)
- Dart SDK

### Installation

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  ios_design_system:
    path: ../ios_design_system
```

Then run:

```bash
flutter pub get
```

## Development Setup

### Setting up MCP (Model Context Protocol)

MCP enables AI assistants to interact with your Dart/Flutter project through the Dart Tooling Daemon.

1. **Copy the example MCP configuration:**
   ```bash
   cp .cursor/mcp.json.example .cursor/mcp.json
   ```

2. **Update the Dart SDK path in `.cursor/mcp.json`:**
   ```json
   {
     "mcpServers": {
       "dart": {
         "command": "/path/to/your/flutter/bin/cache/dart-sdk/bin/dart",
         "args": ["mcp-server"]
       }
     }
   }
   ```
   
   To find your Flutter/Dart SDK path:
   ```bash
   which flutter
   # Then navigate to: <flutter_path>/bin/cache/dart-sdk/bin/dart
   ```

3. **Restart Cursor** to load the MCP configuration.

4. **Verify MCP is working:**
   - The Dart MCP server should automatically connect
   - You can use AI features with full Dart/Flutter context

**Note:** The `.cursor/mcp.json` file is already in `.gitignore` to keep your local configuration private.

### Setting up Ralph Orchestrator

Ralph Orchestrator is an AI-powered autonomous coding tool that can help with development tasks.

1. **Install Ralph Orchestrator:**
   ```bash
   # Install via npm (if you have Node.js)
   npm install -g ralph-orchestrator
   
   # Or via other package managers
   # See: https://github.com/mikeyobrien/ralph-orchestrator
   ```

2. **Initialize Ralph in this project:**
   ```bash
   ralph init --backend claude
   ```

3. **Copy the example configuration:**
   ```bash
   cp ralph.yml.example ralph.yml
   ```

4. **Configure your git settings in `ralph.yml`:**
   ```yaml
   git:
     user:
       name: "Your Name"  # Replace with your actual name
       email: "your.email@example.com"  # Replace with your actual email
   ```

5. **Customize other settings as needed:**
   - Branch prefix and naming
   - Commit message format
   - Auto-push behavior

6. **Create a `PROMPT.md` file** with your task description

7. **Run Ralph:**
   ```bash
   ralph run
   ```

**Note:** The `ralph.yml` file is in `.gitignore` to keep your personal configuration private. The `ralph.yml.example` file serves as a template for other developers.

### Git Configuration

If you prefer to use standard git configuration instead of Ralph's git settings:

```bash
# Global configuration (all repositories)
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Or per-repository configuration
git config user.name "Your Name"
git config user.email "your.email@example.com"
```

## Usage

```dart
import 'package:ios_design_system/ios_design_system.dart';

// Use iOS design system components
```

## Additional Information

For more information about:
- **Ralph Orchestrator**: [GitHub Repository](https://github.com/mikeyobrien/ralph-orchestrator)
- **MCP (Model Context Protocol)**: [MCP Documentation](https://modelcontextprotocol.io/)
- **Flutter Packages**: [Flutter Package Development Guide](https://flutter.dev/developing-packages)
