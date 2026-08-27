import 'package:flutter/material.dart';

import 'api/models.dart';
import 'home_page.dart';
import 'theme.dart';

class Flags2EnvApp extends StatelessWidget {
  const Flags2EnvApp({super.key, required this.status});

  final ConnectionStatus status;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flags-2-env',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: HomePage(status: status),
    );
  }
}
