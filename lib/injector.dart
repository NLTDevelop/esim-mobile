
import 'dart:async';

import 'package:esim_mob_app/core/utils/logger/logger.dart';
import 'package:get_it/get_it.dart';

typedef _InitializationStep = FutureOr<void> Function();

final injector = GetIt.instance;

final Map<String, _InitializationStep> _initializationSteps = {};

Future<void> initializeDependencies({
  void Function(int progress, String message)? onProgress,
}) async {
  final stopwatch = Stopwatch()..start();
  final totalSteps = _initializationSteps.length;
  int currentStep = 0;
  onProgress?.call(currentStep, 'Initializing dependencies...');
  try {
    for (final step in _initializationSteps.entries) {
      //TODO: Remove delayed
      await Future.delayed(const Duration(milliseconds: 50));
      final progress = (currentStep * 100 ~/ totalSteps).clamp(0, 100);
      currentStep++;
      Logger.info('Progress: ${step.key}');
      onProgress?.call(progress, step.key);
      await step.value();
    }
    // onAuth.call(await fetchCurrentUser());
    onProgress?.call(100, 'Dependencies initialized in ${stopwatch.elapsedMilliseconds}ms');
  } finally {
    stopwatch.stop();
  }
}


Future<void> baseSteps() async{

}