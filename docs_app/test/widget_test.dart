import 'package:flutter_test/flutter_test.dart';

import 'package:ios_design_system_docs/app.dart';

void main() {
  testWidgets('DocumentationApp builds successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const DocumentationApp());

    // Verify that the app title is present (appears in header and homepage).
    expect(find.text('iOS Design System'), findsWidgets);

    // Verify key elements are present
    expect(find.text('Features'), findsOneWidget);
    expect(find.text('Getting Started'), findsOneWidget);
  });
}
