import 'package:flutter_test/flutter_test.dart';
import 'package:risk_drive/main.dart';

void main() {
  testWidgets('Risk Drive App loads successfully', (tester) async {
    await tester.pumpWidget(const RiskDriveApp());
    expect(find.text('Risk Drive'), findsOneWidget);
    expect(find.text('مرحبًا 👋'), findsOneWidget);
    expect(find.text('حالة الأمان'), findsOneWidget);
    expect(find.text('بدء المراقبة'), findsOneWidget);
  });
}
