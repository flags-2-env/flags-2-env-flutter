import 'package:flutter/widgets.dart';
import 'package:flags_2_env_flutter/src/api/client.dart';
import 'package:flags_2_env_flutter/src/app.dart';
import 'package:flags_2_env_flutter/src/env/env.dart' as env;

void main() {
  final overlay = env.load();
  final client = ApiClient(
    baseUrl: overlay['FLAGS_2_ENV_API_BASE'] ?? 'http://127.0.0.1:8080',
  );
  runApp(Flags2EnvApp(status: client.snapshot()));
}
