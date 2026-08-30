sealed class ConnectionStatus {
  const ConnectionStatus({required this.endpoint});

  final String endpoint;

  @override
  bool operator ==(Object other) =>
      other is ConnectionStatus &&
      runtimeType == other.runtimeType &&
      endpoint == other.endpoint;

  @override
  int get hashCode => Object.hash(runtimeType, endpoint);
}

final class Disconnected extends ConnectionStatus {
  const Disconnected({required super.endpoint});
}

final class Connecting extends ConnectionStatus {
  const Connecting({required super.endpoint});
}

final class Connected extends ConnectionStatus {
  const Connected({required super.endpoint});
}

final class ConnectionFailed extends ConnectionStatus {
  const ConnectionFailed({required super.endpoint});
}
