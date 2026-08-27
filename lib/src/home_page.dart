import 'package:flutter/material.dart';

import 'api/models.dart';
import 'widgets/status_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.status});

  final ConnectionStatus status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('flags-2-env')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: StatusCard(status: status),
      ),
    );
  }
}
