import 'package:flutter_test/flutter_test.dart';

import 'package:exre/main.dart';
import 'package:exre/widgets/app_tab_bar.dart';

void main() {
  testWidgets('ExRE muestra la pantalla de inicio con accesos rápidos',
      (WidgetTester tester) async {
    await tester.pumpWidget(const ExreApp());

    expect(find.text('ExRE'), findsOneWidget);
    expect(find.text('Catálogo'), findsWidgets);
    expect(find.byType(AppTabBar), findsOneWidget);
  });
}
