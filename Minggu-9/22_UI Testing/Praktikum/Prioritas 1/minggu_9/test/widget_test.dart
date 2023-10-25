import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minggu_9/page/Contact_page/Contact_page.dart';

void main() {
  testWidgets('Test Add Contact Function', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ContactPage(),
    ));

    await tester.enterText(find.byKey(const Key('NameTextField')), 'John Doe');
    await tester.pump();

    await tester.enterText(
        find.byKey(const Key('NomorTextField')), '+123456789');
    await tester.pump();

    await tester.tap(find.byKey(const Key('SubmitButton')));
    await tester.pump();

    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('+123456789'), findsOneWidget);
  });
}
