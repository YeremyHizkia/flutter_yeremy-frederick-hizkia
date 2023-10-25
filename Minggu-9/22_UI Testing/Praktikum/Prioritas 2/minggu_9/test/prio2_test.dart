import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minggu_9/page/Prioritas%202/prioritas%202.dart';

void main() {
  testWidgets('Test Prioritas 2 UI', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Prioritas2(),
    ));

    expect(find.text('Prioritas 2'), findsOneWidget);
    expect(find.text('Untuk Prioritas 2 testing.'), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
  });
}
