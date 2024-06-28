import 'dart:async';

import 'package:async_button_demo/gs/bloc/async_button_state.dart';
import 'package:flutter/material.dart';

class CancellableException implements Exception {
  CancellableException();
}

abstract class CancellableTask {
  Completer<void>? _completer;

  void cancel() {
    if (_completer != null && !_completer!.isCompleted) {
      _completer!.completeError('Cancelled');
    }
  }

  bool completed() => _completer?.isCompleted ?? false;

  void reset() => _completer = Completer<void>();

  Future<AsyncButtonState> startTask();
}

// This class is used to simulate a long-running task that can be cancelled
class CancellableClass extends CancellableTask {
  static const exception = 'Cancelled';

  @override
  Future<AsyncButtonState> startTask() async {
    reset();
    try {
      // Simulate a long-running task with periodic cancellation checks
      for (int i = 1; i <= 10; i++) {
        debugPrint('Second: $i');
        await Future.delayed(const Duration(seconds: 1));
        if (_completer != null && _completer!.isCompleted) {
          throw CancellableException();
        }
      }
      return AsyncButtonState.success;
    } on CancellableException {
      return AsyncButtonState.cancel;
    } on Exception {
      return AsyncButtonState.failure;
    }
  }
}
