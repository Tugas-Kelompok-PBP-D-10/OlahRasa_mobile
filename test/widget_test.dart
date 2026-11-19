import 'package:flutter_test/flutter_test.dart';
import 'package:olahrasa_mobile/main.dart';

void main() {
  testWidgets('App builds and renders home shell', (WidgetTester tester) async {
    await tester.pumpWidget(const OlahRasaMobileApp());

    expect(find.text('OlahRasa - Recipes'), findsOneWidget);
  });
}