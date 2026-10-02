import 'package:flutter/widgets.dart';

class LifecycleEvent {
  const LifecycleEvent({required this.state, required this.timestamp});

  final AppLifecycleState state;
  final DateTime timestamp;

  String get label {
    switch (state) {
      case AppLifecycleState.resumed:
        return 'Reanudada';
      case AppLifecycleState.inactive:
        return 'Inactiva';
      case AppLifecycleState.paused:
        return 'Pausada';
      case AppLifecycleState.detached:
        return 'Desconectada';
      case AppLifecycleState.hidden:
        return 'Oculta';
    }
  }

  String get timeLabel {
    final h = timestamp.hour.toString().padLeft(2, '0');
    final m = timestamp.minute.toString().padLeft(2, '0');
    final s = timestamp.second.toString().padLeft(2, '0');
    return '$h:$m:$s';
  }
}
