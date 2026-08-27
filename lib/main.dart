import 'package:flutter/widgets.dart';
import 'package:flags_2_env_flutter/src/api/client.dart';
import 'package:flags_2_env_flutter/src/app.dart';

void main() {
  const client = ApiClient(baseUrl: 'unset');
  runApp(Flags2EnvApp(status: client.snapshot()));
}
