import 'package:flags_2_env_flutter/src/api/client.dart';
import 'package:flags_2_env_flutter/src/api/models.dart';
import 'package:flags_2_env_flutter/src/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders the connection snapshot passed into the app', (
    tester,
  ) async {
    const client = ApiClient(baseUrl: 'https://flags.example');
    final status = client.snapshot();
    expect(
      status,
      const ConnectionStatus(
        connected: false,
        endpoint: 'https://flags.example',
      ),
    );

    await tester.pumpWidget(Flags2EnvApp(status: status));

    expect(find.text('Not connected'), findsOneWidget);
    expect(find.text('https://flags.example'), findsOneWidget);
  });
}
