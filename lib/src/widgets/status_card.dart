import 'package:flutter/material.dart';

import '../api/models.dart';

String connectionLabel(ConnectionStatus status) => switch (status) {
      Disconnected() => 'Not connected',
      Connecting() => 'Connecting',
      Connected() => 'Connected',
      ConnectionFailed() => 'Connection failed',
    };

class StatusCard extends StatelessWidget {
  const StatusCard({super.key, required this.status});
  final ConnectionStatus status;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(connectionLabel(status)),
        subtitle: Text(status.endpoint),
      ),
    );
  }
}
