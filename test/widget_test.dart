import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week5_news_app/app.dart';

void main() {
  testWidgets('shows the app title', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: NewsApp()));
    expect(find.text('News App (Week 5)'), findsOneWidget);
  });
}
