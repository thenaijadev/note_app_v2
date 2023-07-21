import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class StopwatchNotifier extends StateNotifier<Duration> {
  Timer? _timer;
  StopwatchNotifier() : super(Duration.zero);

  bool get isRunning => _timer != null;

  void start() {
    if (!isRunning) {
      _timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
        state = state + const Duration(milliseconds: 100);
      });
    }
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  void reset() {
    stop();
    state = Duration.zero;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
